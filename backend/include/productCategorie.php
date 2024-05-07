
<?php
// productCatalog.php from author @LuxLait (Tim frisch)

 // Get the JAWSDB_URL from environment variables
 $url = getenv('JAWSDB_URL');

 // Parse the URL to extract connection details
 $dbparts = parse_url($url);

 $hostname = $dbparts['host'];
 $username = $dbparts['user'];
 $password = $dbparts['pass'];
 $database = ltrim($dbparts['path'], '/');
try {
    // Establish database connection using PDO
    $dsn = "mysql:host=$hostname;dbname=$database;charset=utf8";
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ];
    $pdo = new PDO($dsn, $username, $password, $options);

    // Prepare and execute SQL query
    $query = "SELECT dtName, dtDescription, dtImage FROM tblCategory";
    $stmt = $pdo->query($query);

    // Fetch data into an associative array
    $data = $stmt->fetchAll();

    // Close connection
    $pdo = null;

    // Return data as JSON
    header('Content-Type: application/json');
    echo json_encode($data);
} catch (PDOException $e) {
    // Handle errors
    die('Connect Error: ' . $e->getMessage());
}
?>