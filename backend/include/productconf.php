<?php
/* productconf.php from author @Luxbaut (Friederici Thibaut)*/

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

// Check if request is for retrieving product codes
if (isset($_GET['productCode'])) {
    $querySelectProductCode = "SELECT DISTINCT dtProductCode AS product_code FROM tblProduct";
    $stmt = $connection->prepare($querySelectProductCode);
    $stmt->execute();
    $categories = $stmt->fetchAll();
}

// Check if request is for editing product
if (isset($_GET['editProduct'])) {
    $combinedSelectArray = [];
    $querySelectCategory = "SELECT idCategory AS category_id, dtName AS category_name FROM tblCategory";
    $stmt = $connection->prepare($querySelectCategory);
    $stmt->execute();
    $categories = $stmt->fetchAll();

    foreach ($categories as $category) {
        $categoryId = $category['category_id'];
        $querySelectType = "SELECT DISTINCT idType AS type_id, dtType AS type_name FROM tblType WHERE fiCategory = :category";
        $stmt = $connection->prepare($querySelectType);
        $stmt->execute(array(':category' => $categoryId));
        $stmt->execute();
        $types = $stmt->fetchAll();
        $combinedSelectArray['category_type'][$categoryId] = $types;
    }

    echo json_encode($combinedSelectArray);
}

// Check if request is for retrieving product list
if (isset($_GET['productList'])) {
    $currentProduct = $_GET['productList'];

    if ($currentProduct > 0 && is_numeric($currentProduct)) {
        $currentProduct--;

        // Prepare the SQL statement
        $querySelectProductList = "SELECT 
                                        c.idCategory AS category_id,
                                        c.dtName AS category_name,
                                        c.dtDescription AS category_description,
                                        c.dtImage AS category_image,
                                        t.idType AS type_id,
                                        t.dtType AS type_name,
                                        t.dtDescription AS type_description,
                                        t.dtImage AS type_image,
                                        t.dtBackgroundImage AS type_background_image,
                                        t.dtIcons AS type_icon,
                                        t.dtIconsDescription AS type_icon_description,
                                        p.idProduct AS product_id,
                                        p.dtProductCode AS product_code,
                                        p.dtProduct AS product_name,
                                        p.dtMetricUnit AS product_metric,
                                        p.dtPrice AS product_price,
                                        p.dtFat AS product_fat,
                                        p.dtImage AS product_image,
                                        p.dtPackage AS product_package,
                                        (SELECT AVG(fiRating) FROM tblProductRating WHERE fiProduct = p.idProduct) AS product_rating  
                                    FROM 
                                        tblCategory AS c 
                                        INNER JOIN tblType AS t ON c.idCategory = t.fiCategory
                                        INNER JOIN tblProduct AS p ON t.idType = p.fiType 
                                    ORDER BY 
                                        p.idProduct ASC 
                                    LIMIT 1 OFFSET :currentPage;";

        // Prepare and execute the statement
        $stmt = $connection->prepare($querySelectProductList);
        $stmt->bindParam(':currentPage', $currentProduct, PDO::PARAM_INT);
        $stmt->execute();

        // Check if execution was successful
        if ($stmt->rowCount() > 0) {
            // Fetch the results
            $productList = $stmt->fetchAll();
            echo json_encode($productList);
        } else {
            // No results found
            echo json_encode(array('error' => 'No products found'));
        }
    } else {
        // Invalid input
        echo json_encode(array('error' => 'Invalid input'));
    }
}

// Check if request is for retrieving total number of products
if (isset($_GET['productAmount'])) {
    // Prepare the SQL statement
    $querySelectMaxProducts = "SELECT COUNT(*) AS product_max_amount FROM tblProduct;";

    // Prepare and execute the statement
    $stmt = $connection->prepare($querySelectMaxProducts);
    $stmt->execute();

    // Check if execution was successful
    if ($stmt->rowCount() > 0) {
        // Fetch the results
        $productMax = $stmt->fetchAll();
        echo json_encode($productMax);
    } else {
        // No results found
        echo json_encode(array('error' => 'No product count found'));
    }
}

$connection = null;

?>
