<?php
include_once backend/functions/db_connectionFunctions.php;
function deleteUser() {
    $query = "DELETE FROM tblUser WHERE idUsername = ";
    
}

function deleteProduct() {
    $query = "DELETE FROM tblProduct WHERE idProduct = ";
    
}
?>