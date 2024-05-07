<?php
// register.php from author @LuxKeis (Gamass Mihails)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

    session_start();
    $url = getenv('JAWSDB_URL');
    $dbparts = parse_url($url);

    $hostname = $dbparts['host'];
    $username = $dbparts['user'];
    $password = $dbparts['pass'];
    // Take link path and trim / from left part 
    $database = ltrim($dbparts['path'], '/');

    // Make connection to Database
    try {
        // Link to Database
        $dsn = "mysql:host=$hostname;dbname=$database;charset=utf8";
        // Connection settings:
        $options = array(
            // Error type - exception
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            // Fetch Mode - associative array (Convertation Regime)
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            // Querry preparing before execution
            PDO::ATTR_EMULATE_PREPARES => false,
        );
        // Connection to Database, save in variable dbc
        $dbc = new PDO($dsn, $username, $password, $options);
    }
    // Catch for connection exception (Error)
    catch (PDOException $e){
        die('Connect Error: ' . $e->getMessage());
    }
    // Check if the user is already logged in
    if (isset($_SESSION['username'])){
        // Redirect to home or profile
        header('location: ../../frontend/index.html?page=home');
        exit;
    }

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        if(isset($_POST['idUsername'])&&
            isset($_POST['dtFirstName'])&&
            isset($_POST['dtLastName'])&&
            isset($_POST['dtPassword'])&&
            isset($_POST['dtEmail'])&&
            isset($_POST['dtTelephone'])&&
            isset($_POST['dtPLZ'])&&
            isset($_POST['dtHouseNR'])&&
            isset($_POST['dtStreet'])&&
            isset($_POST['dtCity'])&&
            isset($_POST['dtCountry'])
            ){
            //if($_POST['agree']){}
            
            $query = "INSERT INTO tblUser VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, NULL, NULL, NULL, ?)";
            // ('user', 'User', 'User', '04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 'user@user.lu', '621 788 897', '1234', '3', 'Am Seif', 'Bissen', '/', 'Client', 3)
            $stmt = $dbc -> prepare($query);
            $password = hash('sha256', $_POST['dtPassword']);
            $role = "Client";
            $roleID = 3;
            // Insert in to query Values
            $stmt -> bindParam(1, $_POST['idUsername'], PDO::PARAM_STR);
            $stmt -> bindParam(2, $_POST['dtFirstName'], PDO::PARAM_STR);
            $stmt -> bindParam(3, $_POST['dtLastName'], PDO::PARAM_STR);
            $stmt -> bindParam(4, $password, PDO::PARAM_STR);
            $stmt -> bindParam(5, $_POST['dtEmail'], PDO::PARAM_STR);
            $stmt -> bindParam(6, $_POST['dtTelephone'], PDO::PARAM_STR);
            $stmt -> bindParam(7, $_POST['dtPLZ'], PDO::PARAM_STR);
            $stmt -> bindParam(8, $_POST['dtHouseNR'], PDO::PARAM_STR);
            $stmt -> bindParam(9, $_POST['dtStreet'], PDO::PARAM_STR);
            $stmt -> bindParam(10, $_POST['dtCity'], PDO::PARAM_STR);
            $stmt -> bindParam(11, $_POST['dtCountry'], PDO::PARAM_STR);
            $stmt -> bindParam(12, $role, PDO::PARAM_STR);
            $stmt -> bindParam(13, $roleID, PDO::PARAM_INT);
            // Execute query
            if($stmt -> execute()){
                $_SESSION['username'] = $_POST['idUsername'];
                header('location: ../../index.html?page=home');
            }
            else{
                $error = "All fields are required(db)";
            }
        }
        else{
            $error = "All fields are required";
        }
        if($error){
            header("location: ../../index.html?page=register&error=$error");
        }
    }
// Conncetion close
$dbc = null;
?>