<?php
// checkLogin from author @LuxLait (Tim frisch)
session_start();

// Initialisiere die Antwort als assoziatives Array
$response = array();

// Überprüfe, ob die Benutzersitzung gesetzt ist
if (isset($_SESSION['username']) && isset($_SESSION['rights'])) {
    // Benutzersitzung ist gesetzt
    $response['username'] = $_SESSION["username"];
    $response['rights'] = $_SESSION['rights'];
} else {
    // Benutzersitzung ist nicht gesetzt
    $response['username'] = false;
    $response['rights'] = false;
}

// Sende die Antwort als JSON zurück
header('Content-Type: application/json');
echo json_encode($response);
?>
