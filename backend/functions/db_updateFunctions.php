<?php

    function updateUser($idUsername, $dtFirstName, $dtLastName, $dtPassword, $dtEmail, $dtTelephone, $dtPLZ, $dtHouseNR, $dtStreet, $fiCountry) {
        $updateUser = "UPDATE tblUser 
            SET dtFirstName = '$dtFirstName',
                dtLastName = '$dtLastName', 
                dtPassword = '$dtPassword', 
                dtEmail = '$dtEmail', 
                dtTelephone = '$dtTelephone', 
                dtPLZ = '$dtPLZ', 
                dtHouseNR = '$dtHouseNR', 
                dtStreet = '$dtStreet', 
                fiCountry = $fiCountry 
            WHERE idUsername = $idUsername";  
    }
        
    function updateProduct($productId, $productName, $productPrice, $productDescription) {
        $updateProduct = "UPDATE tblProduct 
            SET productName = '$productName', 
                productPrice = '$productPrice', 
                productDescription = '$productDescription'
            WHERE productId = $productId";
        
    }

?>