<?php
function insertUser($payload) {
    $query = "INSERT INTO tblUser (idUsername, dtFirstName, dtLastName, dtPassword, dtEmail, dtTelephone, dtPLZ, dtHouseNR, dtStreet, fiCountry)";

}

function insertProduct($payload) {
    $query = "INSERT INTO tblProduct (dtProduct, dtPrice, dtImage)";

}

?>