<?php
$host = "localhost"; 
$port = "5432"; 
$dbname = "postgres";
$user = "postgres";
$password = "123456";

try {
    $conn = new PDO("pgsql:host=$host;port=$port;dbname=$dbname;user=$user;password=$password");

    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Erro na conexão: " . $e->getMessage());
}
?>
