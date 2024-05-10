<?php
    // @author GUO Kaidi PHP for account page
    // Start the session for the login (username)
    session_start();

    // Get JAWSDB_URL from environment variables
    $url = getenv('JAWSDB_URL');
    $dbparts = parse_url($url);

    // Extract connection details
    $hostname = $dbparts['host'];
    $username = $dbparts['user'];
    $password = $dbparts['pass'];
    $database = ltrim($dbparts['path'], '/');

    // For error message variable
    $error_message = '';

    try {
        // Create a new MySQLi connection
        $connection = new mysqli($hostname, $username, $password, $database);

        // Check for connection errors
        if ($connection->connect_error) {
            throw new Exception("Connection failed: " . $connection->connect_error);
        }

        // Check if username is set in session
        if (!isset($_SESSION['username'])) {
            throw new Exception("Username not set in session");
        } 

        // Function to execute SQL queries safely
        function executeQuery($connection, $sql, $bindParams = null) {
            $stmt = $connection->prepare($sql);
            if (!$stmt) {
                throw new Exception("Error preparing SQL statement: " . $connection->error);
            }
            if ($bindParams) {
                $stmt->bind_param(...$bindParams);
            }
            if (!$stmt->execute()) {
                throw new Exception("Error executing SQL statement: " . $stmt->error);
            }
            return $stmt->get_result();
        }

        // Function to get account information based on username
        function getInfo($connection, $username) {
            $sqlInfo = "SELECT dtFirstName, dtLastName, dtHouseNR, dtStreet, dtCity, dtEmail, dtTelephone,
                        dtPLZ, dtCountry
                        FROM tblUser 
                        WHERE idUsername = ?";
            $resultInfo = executeQuery($connection, $sqlInfo, array("s", $username));
            $info = array(); // Initialize $info here
            if ($resultInfo->num_rows > 0) {
                while ($rowInfo = $resultInfo->fetch_assoc()) {
                    // Add the account information to the array
                    $info[] = array(
                        'firstname' => $rowInfo['dtFirstName'],
                        'lastname' => $rowInfo['dtLastName'],
                        'email' => $rowInfo['dtEmail'],
                        'telephone' => $rowInfo['dtTelephone'],
                        'houseNR' => $rowInfo['dtHouseNR'],
                        'street' => $rowInfo['dtStreet'],
                        'city' => $rowInfo['dtCity'],
                        'plz' => $rowInfo['dtPLZ'],
                        'country' => $rowInfo['dtCountry']
                    );
                }
            } else {
                $info = "No Information found";
            }
            return $info; // Return $info
        }

        // Function to get credit card information based on username
        function getCC($connection, $username) {
            $sqlCC = "SELECT dtCardNumber, dtCardHolder, dtValidDate, dtCVV
                        FROM tblUser 
                        WHERE idUsername = ?";
            $resultCC= executeQuery($connection, $sqlCC, array("s", $username));
            $creditCard = array(); 
            if ($resultCC->num_rows > 0) {
                while ($rowCC = $resultCC->fetch_assoc()) {
                    $creditCard[] = array(
                        'cardNumber' => $rowCC['dtCardNumber'],
                        'cardHolder' => $rowCC['dtCardHolder'],
                        'validDate' => $rowCC['dtValidDate'],
                        'CVV' => $rowCC['dtCVV']
                    );
                }
            } else {
                $creditCard = "No credit card found";
            }
            return $creditCard; // Return $creditCard
        }

        // Process data if no error occurred
        if (empty($error_message)) {
            // Get account information 
            $getInfo = getInfo($connection, $_SESSION['username']);
            // Get credit card information 
            $getCC = getCC($connection, $_SESSION['username']); 

            // Check if the delete flag is set
            if (isset($_GET['delete']) && $_GET['delete'] == true){
                // Delete user from the database
                $delUser = "DELETE FROM tblUser WHERE idUsername = ?";
                $resultDelUser = executeQuery($connection, $delUser, array("s", $_SESSION['username']));

                // Set delete message
                $delMsg = "User deleted successfully.";
                // Clear session data
                session_unset();
                session_destroy();

            } else {
                $delMsg = "No GET delete set.";
            }

            // Check if profile update data is present in GET request
            if (isset($_GET['firstName']) && isset($_GET['lastName']) && isset($_GET['email'])
                && isset($_GET['telephone']) && isset($_GET['houseNr']) && isset($_GET['street'])
                && isset($_GET['city']) && isset($_GET['plz']) && isset($_GET['country'])){

                // Process form data
                $firstName = $_GET['firstName'];
                $lastName = $_GET['lastName'];
                $email = $_GET['email'];
                $telephone = $_GET['telephone'];
                $houseNr = $_GET['houseNr'];
                $street = $_GET['street'];
                $city = $_GET['city'];
                $plz = $_GET['plz'];
                $country = $_GET['country'];

                // Check if inputs are valid
                $pErrors = array();

                // Check first name
                if (empty($firstName)) {
                    $pErrors[] = "First name is required.";
                }

                // Check last name
                if (empty($lastName)) {
                    $pErrors[] = "Last name is required.";
                }

                // Check email
                if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $pErrors[] = "Invalid email address.";
                }

                // Check telephone number
                if (!empty($telephone) && !preg_match("/^[0-9]{10}$/", $telephone)) {
                    $pErrors[] = "Invalid telephone number.";
                }

                // Check house number
                if (empty($houseNr)) {
                    $pErrors[] = "House number is required.";
                }

                // Check postal code
                if (empty($plz) || !preg_match("/^[0-9]{4,6}$/", $plz)) {
                    $pErrors[] = "Invalid postal code.";
                }

                // If there are no errors, update account information
                if (empty($pErrors)) {
                    $updateAccInfo = "UPDATE tblUser 
                                    SET dtFirstName = ?, dtLastName = ?, dtEmail = ?, dtTelephone = ?,
                                        dtHouseNR = ?, dtStreet = ?,
                                        dtCity = ?, dtPLZ = ?, dtCountry = ?
                                    WHERE idUsername = ?";
                    $stmtAccInfo = $connection->prepare($updateAccInfo);
                    if (!$stmtAccInfo) {
                        $pErrors[] = "Error preparing SQL statement: " . $connection->error;
                    }
                    $stmtAccInfo->bind_param("ssssssssss", $firstName, $lastName, $email, 
                                            $telephone, $houseNr, $street, $city, $plz, $country, $_SESSION['username']);
                    if (!$stmtAccInfo->execute()) {
                        $pErrors[] = "Error updating account information: " . $stmtAccInfo->error;
                    }
                    $pErrors[] = "Successfully user updated";
                }

            } else {
                $pErrors[] = "No Get Information.";
            }

            // Check if credit card update data is present in GET request
            if (isset($_GET['cardNumber']) && isset($_GET['cardHolder']) 
                && isset($_GET['validDate']) && isset($_GET['CVV'])){
                $cardNumber = $_GET['cardNumber'];
                $cardHolder = $_GET['cardHolder'];
                $validDate = $_GET['validDate'];
                $CVV = $_GET['CVV'];

                // Check if inputs are valid
                $cErrors = array();

                // Validate card number
                if (!preg_match('/^\d{16}$/', $cardNumber)) {
                    $cErrors[] = "Invalid card number.";
                }

                // Validate expiry date
                if (!preg_match('/^(0[1-9]|1[0-2])\/?\d{2}$/', $validDate)) {
                    $cErrors[] = "Invalid expiry date.";
                }

                // Validate CVV
                if (!preg_match('/^\d{3}$/', $CVV)) {
                    $cErrors[] = "Invalid CVV.";
                }

                // If there are no errors, update credit card information
                if (empty($cErrors)) {
                    $updateCardInfo = "UPDATE tblUser 
                                        SET dtCardNumber = ?, dtCardHolder = ?, dtValidDate = ?, dtCVV = ? 
                                        WHERE idUsername = ?";
                        $stmtCardInfo = $connection->prepare($updateCardInfo);
                        if (!$stmtCardInfo) {
                            $cErrors[] = "Error preparing SQL statement: " . $connection->error;
                        }
                        $stmtCardInfo->bind_param("sssss", $cardNumber, $cardHolder, $validDate, $CVV, $_SESSION['username']);
                        if (!$stmtCardInfo->execute()) {
                            $cErrors[] = "Error updating card information: " . $stmtCardInfo->error;
                        }
                
                    $cErrors[] = "Successfully credit card updated";
                }

            } else {
                $cErrors[] = "No Get credit card.";
            }
        }

        // Set response content type to JSON
        header('Content-Type: application/json; charset=utf-8');

        // Return JSON response with data or error message
        if (!empty($error_message)) {
            echo json_encode(array("error" => $error_message));
        } else {
            echo json_encode(array("info" => $getInfo , "creditCard" => $getCC, 
                                "delMsg" => $delMsg, "updatePMsg" => $pErrors, "updateCCMsg" => $cErrors));
        }

    } catch (Exception $e) {
        // Catch any exceptions and store error message
        $error_message = "Error: " . $e->getMessage();
    }

    // Close database connection
    $connection->close();
?>
