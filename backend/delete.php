<?php

    if(!isset($_GET['functionTyp'])|| !isset($_GET['payload'])){
        //Error: There are no functionTyp or payload.  
        exit();    

    }

    switch ($_GET['payload']) {
        case 'user':
            deleteUser();
            break;
        
        case 'product':
            deleteProduct();
            break;

        default:
            //Error 
            exit();
            break;
    }

    function deleteUser($payload) {

    }

    function deleteProduct($payload) {
        
    }

?>