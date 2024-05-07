<?php
// stats_pp.php from author @ForLu102 (Formica Luca)
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

    // SQL query to calculate average rating for each product
    $query = "SELECT p.dtProduct, SUM(pr.fiRating) AS AverageRating
    FROM tblProduct p
    JOIN tblProductRating pr ON p.idProduct = pr.fiProduct
    GROUP BY p.dtProduct
    ORDER BY AverageRating DESC;";

    // Perform the query
    $result = mysqli_query($connection, $query);

    // Check if query was successful
    if ($result) {
        $data = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
        // Encode the data as JSON and output it
        echo json_encode($data);
    } else {
        echo "Query failed: " . mysqli_error($connection);
    }

    // Close connection
    mysqli_close($connection);

} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>
