<?php
/* feedback.php from author @Luxbaut (Friederici Thibaut)*/
session_start();
// Include your database connection code here
$url = getenv('JAWSDB_URL');
$dbparts = parse_url($url);

$hostname = $dbparts['host'];
$username = $dbparts['user'];
$password = $dbparts['pass'];
$database = ltrim($dbparts['path'], '/');

try {
    // Establish a PDO connection with database
    $dsn = "mysql:host=$hostname;dbname=$database;charset=utf8";
    $options = array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    );
    $connection = new PDO($dsn, $username, $password, $options);
} catch (PDOException $e) {
    // Return an error message if the connection fails
    echo json_encode(array('error' => 'Database connection failed'));
    exit();
}

if (isset($_GET["ratingRange"])) {
    // Retrieve all rating IDs from the database
    $querySelect = "SELECT idRating FROM tblRating";

    $result = $connection->query($querySelect);

    $ratingRange = $result->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($ratingRange);
}

if (isset($_SESSION['username'])) {
    if (isset($_GET['checkIfRated'])) {
        $checkID = $_GET['checkIfRated'];

        // Check if the product has been delivered
        $queryCheckDelivered = "SELECT fiUsername, fiProduct FROM tblShoppingCart AS sc
                                INNER JOIN tblHave AS h ON sc.idCart = h.fiCart 
                                INNER JOIN tblPayment AS p ON p.idPayment = h.fiPayment 
                                INNER JOIN tblDelivery AS d ON p.idPayment = d.fiPayment 
                                WHERE d.dtStatus = 'Delivered' AND fiUsername = :username AND fiProduct = :productID;";

        $stmt = $connection->prepare($queryCheckDelivered);
        $stmt->execute(array(':productID' => $checkID, ':username' => 'ribpe261'));
        $productID = $stmt->fetch(PDO::FETCH_COLUMN);

        if ($productID) {
            // If product is delivered, check if it's rated
            $queryCheckIfRated = "SELECT fiUsername, fiRating FROM tblProductRating
                                  WHERE fiProduct = :product AND fiUsername = :username;";
            $stmtInner = $connection->prepare($queryCheckIfRated);
            $stmtInner->execute(array(':product' => $productID, ':username' => 'ripbe261'));
            $productRating = $stmtInner->fetch(PDO::FETCH_ASSOC);

            if (!$productRating) {
                // If no rating is found, return false
                echo json_encode("Not rated yet");
                return; // Exit the script
            } else {
                // If a rating is found, return the product ID
                echo json_encode(array("ratings" => $productID));
                return; // Exit the script
            }
        } else {
            // If no products are found, return false
            echo json_encode("No Delivery");
            return; // Exit the script
        }
    }
}

// Close the database connection
$connection = null;

?>
