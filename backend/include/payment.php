<?php
    // Author GUO Kaidi PHP for order page
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
    // Save the ID from Payment in variable
    $paymentID = "";

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

        // Function to get orders based on username
        function getOrder($connection, $username) {
            $sqlOrder = "SELECT p.dtImage, p.dtProduct, sc.dtAmount, pay.dtTotalPrice, pay.idPayment
                        FROM tblShoppingCart sc
                        INNER JOIN tblUser AS u ON sc.fiUsername = u.idUsername
                        INNER JOIN tblProduct AS p ON sc.fiProduct = p.idProduct
                        INNER JOIN tblHave AS h ON sc.idCart = h.fiCart
                        INNER JOIN tblPayment AS pay ON h.fiPayment = pay.idPayment
                        WHERE sc.fiUsername = ?
                        AND pay.dtStatus = 'Unpaid'";         
            $resultOrder = executeQuery($connection, $sqlOrder, array("s", $username));
            $orders = array(); // Initialize $orders here
            if ($resultOrder->num_rows > 0) {
                while ($rowOrder = $resultOrder->fetch_assoc()) {
                    // Put each orders in the array
                    $orders[] = array(
                        'image' => $rowOrder['dtImage'],
                        'product' => $rowOrder['dtProduct'],
                        'amount' => $rowOrder['dtAmount'],
                        'total' => $rowOrder['dtTotalPrice']
                    );
                    // Set the variable paymentID
                    global $paymentID;
                    $paymentID = $rowOrder['idPayment'];
                }
            } else {
                $orders = "No product found";
            }
            return $orders; // Return $orders
        }

        // Function to get account information based on username
        function getAccInfo($connection, $username) {
            $sqlInfo = "SELECT dtFirstName, dtLastName, dtHouseNR, dtStreet, dtCity, 
                        dtPLZ, dtCountry, dtCardNumber, dtCardHolder, dtValidDate, dtCVV
                        FROM tblUser 
                        WHERE idUsername = ?";
            $resultInfo = executeQuery($connection, $sqlInfo, array("s", $username));
            $accInfo = array(); // Initialize $accInfo here
            if ($resultInfo->num_rows > 0) {
                while ($rowInfo = $resultInfo->fetch_assoc()) {
                    // Add the account inforamtion in the array
                    $accInfo[] = array(
                        'firstname' => $rowInfo['dtFirstName'],
                        'lastname' => $rowInfo['dtLastName'],
                        'houseNR' => $rowInfo['dtHouseNR'],
                        'street' => $rowInfo['dtStreet'],
                        'city' => $rowInfo['dtCity'],
                        'plz' => $rowInfo['dtPLZ'],
                        'country' => $rowInfo['dtCountry'],
                        'cardNumber' => $rowInfo['dtCardNumber'],
                        'cardHolder' => $rowInfo['dtCardHolder'],
                        'validDate' => $rowInfo['dtValidDate'],
                        'CVV' => $rowInfo['dtCVV']
                    );
                }
            } else {
                $accInfo = "No Information found";
            }
            return $accInfo; // Return $accInfo
        }

        // Function to insert order and update database
        function insertToDatabase($connection, $username, $id) {
            // Check if all required form data is present
            if (isset($_GET['cardNumber']) && isset($_GET['cardHolder']) && isset($_GET['validDate']) 
                && isset($_GET['CVV']) && isset($_GET['firstName']) && isset($_GET['lastName']) 
                && isset($_GET['houseNr']) && isset($_GET['street']) && isset($_GET['city']) 
                && isset($_GET['plz']) && isset($_GET['country'])) {
                
                // Extract form data
                $firstName = $_GET['firstName'];
                $lastName = $_GET['lastName'];
                $houseNr = $_GET['houseNr'];
                $street = $_GET['street'];
                $city = $_GET['city'];
                $plz = $_GET['plz'];
                $country = $_GET['country'];
                $saveNewCard = $_GET['saveNewCard'];
                $cardNumber = $_GET['cardNumber'];
                $cardHolder = $_GET['cardHolder'];
                $validDate = $_GET['validDate'];
                $CVV = $_GET['CVV'];

                // Initialize errors array
                $errors = array();

                // Validate card number
                if (!preg_match('/^\d{16}$/', $cardNumber)) {
                    $errors[] = "<p>Invalid card number.</p>";
                }

                // Validate expiry date
                if (!preg_match('/^(0[1-9]|1[0-2])\/?\d{2}$/', $validDate)) {
                    $errors[] = "<p>Invalid expiry date.</p>";
                }

                // Validate CVV
                if (!preg_match('/^\d{3}$/', $CVV)) {
                    $errors[] = "<p>Invalid CVV.</p>";
                }

                // Validate postal code
                if (!preg_match('/^\d{4,6}$/', $plz)) {
                    $errors[] = "<p>Invalid postal code.</p>";
                }

                // If there are errors, return error messages
                if (!empty($errors)) {
                    return array("msg" => $errors);
                } else {
                    // Update card information if user chooses to save new card
                    if (isset($saveNewCard) && $saveNewCard == true) {
                        $updateCardInfo = "UPDATE tblUser 
                                        SET dtCardNumber = ?, dtCardHolder = ?, dtValidDate = ?, dtCVV = ? 
                                        WHERE idUsername = ?";
                        $stmtCardInfo = $connection->prepare($updateCardInfo);
                        if (!$stmtCardInfo) {
                            return array("msg" => "Error preparing SQL statement: " . $connection->error);
                        }
                        $stmtCardInfo->bind_param("sssss", $cardNumber, $cardHolder, $validDate, $CVV, $username);
                        if (!$stmtCardInfo->execute()) {
                            return array("msg" => "Error updating card information: " . $stmtCardInfo->error);
                        }
                    }

                    // Update account information
                    $updateAccInfo = "UPDATE tblUser 
                                    SET dtFirstName = ?, dtLastName = ?, dtHouseNR = ?, dtStreet = ?,
                                        dtCity = ?, dtPLZ = ?, dtCountry = ?
                                    WHERE idUsername = ?";
                    $stmtAccInfo = $connection->prepare($updateAccInfo);
                    if (!$stmtAccInfo) {
                        return array("msg" => "Error preparing SQL statement: " . $connection->error);
                    }
                    $stmtAccInfo->bind_param("ssisssss", $firstName, $lastName, $houseNr, $street, $city, $plz, $country, $username);
                    if (!$stmtAccInfo->execute()) {
                        return array("msg" => "Error updating account information: " . $stmtAccInfo->error);
                    }

                    // Insert a new Delivery
                    $insertDelivery = "INSERT INTO tblDelivery(dtStatus, fiPayment) VALUES (?,?)";
                    $stmtDelivery = $connection->prepare($insertDelivery);
                    if (!$stmtDelivery) {
                        return array("msg" => "Error preparing SQL statement: " . $connection->error);
                    }
                    $delviery = "Pending";
                    $stmtDelivery->bind_param("si", $delviery, $id);
                    if (!$stmtDelivery->execute()) {
                        return array("msg" => "Error updating account information: " . $stmtAccInfo->error);
                    }

                    // Update payment status to 'Paid'
                    $updatePay = "UPDATE tblPayment 
                                    SET dtStatus = 'Paid' 
                                    WHERE idPayment = ?";
                    $stmtPay = $connection->prepare($updatePay);
                    if (!$stmtPay) {
                        return array("msg" => "Error preparing SQL statement: " . $connection->error);
                    }
                    $stmtPay->bind_param("i", $id);
                    if ($stmtPay->execute()) {
                        return array("msg" => "Order placed successfully!");
                    } else {
                        return array("msg" => "Error inserting order unsuccessfully!");
                    }
                }
            } else {
                return array("msg" => "Missing required data.");
            }
        }

        // Process data if no error occurred
        if (empty($error_message)) {
            // Get order and account information
            $orders = getOrder($connection, $_SESSION['username']); 
            $accInfo = getAccInfo($connection, $_SESSION['username']); 
            $insertToDatabase = insertToDatabase($connection, $_SESSION['username'], $paymentID);
        }

        // Set response content type to JSON
        header('Content-Type: application/json; charset=utf-8');

        // Return JSON response with data or error message
        if (!empty($error_message)) {
            echo json_encode(array("error" => $error_message));
        } else {
            echo json_encode(array("orders" => $orders, "account_info" => $accInfo, "insert" => $insertToDatabase));
        }

    } catch (Exception $e) {
        // Catch any exceptions and store error message
        $error_message = "Error: " . $e->getMessage();
    }

    // Close database connection
    $connection->close();

?>
