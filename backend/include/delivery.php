<?php
    // @author GUO Kaidi PHP for delivery page
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

        // Function to get delivery based on username
        function getDelivery($connection, $username) {
            // SQL query to fetch delivery information
            $sqlDelivery = "SELECT d.idDelivery, d.dtStatus, p.dtDate, p.dtTotalPrice
                            FROM tblDelivery d
                            JOIN tblPayment p ON d.fiPayment = p.idPayment
                            JOIN tblHave h ON d.fiPayment = h.fiPayment
                            JOIN tblShoppingCart sc ON h.fiCart = sc.idCart
                            JOIN tblUser u ON sc.fiUsername = u.idUsername
                            WHERE u.idUsername = ? AND p.dtStatus = 'Paid'
                            GROUP BY d.idDelivery";         
            $resultDelivery = executeQuery($connection, $sqlDelivery, array("s", $username));
            $deliverys = array(); // Initialize $delivery here
            if ($resultDelivery->num_rows > 0) {
                while ($rowDelivery = $resultDelivery->fetch_assoc()) {
                    // Put each delivery in the array
                    $deliverys[] = array(
                        "delivery" => $rowDelivery['idDelivery'],
                        "status" => $rowDelivery['dtStatus'],
                        "date" => $rowDelivery['dtDate'],
                        "price" => $rowDelivery['dtTotalPrice']
                    );
                }
            } else {
                $deliverys = "No delivery found";
            }
            return $deliverys; // Return $deliverys
        }

        // Function to get destination address based on username
        function getDestination($connection, $username) {
            // SQL query to fetch destination address
            $sqlDestination = "SELECT dtHouseNR, dtStreet, dtCity, dtPLZ
                                FROM tblUser
                                WHERE idUsername = ?";
            $resultDestination = executeQuery($connection, $sqlDestination, array("s", $username));
            if ($resultDestination->num_rows > 0) {
                
                $rowDestination = $resultDestination->fetch_assoc();
                $destination = $rowDestination['dtHouseNR'] .", ". $rowDestination['dtStreet'] .", ".
                                $rowDestination['dtPLZ'] ." ". $rowDestination['dtCity'];
            } else {
                $destination = "No delivery found";
            }
            return $destination; 
        }

        // Function to get product information for a particular delivery
        function getInfo($connection) {
            if (isset($_GET['deliveryID'])){
                $id = $_GET['deliveryID'];
    
                // SQL query to fetch product information
                $sqlInfo = "SELECT p.dtImage, p.dtProduct, sc.dtAmount, p.dtPrice
                            FROM tblShoppingCart sc
                            INNER JOIN tblProduct AS p ON sc.fiProduct = p.idProduct
                            INNER JOIN tblHave AS h ON sc.idCart = h.fiCart
                            INNER JOIN tblPayment AS pay ON h.fiPayment = pay.idPayment
                            INNER JOIN tblDelivery AS d ON h.fiPayment = d.fiPayment 
                            WHERE d.idDelivery = ?";
                $resultInfo = executeQuery($connection, $sqlInfo, array("i", $id));
                $info = array(); // Initialize $info here
                if ($resultInfo->num_rows > 0) {
                    while ($rowInfo = $resultInfo->fetch_assoc()) {
                        // Put each product info in the array
                        $info[] = array(
                            "image" => $rowInfo['dtImage'],
                            "product" => $rowInfo['dtProduct'],
                            "amount" => $rowInfo['dtAmount'],
                            "price" => $rowInfo['dtPrice']
                        );
                    }
                }
                return $info;
            } else {
                return array(); // Return empty array if no details found
            }
        }

        // Process data if no error occurred
        if (empty($error_message)) {
            // Fetch delivery, destination, and product info
            $getdelivery = getDelivery($connection, $_SESSION['username']);
            $getDestination = getDestination($connection, $_SESSION['username']);
            $getInfo = getInfo($connection);

            // Update delivery status to 'Shipping' after 6 hours
            $updateShippingStatus = "UPDATE tblDelivery d
                                     JOIN tblPayment p ON d.fiPayment = p.idPayment
                                     SET d.dtStatus = 'Shipping'
                                     WHERE d.dtStatus = 'Pending' 
                                     AND TIMESTAMPDIFF(HOUR, p.dtDate, NOW()) >= 6 
                                     AND d.fiPayment > 0
                                     AND d.idDelivery > 0";

            // Update delivery status to 'Delivered' after 24 hours
            $updateDeliveredStatus = "UPDATE tblDelivery d
                                      JOIN tblPayment p ON d.fiPayment = p.idPayment
                                      SET d.dtStatus = 'Delivered'
                                      WHERE d.dtStatus = 'Shipping'
                                      AND TIMESTAMPDIFF(HOUR, p.dtDate, NOW()) >= 24 
                                      AND d.fiPayment > 0
                                      AND d.idDelivery > 0";

            // Execute the update queries
            executeQuery($connection, $updateShippingStatus);
            executeQuery($connection, $updateDeliveredStatus);
        }

        // Set response content type to JSON
        header('Content-Type: application/json; charset=utf-8');

        // Return JSON response with data or error message
        if (!empty($error_message)) {
            echo json_encode(array("error" => $error_message));
        } else {
            echo json_encode(array("delivery" => $getdelivery, "destination" => $getDestination, "info" => $getInfo));
        }

    } catch (Exception $e) {
        // Catch any exceptions and store error message
        $error_message = "Error: " . $e->getMessage();
    }

    // Close database connection
    $connection->close();

?>
