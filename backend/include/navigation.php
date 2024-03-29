<?php
// Verbindung zur Datenbank herstellen
require_once "backend/functions/db_connectionFunctions.php";
$dbc = dbConnections();

// SQL-Abfrage ausführen
$query = "SELECT dtName FROM tblCategory";
$result = mysqli_query($dbc, $query);

// Überprüfen, ob die Abfrage erfolgreich war
if (!$result) {
    die("Abfrage fehlgeschlagen: " . mysqli_error($dbc));
}

// Daten in ein Array speichern
$data = array();
while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row['dtName'];
}

// Ergebnis freigeben
mysqli_free_result($result);

// Verbindung schließen
mysqli_close($dbc);

// Daten als JSON zurückgeben
header('Content-Type: application/json');
echo json_encode($data);
?>
