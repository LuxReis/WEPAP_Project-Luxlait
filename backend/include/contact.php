<?php
// contact.php from author @LuxJoghurt (Pedro Ribeiro Costa)

$url = getenv('JAWSDB_URL');
$dbparts = parse_url($url);

$hostname = $dbparts['host'];
$username = $dbparts['user'];
$password = $dbparts['pass'];
$database = ltrim($dbparts['path'], '/');

// Verbindung zur Datenbank herstellen
try {
    $dsn = "mysql:host=$hostname;dbname=$database;charset=utf8";
    $options = array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    );
    $dbc = new PDO($dsn, $username, $password, $options);
} catch (PDOException $e) {
    die('Connect Error: ' . $e->getMessage());
}

// SQL-Abfrage vorbereiten und ausführen
$sql = "SELECT dtFirstName AS first_name, dtLastName AS last_name, dtEmail AS email, dtRole AS role FROM tblUser WHERE dtRole NOT IN ('Admin', 'Staff', 'Client')";
$stmt = $dbc->prepare($sql);
$stmt->execute();

// Ergebnisse verarbeiten
$staffMembers = array();
if ($stmt->rowCount() > 0) {
    while ($row = $stmt->fetch()) {
        $staffMembers[] = array(
            'name' => $row['first_name'] . ' ' . $row['last_name'],
            'email' => $row['email'],
            'role' => $row['role']
        );
    }
    $staffJson = json_encode($staffMembers);
    echo $staffJson;
} else {
    echo "Keine Mitarbeiter gefunden";
}

// Verbindung schließen
$dbc = null;
?>