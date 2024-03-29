<?php
// Verbindung zur Datenbank herstellen
include_once "backend\db\db_credentials.php";
$dbc = mysqli_connect('DB_HOST', 'DB_USER', 'DB_PASSWORD', 'DB_NAME');

// Überprüfen der Verbindung
if (mysqli_connect_errno()) {
    die("Verbindung fehlgeschlagen: " . mysqli_connect_error());
}

// SQL-Abfrage ausführen
$query = "SELECT dtName FROM tblCategory";
$result = mysqli_query($connection, $query);

// Überprüfen, ob die Abfrage erfolgreich war
if (!$result) {
    die("Abfrage fehlgeschlagen: " . mysqli_error($connection));
}

// Daten in ein Array speichern
$data = array();
while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row['dtName'];
}

// Ergebnis freigeben
mysqli_free_result($result);

// Verbindung schließen
mysqli_close($connection);

// Daten als JSON zurückgeben
header('Content-Type: application/json');
echo json_encode($data);
?>