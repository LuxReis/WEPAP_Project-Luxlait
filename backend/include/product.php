
<?php
// product.php from author @LuxLait (Tim frisch) 

// Get the JAWSDB_URL from environment variables
$url = getenv('JAWSDB_URL');

// Parse the URL to extract connection details
$dbparts = parse_url($url);

$hostname = $dbparts['host'];
$username = $dbparts['user'];
$password = $dbparts['pass'];
$database = ltrim($dbparts['path'], '/');
try {

    // Establish database connection using mysqli
    $connection = mysqli_connect($hostname, $username, $password, $database);

    // Check connection
    if (!$connection) {
        die("Verbindung fehlgeschlagen: " . mysqli_connect_error());
    }

    // Check if type parameter is set in GET request
    if (isset($_GET['type'])) {
        $productType = $_GET['type'];
        $data = fetchProductsByType($connection, $productType);
    } else {
        // If type parameter is not set, fetch all products
        $data = fetchAllProducts($connection);
    }


    // Close connection
    mysqli_close($connection);

    // Send JSON response
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($data);
} catch (Exception $e) {
    // Handle any exceptions
    die('Error: ' . $e->getMessage());
}

function fetchProductsByType($connection, $productType)
{
    $data = array(); // Initialize $data array
    // Prepare and execute query to get type ID
    $query = "SELECT * FROM tblType WHERE dtType = ?";
    $stmt = mysqli_prepare($connection, $query);
    mysqli_stmt_bind_param($stmt, "s", $productType);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    // Check if type exists
    if ($row = mysqli_fetch_assoc($result)) {
        $id = $row["idType"];
        $backgroundImage = $row["dtBackgroundImage"];
        $type = $row["dtType"];
        $icons = $row["dtIcons"];
        $iconsDescriptions = $row["dtIconsDescription"];
        // Prepare and execute query to get products of the specified type with the specified rating
        $query = "SELECT p.*, AVG(pr.fiRating) AS averageRating
        FROM tblProduct p
        LEFT JOIN tblProductRating pr ON p.idProduct = pr.fiProduct
        WHERE p.fiType = ?
        GROUP BY p.idProduct
        ORDER BY averageRating DESC";

        $stmt = mysqli_prepare($connection, $query);
        mysqli_stmt_bind_param($stmt, "s", $id); // Nur ein Parameter wird erwartet
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        // Check if products exist for the type within the price range
        if ($result->num_rows > 0) {
            // Fetch products and append to data array
            while ($row = mysqli_fetch_assoc($result)) {
                $data[] = array(
                    'dtIcons' => $icons,
                    'dtIconsDescriptions' => $iconsDescriptions,
                    'dtbackgroundImage' => $backgroundImage,
                    'dtType' => $type,
                    'dtCode' => $row['dtProductCode'],
                    'idProduct' => $row['idProduct'],
                    'dtProduct' => $row['dtProduct'],
                    'dtMetricUnit' => $row['dtMetricUnit'],
                    'dtPrice' => $row['dtPrice'],
                    'dtFat' => $row['dtFat'],
                    'dtPackage' => $row['dtPackage'],
                    'dtImage' => $row['dtImage'],
                    'averageRating' => $row['averageRating'], // Add averageRating to the data array
                );
            }
        } else {
            // No products found for the specified type within the price range
            $data = array('error' => 'No products found for the specified type within the price range.');
        }
    }
    return $data;
}

// Function to fetch all products
function fetchAllProducts($connection)
{
    // Prepare and execute query to fetch all products
    $query = "SELECT * FROM tblProduct";
    $result = mysqli_query($connection, $query);

    // Check if products exist
    if (mysqli_num_rows($result) > 0) {
        $data = array();
        // Fetch products and append to data array
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
    } else {
        // No products found
        $data = array('error' => 'No products found.');
    }
    return $data;
}
