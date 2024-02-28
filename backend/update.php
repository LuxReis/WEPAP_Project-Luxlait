<?php
    if (!isset($_GET['functionTyp']) || !isset($_GET['payload'])) {
        exit;
    }

    switch ($_GET['functionTyp']) {
        case 'User':
            updateUser($_GET['payload']);
            break;
        case 'Product':
            updateProduct($_GET['payload']);
            break;
        default:
            exit;
    }

    function updateUser($payload) 
    {

    }

    function updateProduct($payload)
    {

    }
?>
