
<?php
// stats.php from author @ForLu102 (Formica Luca)

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

    // SQL query to retrieve data
    $query = "SELECT dtProduct ,SUM(dtAmount) AS ranking FROM tblShoppingCart INNER JOIN tblHave ON idCart = fiCart INNER JOIN tblProduct ON idProduct = fiProduct GROUP BY fiProduct ORDER BY ranking DESC;";

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
