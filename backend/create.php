<?php
if (!isset($_GET['functionTyp']) || !isset($_GET['payload'])) {
    exit();
}

switch ($_GET['functionTyp']) {
    case 'user':
        createUser($_GET['payload']);
        break;
    case 'product':
        createProduct($_GET['payload']);
        break;
    default:
    //error
        exit();
}

function createUser($payload)
{
    insertUser($payload);
}

function createProduct($payload)
{
    insertProduct($payload);
}
?>
