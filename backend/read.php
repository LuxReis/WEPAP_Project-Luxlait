<?php

    if(!isset($_GET['functionTyp']) || !isset($_GET['payload'])){
        // Error: There is no function type or payload provided.
        echo "Error: No function type and or payload provided.";
        exit();     
    }

    //Switch for payload
    switch ($_GET['payload']) {
        case 'login':
            login($payload);
            break;
        case 'checkRegister':
            checkRegister($payload);
            break;
        case 'product':
            selectProducts();
            break;

        default:
            // Error: There is no payload provided.
            echo "Error: No payload provided.";
            exit();
    }

    function login($payload){

    }

    function checkRegister($payload){

    }

    function returnProducts() {
        $products = selectProducts();
    }

?>