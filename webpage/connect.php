<?php
// Connessione al Database locale quickcare
function connect() {

    $rootDir = realpath($_SERVER["DOCUMENT_ROOT"]);

    $db = parse_ini_file($rootDir."/Database/database.ini");

    $host = $db['host'];
    $port = $db['port'];
    $dbname = $db['dbname'];
    $user = $db['user'];
    $pass = $db['password'];

    $dbconn = pg_connect("host=$host port=$port
        dbname=$dbname user=$user password=$pass")
        or die('Could not connect: ' . pg_last_error());

    return $dbconn;
}

?>