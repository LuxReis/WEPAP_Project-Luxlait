<?php
require_once 'db_connectionFunctions.php';
$dbc = dbConnections();

    function login() {
        $query = "SELECT dtPassword FROM tblUser WHERE idUserName = ?";
        
        $stmt = mysqli_prepare($dbc, $query);

        if ($stmt) {
            mysqli_stmt_bind_param($stmt, "s", $email);
            mysqli_stmt_execute($stmt);

            $result = mysqli_stmt_get_result($stmt);
            $row = mysqli_fetch_assoc($result);

            mysqli_stmt_close($stmt);

            if ($row && password_verify($password, $row['dtPassword'])) {
                return true;
            }
        }

    return false;
}
    }
        
    function checkRegister() {
        $query = "SELECT * FROM tblUser WHERE idUserName = ?";
            $stmt = mysqli_prepare($dbc, $query);

            if ($stmt === false) {
                die("Prepared statement creation failed: " . mysqli_error($dbc));
            }

            mysqli_stmt_bind_param($stmt, "s", $email);
            mysqli_stmt_execute($stmt);

            mysqli_stmt_store_result($stmt);
            $row_count = mysqli_stmt_num_rows($stmt);

            mysqli_stmt_close($stmt);

            return ($row_count == 0);
    }

?>