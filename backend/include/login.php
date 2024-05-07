<?php
    //login.php from author @LuxKeis (Gamass Mihails)
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
        header('location: ../../index.html?page=home');
        exit;
    }

    // Verify if the login form has been sent.
    if ($_SERVER['REQUEST_METHOD'] == "POST"){
        // Check if username/email and password has been sent
        if(isset($_POST['username']) && isset($_POST['password'])){
            $username = $_POST['username'];
            $password = $_POST['password'];
            // Find User by Password and Username or Email
            $query = "SELECT * FROM tblUser WHERE idUsername = ? OR dtEmail = ?";
            // Prepare query
            $stmt = $dbc -> prepare($query);
            // Insert in to query Values (Username,Email)

            $stmt -> bindParam(1, $username, PDO::PARAM_STR);
            $stmt -> bindParam(2, $username, PDO::PARAM_STR);
            
            // Execute query
            $stmt -> execute();
            
            // Check if Result contains Answer(Some row)
            if($stmt -> rowCount() > 0){
                // convert result to php associative array
                $result = $stmt -> fetch(PDO::FETCH_ASSOC);
                $storedPassword = $result['dtPassword'];
                $hashedPassword = hash('sha256', $password);
                // Check encrypted Password with entered Password
                if($hashedPassword == $storedPassword){
                    // Save username in to session (Save login information)
                    // redirect to home page
                    $_SESSION['username'] = $result['idUsername'];
                    if ($result['fiRight'] == 3) {
                        $_SESSION['rights'] = 'Client';
                    } else if ($result['fiRight'] == 2) {
                        $_SESSION['rights'] = 'Staff';
                    } else {
                        $_SESSION['rights'] = 'Admin';
                    }
                    header('location: ../../index.html?page=home');
                }
                else{
                    header('location: ../../index.html?page=login&error=password');
                }
            }
            else{
                header('location: ../../index.html?page=login&error=loginError');
                
            }
        }
        else{
            header('location: ../../index.html?page=login&error=post');
        }
        
        if($error){
            echo $error;

        }
        
    }
    // Conncetion close
    $dbc = null;
?>