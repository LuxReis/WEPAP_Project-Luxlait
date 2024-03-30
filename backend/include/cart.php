<?php

/*
require_once "backend/functions/db_connectionFunctions.php";
*/
require_once "../functions/db_connectionFunctions.php";
$dbc = dbConnections();

if (isset($_GET['username-cart'])) {
    $username = $_GET['usercart'];
    $cart = [];
    $product = [];

    $querySelect = "SELECT dtAmount, dtProduct, dtMetricUnit, dtPrice, dtFat, p.dtImage, dtPackage, dtType, dtName
                    FROM tblShoppingCart
                    INNER JOIN tblProduct AS p ON idProduct = fiProduct
                    INNER JOIN tblType ON idType = fiType
                    INNER JOIN tblCategory ON idCategory = fiCategory
                    WHERE fiUsername = ?;";

    $stmt = mysqli_prepare($dbc, $querySelect);
    mysqli_stmt_bind_param($stmt, "s", $username);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result(
        $stmt,
        $dtAmount,
        $dtProduct,
        $dtMetricUnit,
        $dtPrice,
        $dtFat,
        $dtImage,
        $dtPackage,
        $dtType,
        $dtName
    );

    while (mysqli_stmt_fetch($stmt)) {
        $cart[] = array(
            'amount' => $dtAmount,
            'product' => $dtProduct,
            'metricUnit' => $dtMetricUnit,
            'price' => $dtPrice,
            'fat' => $dtFat,
            'image' => $dtImage,
            'package' => $dtPackage,
            'type' => $dtType,
            'category' => $dtName
        );
    }

    echo json_encode($cart);
    mysqli_stmt_close($stmt);
}

// Bild als Inspiration
//https://miro.medium.com/v2/resize:fit:1024/1*2U7hReW6WUfLkoNfZbfekQ.png
