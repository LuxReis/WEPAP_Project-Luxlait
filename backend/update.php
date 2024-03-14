<?php
    if (!isset($_GET['functionTyp']) || !isset($_GET['payload'])) {
        exit();
    }

    switch ($_GET['functionTyp']) {
        case 'user':
            updateUser($_GET['payload']);
            break;
        case 'product':
            updateProduct($_GET['payload']);
            break;
        default:
            exit();
    }

    function updateUser($payload) 
    {
        
    }

    function updateProduct($payload)
    {
        
    }
?>