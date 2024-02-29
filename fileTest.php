<?php
    if(!isset($_GET["FunktionType"]) || !isset($_GET["Payload"]))
{
    
    exit;
}

switch ($_GET['FunktionType']) {

    case 'User':
        DeleteUser();
        break;

    case 'ChatMessage':
        DeleteProduct();
        break;

    default:
        exit;
}

function DeleteUser()
{
    if (!isset($_GET['Payload'])) {
        die('No User ID');
    }
    $userId = $_GET['Payload'];

    echo "User with ID deleted"
}

function DeleteProduct()
{
    if (!isset($_GET['Payload'])) {
        die('No Product ID');
    }
    $userId = $_GET['Payload'];

    echo "Product with ID deleted"
}
?>