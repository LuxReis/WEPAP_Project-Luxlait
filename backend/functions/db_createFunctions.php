<?php
// Establish the database connection
$dbc = mysqli_connect(DB_HOST, DB_USER, DB_PW, DB_NAME);
if (mysqli_connect_errno()) {
    die('Connect Error (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
}

// Function to insert user
function insertUser($payload) {
    global $dbc; // Access the global $dbc variable
    
    // Prepare the SQL statement
    $query = "INSERT INTO tblUser (idUsername, dtFirstName, dtLastName, dtPassword, dtEmail, dtTelephone, dtPLZ, dtHouseNR, dtStreet, fiCountry) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    // Prepare the statement
    $stmt = mysqli_prepare($dbc, $query);

    // Check if the statement is valid
    if (!$stmt) {
        die('Prepare statement failed: ' . mysqli_error($dbc));
    }

    // Bind parameters
    mysqli_stmt_bind_param($stmt, "ssssssssss", 
        $payload['idUsername'], 
        $payload['dtFirstName'], 
        $payload['dtLastName'], 
        $payload['dtPassword'], 
        $payload['dtEmail'], 
        $payload['dtTelephone'], 
        $payload['dtPLZ'], 
        $payload['dtHouseNR'], 
        $payload['dtStreet'], 
        $payload['fiCountry']
    );

    // Execute the statement
    if (mysqli_stmt_execute($stmt)) {
        echo "New record inserted successfully";
    } else {
        echo "Error: " . mysqli_error($dbc);
    }

    // Close the statement
    mysqli_stmt_close($stmt);
}

function insertProduct($payload) {
    $query = "INSERT INTO tblProduct (dtProduct, dtPrice, dtImage)";

}

?>