<?php

   /* define('DB_HOST', '193.41.237.172'); // set database host (normally localhost)
    define('DB_USER', 'luxlait_project'); 	// set database user
    define('DB_PASSWORD', 'luxlait_project_123'); // set database password
    define('DB_NAME', 'luxlait_project'); // set database name */

    $url = getenv('mysql://k0vti3rt0kb80qzv:oubqpry46mu7s897@q2gen47hi68k1yrb.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/yo1dy8dgxy9rfv3k');
    $dbparts = parse_url($url);

    $hostname = $dbparts['host'];
    $username = $dbparts['user'];
    $password = $dbparts['pass'];
    $database = ltrim($dbparts['path'],'/');

?>