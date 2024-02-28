<?php
if (!isset($_GET['functionTyp']) || !isset($_GET['payload'])) {
    exit;
}

switch ($_GET['functionTyp']) {
    case 'User':
        createUser($_GET['payload']);
        break;
    case 'Product':
        createProduct($_GET['payload']);
        break;
    default:
        exit;
}

function createUser($payload)
{

}

function createProduct($payload)
{

}
?>