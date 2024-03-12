<?php

namespace App;

require_once __DIR__ . './../vendor/autoload.php';

use Dotenv\Dotenv;
use Exception;
use PDO;

final class Connection {
    private function __construct() {}

    public static function open() {
        if (file_exists('./.env')) {
            $dotenv = Dotenv::createImmutable(dirname(__DIR__));
            $dotenv->load();
            $host = $_ENV['DB_HOST'];
            $port = $_ENV['DB_PORT'];
            $user = $_ENV['DB_USER'];
            $password = $_ENV['DB_PASS'];
            $dbname = $_ENV['DB_NAME'];
            $conn = new PDO("mysql:host={$host};port={$port};dbname={$dbname}", $user, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $conn;
        } else {
            throw new Exception("Arquivo .env não foi encontrado!");
        }
    }
}