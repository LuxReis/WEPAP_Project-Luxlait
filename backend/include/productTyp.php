
<?php
// productType.php from author @LuxLait (Tim frisch)


// Get database connection details from JAWSDB_URL environment variable
$url = getenv('JAWSDB_URL');

// Parse the URL to extract connection details
$dbparts = parse_url($url);

$hostname = $dbparts['host'];
$username = $dbparts['user'];
$password = $dbparts['pass'];
$database = ltrim($dbparts['path'], '/');

// Create connection
$connection = mysqli_connect($hostname, $username, $password, $database);

// Check connection
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if the productType parameter is set and not empty
if (isset($_GET['productType'])) {
    $productType = mysqli_real_escape_string($connection, $_GET['productType']); // Prevent SQL injection

    // Prepare and execute SQL query
    $query = "SELECT tblType.dtType, tblType.dtDescription, tblType.dtImage
              FROM tblType 
              INNER JOIN tblCategory ON tblType.fiCategory = tblCategory.idCategory WHERE tblCategory.dtName = ?";
    $stmt = mysqli_prepare($connection, $query);
    mysqli_stmt_bind_param($stmt, "s", $productType);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    // Check if the query was successful
    if ($result) {
        // Store data in an array
        $data = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = array(
                'dtType' => $row['dtType'],
                'dtDescription' => $row['dtDescription'],
                'dtImage' => $row['dtImage'],
            );
        }

        // Output results as JSON
        echo json_encode($data);
    } else {
        // Display error message and return HTTP status code 400
        http_response_code(400);
        echo "Abfrage fehlgeschlagen: " . mysqli_error($connection);
        // Optional: Log errors to a log file
        error_log("Abfrage fehlgeschlagen: " . mysqli_error($connection));
    }
} else {
    // If the productType was not provided, return HTTP status code 400
    http_response_code(400);
    echo "Produkttyp nicht angegeben.";
}

// Close database connection
mysqli_close($connection);
?>
