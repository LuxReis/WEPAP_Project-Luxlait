<?php
//stats_me.php from author @ForLu102 (Formica Luca) 

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

    // SQL query to calculate the total sum of dtTotalPrice from tblPayment table
    $query = "SELECT SUM(dtTotalPrice) AS GesamtsummeEuro
    FROM tblPayment";

    // Perform the query
    $result = mysqli_query($connection, $query);

    // Check if query was successful
    if ($result) {
        $data = mysqli_fetch_assoc($result);
        // Format the total sum as Euro
        $totalEuro = number_format($data['GesamtsummeEuro'], 2, ',', '.') . ' €';
        // Output the formatted total as JSON
        echo json_encode(['GesamtsummeEuro' => $totalEuro]);
    } else {
        echo "Query failed: " . mysqli_error($connection);
    }

    // Close connection
    mysqli_close($connection);

} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>