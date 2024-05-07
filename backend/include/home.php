<?php
//home.php from author @LuxJoghurt (Pedro Ribeiro Costa)

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
        PDO::ATTR_EMULATE_PREPARES => false,
    );
    $connection = new PDO($dsn, $username, $password, $options);
} catch (PDOException $e) {
    // Return an error message if the connection fails
    echo json_encode(array('error' => 'Database connection failed'));
    exit();
}

// Query to fetch three random recipes
$query = "SELECT * FROM tblRecipe ORDER BY RAND() LIMIT 3";

// Execute the query
$result = $connection->query($query);

// Check if the query was successful
if ($result) {
    // Initialize an empty array to store recipe data
    $recipes = array();

    // Fetch recipe information
    while ($row = $result->fetch()) {
        // Add recipe information to the recipes array
        $recipes[] = array(
            'id' => $row['idRecipe'],
            'name' => $row['dtName'],
            'description' => $row['dtDescription'],
            'image' => $row['dtImage']
        );
    }

    // Return the recipes as JSON
    echo json_encode($recipes);
} else {
    // Return an error message if the query fails
    echo json_encode(array('error' => 'Failed to fetch recipes'));
}

// Close the database connection
$connection = null;
?>
