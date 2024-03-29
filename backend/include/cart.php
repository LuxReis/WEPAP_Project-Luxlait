<?php

require_once "backend/functions/db_connectionFunctions.php";
$dbc = dbConnections();

if (isset($_GET['username-cart'])) {
    $username = $_GET['username-cart'];
    $cart = [];
    $product = [];

    $querySelect = "SELECT dtAmount, dtProduct
                    FROM tblShoppingCart
                    INNER JOIN tblProduct ON idProduct = fiProduct
                    INNER JOIN tblType ON idType = fiType
                    INNER JOIN tblCategory ON idCategory = fiCategory
                    WHERE fiUsername = ?";

    $stmt = mysqli_prepare($dbc, $querySelect);
    mysqli_stmt_bind_param($stmt, "s", $username);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_bind_result(
        $stmt,
        $dtAmount,
        $dtProduct
    );

    while (mysqli_stmt_fetch($stmt)) {
        $cart[] = array(
            'amount' => $dtAmount,
            'product' => $dtProduct
        );
    }

    echo json_encode($cart);
    mysqli_stmt_close($stmt);
}

// Bild als Inspiration
//https://miro.medium.com/v2/resize:fit:1024/1*2U7hReW6WUfLkoNfZbfekQ.png
