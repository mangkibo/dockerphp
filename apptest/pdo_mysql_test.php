<?php

$host = "127.0.0.1";
$port = "3308";
$dbname = "testdb";
$user = "admin";
$password = "1234";

try {
    $dbh = new PDO ( 
        'mysql:host='.$host.':'.$port.';dbname='.$dbname,
        $user,
        $password,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION],
    );
    die(json_encode(array('outcome' => true)));
} catch ( PDOException $ex ) {
    die(json_encode([
        'outcome' => false, 
        'message' => 'Unable to connect',
    ]));
}