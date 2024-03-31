<?php
    session_start();
    require_once "../db/db_credentials.php";
    // Check if the user is already logged in
    if (isset($_SESSION['username'])){
        // Redirect to home or profile
        exit;
    }

    // Verify if the login form has been sent.
    if ($_SERVER['REQUEST_METHOD'] == "POST"){
        // Check if username/email and password has been sent
        if(isset($_POST['username']) && isset($_POST['password'])){
            $username = $_POST['username'];
            $password = $_POST['$password'];
            $con = mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);
            // Find User by Password and Username or Email
            $query = "SELECT * FROM tblUser WHERE dtPassword = ? AND (dtUsername = ? OR dtEmail = ?)";
            // Prepare query
            $stmt = mysqli_prepare($con,$query);
            // Insert in to query Values (Password, Username)
            mysqli_stmt_bind_param($stmt,'sss',$password,$username,$username);
            // Execute query
            mysqli_stmt_execute($stmt);
            // Extract Result from prepared query
            $result = mysqli_stmt_get_result($stmt);
            // Check if Result contains Answer(Some row)
            if(mysqli_num_rows($result)>0){
                // convert result to php associative array
                $row = mysqli_fetch_assoc($result);
                // Save username in to session (Save login information)
                $_SESSION['username'] = $row['dtUsername'];
                // redirect to home or profile // header('location: page.php');
            }
            else{
                $error = "Invalid Username/Email or Password";
            }
        }
        else{
            $error = "Username or Passwort are missing";
        }

        if($error){
            echo $error;
        }
    }
?>