
<?php
// logout.php from author @LuxLait (Tim frisch) 
session_start();


session_unset();
session_destroy();

header('Location: index.html?page=home'); 
exit;
?>
