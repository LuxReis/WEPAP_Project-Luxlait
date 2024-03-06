<?php
// Function to insert user
function insertUser($payload) {
    $dbc = dbConnections();
    
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
    mysqli_close($dbc);
}

function insertProduct($payload) {
    $dbc = dbConnections();
    
    // Prepare the SQL statement
    $query = "INSERT INTO tblProduct (dtProduct, dtPrice, dtImage) VALUES (?, ?, ?)";
    
    // Prepare the statement
    $stmt = mysqli_prepare($dbc, $query);

    // Check if the statement is valid
    if (!$stmt) {
        die('Prepare statement failed: ' . mysqli_error($dbc));
    }

    // Bind parameters
    mysqli_stmt_bind_param($stmt, "sds", 
        $payload['dtProduct'], 
        $payload['dtPrice'], 
        $payload['dtImage']
    );

    // Execute the statement
    if (mysqli_stmt_execute($stmt)) {
        echo "New product inserted successfully";
    } else {
        echo "Error: " . mysqli_error($dbc);
    }

    // Close the statement
    mysqli_stmt_close($stmt);
    mysqli_close($dbc);
}
?>