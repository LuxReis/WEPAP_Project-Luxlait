<?php
// Funktion zur Herstellung der Datenbankverbindung
function dbConnections()
{
    require_once 'backend/db/db_credentials.php';
    $dbc = mysqli_connect($hostname, $username, $password, $database);
    if (mysqli_connect_errno()) {
        die('Connect Error (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
    } else {
        mysqli_set_charset($dbc, 'utf8');
        return $dbc;
    }
}
