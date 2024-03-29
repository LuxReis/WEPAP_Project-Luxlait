<?php

require_once "backend/functions/db_connectionFunctions";
$dbc = dbConnections();

$sql = "SELECT dtFirstName AS first_name, dtLastName AS last_name, dtEmail AS email, dtRole AS role FROM tblUser WHERE dtRole NOT IN ('Admin', 'Staff', 'Client')";
$result = mysqli_query($dbc, $sql);

if (mysqli_num_rows($result) > 0) {
    $staffMembers = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $staffMembers[] = [
            'name' => $row['first_name'] . ' ' . $row['last_name'],
            'email' => $row['email'],
            'role' => $row['role']
        ];
    }
    $staffJson = json_encode($staffMembers);
    echo $staffJson;
} else {
    echo "Keine Mitarbeiter gefunden";
}

mysqli_close($dbc);
?>