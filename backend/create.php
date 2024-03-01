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
    $query = "INSERT INTO tblUser (dtUsername, dtPassword, dtEmail, dtTelephone, dtPLZ, dtAdresse)";
}

function createProduct($payload)
{

}
?>
