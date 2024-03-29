<?php

require_once "backend/functions/db_connectionFunctions";
$dbc = dbConnections();

if (isset($_GET['username-cart'])) {
    $username = $_GET['username-cart'];

    $querySelect = "SELECT tbldtAmount, fiProduct, fiUsername FROM tblShoppingCart WHERE fiUsername = ?";
    $stmt = mysqli_prepare($dbc, $querySelect);
    mysqli_stmt_bind_param($stmt, "s", $username);

    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
}


// Bild als Inspiration
//https://miro.medium.com/v2/resize:fit:1024/1*2U7hReW6WUfLkoNfZbfekQ.png
