<?php
session_start();
// Include your database connection code here

$url = getenv('JAWSDB_URL');
$dbparts = parse_url($url);

$hostname = $dbparts['host'];
$username = $dbparts['user'];
$password = $dbparts['pass'];
$database = ltrim($dbparts['path'], '/');

try {
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

// Function to retrieve all cart IDs for the current user
function getAllCartIDs($connection)
{
    $querySelectCartIDs = "SELECT sc.idCart
                            FROM tblShoppingCart sc
                            LEFT JOIN tblHave h ON sc.idCart = h.fiCart
                            LEFT JOIN tblPayment pm ON h.fiPayment = pm.idPayment
                            WHERE h.fiCart IS NULL
                            AND sc.fiUsername = :username
                            ORDER BY sc.idCart;";

    $stmt = $connection->prepare($querySelectCartIDs);
    $stmt->execute(array(':username' => $_SESSION['username']));

    $cartIDs = $stmt->fetchAll();

    return $cartIDs;
}

// Function to retrieve the ID of the last payment made
function getLastPaymentID($connection)
{
    $querySelectPayment = "SELECT idPayment FROM tblPayment ORDER BY idPayment DESC LIMIT 1";
    $stmt = $connection->prepare($querySelectPayment);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    return $result['idPayment'];
}

// Function to check if there are more unpaid orders for the current user
function checkIfMoreUnpaid($connection)
{
    $querySelectUnpaid = "SELECT COUNT(*) AS unpaidCount
                          FROM tblPayment AS p
                          LEFT JOIN tblHave AS h ON p.idPayment = h.fiPayment
                          LEFT JOIN tblShoppingCart AS sc ON h.fiCart = sc.idCart
                          WHERE p.dtStatus = 'Unpaid' AND fiUsername = :username";
    $stmt = $connection->prepare($querySelectUnpaid);
    $stmt->execute(array(':username' => $_SESSION['username']));
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($result['unpaidCount'] == 0) {
        return true;
    } else {
        return false;
    }
}

// Check if user is logged in
if (isset($_SESSION['username'])) {

    // Check if request is for retrieving cart item count
    if (isset($_GET['cartAmount'])) {
        $querySelectCartAmount = "SELECT COUNT(*) as cartCount
                                  FROM tblShoppingCart sc
                                  LEFT JOIN tblHave h ON sc.idCart = h.fiCart
                                  LEFT JOIN tblPayment pm ON h.fiPayment = pm.idPayment
                                  WHERE h.fiCart IS NULL
                                  AND sc.fiUsername = :username
                                  ORDER BY sc.idCart;";
        $stmt = $connection->prepare($querySelectCartAmount);
        $stmt->execute(array(':username' => $_SESSION['username']));
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        echo json_encode($result['cartCount']);
    }

    // Check if request is for retrieving cart items
    if (isset($_GET["cart"])) {
        $querySelectCart = "SELECT sc.idCart, sc.dtAmount, p.dtProduct, p.dtMetricUnit, p.dtPrice, 
                                   p.dtFat, p.dtImage, p.dtPackage, tp.dtType, tc.dtName
                            FROM tblShoppingCart sc
                            INNER JOIN tblProduct AS p ON sc.fiProduct = p.idProduct
                            INNER JOIN tblType AS tp ON p.fiType = tp.idType
                            INNER JOIN tblCategory AS tc ON tp.fiCategory = tc.idCategory
                            LEFT JOIN tblHave h ON sc.idCart = h.fiCart
                            LEFT JOIN tblPayment pm ON h.fiPayment = pm.idPayment
                            WHERE h.fiCart IS NULL
                            AND sc.fiUsername = :username
                            ORDER BY sc.idCart;";

        $stmt = $connection->prepare($querySelectCart);
        $stmt->execute(array(':username' => $_SESSION['username']));

        $cart = $stmt->fetchAll();

        echo json_encode($cart);
    }

    // Check if request is for updating cart item quantity
    if (isset($_GET['id']) && isset($_GET['quantity'])) {
        $cartID = $_GET['id'];
        $newQuantity = $_GET['quantity'];

        if ($newQuantity == 0) {
            $queryDelete = "DELETE FROM tblShoppingCart WHERE fiUsername = :username AND idCart = :cartID";
            $stmtDelete = $connection->prepare($queryDelete);
            $stmtDelete->execute(array(':username' => $_SESSION['username'], ':cartID' => $cartID));
            echo json_encode("Item removed from cart!");
        } else {
            $queryUpdate = "UPDATE tblShoppingCart SET dtAmount = :newQuantity WHERE fiUsername = :username AND idCart = :cartID";
            $stmtUpdate = $connection->prepare($queryUpdate);
            $stmtUpdate->execute(array(':newQuantity' => $newQuantity, ':username' => $_SESSION['username'], ':cartID' => $cartID));
            echo json_encode("Cart item quantity updated!");
        }
    }

    // Check if request is for retrieving address details for delivery
    if (isset($_GET['address'])) {
        $combinedAddress = [];
        $origin = "3, Am Seif, 7759, Bissen, Luxembourg";
        $destination = [];

        $querySelectCartAddress = "SELECT dtHouseNR, dtPLZ, dtStreet, dtCity
        FROM tblUser
        WHERE idUsername = :username";

        $stmt = $connection->prepare($querySelectCartAddress);
        $stmt->execute(array(':username' => $_SESSION['username']));

        $destination = $stmt->fetchAll();

        $combinedAddress = [
            'origin' => $origin,
            'destination' => $destination
        ];

        echo json_encode($combinedAddress);
    }

    // Check if request is for adding total price to session and updating payment section
    if (isset($_GET['addTotalPrice'])) {
        if (!is_nan($_GET['addTotalPrice'])) {
            if ($_GET['addTotalPrice'] != 0) {
                if (checkIfMoreUnpaid($connection)) {
                    $totalPrice = $_GET['addTotalPrice'];
                    $currentDate = date('Y-m-d H:i:s');
                    $status = 'Unpaid';


                    $queryInsert = "INSERT INTO tblPayment (dtDate,dtTotalPrice,dtStatus) VALUES (:currentDate , :totalPrice, :paymentStatus)";
                    $stmtInsert = $connection->prepare($queryInsert);
                    $stmtInsert->execute(array(':currentDate' => $currentDate, ':totalPrice' => $totalPrice, ':paymentStatus' => $status));


                    $idPayment = getLastPaymentID($connection);
                    $cartItems = getAllCartIDs($connection);

                    foreach ($cartItems as $cartItem) {
                        $cartID = $cartItem['idCart'];
                        $queryInsert = "INSERT INTO tblHave (fiCart, fiPayment) VALUES ( :cart, :payment)";
                        $stmtInsert = $connection->prepare($queryInsert);
                        $stmtInsert->execute(array(':cart' => $cartID, ':payment' => $idPayment));
                    }


                    echo json_encode('Payment section update successful');
                } else {
                    echo json_encode('Please complete existing order payment first');
                }
            } else {
                echo json_encode('Please enter a number above 0');
            }
        } else {
            echo json_encode('Please enter a valid number');
        }
    }
}

// Close the database connection
$connection = null;

?>
