<?php

namespace App\Controllers;
use App\Connection;
use Exception;
use PDO;

class PermissionController {

    public function update() {

        $model = $_REQUEST['model'];
        $permission = $_REQUEST['permission'];
        $id_permission = $this->getIdPermission($model, $permission);
        header('Content-Type: application/json');
        http_response_code(201);
        echo json_encode(['message' => 'Isso a resposta', 'data' => $_REQUEST]);
    }

    public function updatePermissionProfile() {
        $sql = "select * from parameters";
        $conn = Connection::open();
        if ($conn) {
            $result = $conn->query($sql);
            if ($result) {
                $object = $result->fetchAll(PDO::FETCH_ASSOC);
            }
            return $object;
        } else {
            throw new Exception('Erro!');
        }
    }

    public function getIdPermission($model, $permission) {
        $sql = "select id from ofcar.permission where table_model = :model and permission = :permission; ";
        try {
            $conn = Connection::open();
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':model', $model, PDO::PARAM_STR);
            $stmt->bindParam(':permission', $permission, PDO::PARAM_STR);
            if ($stmt->execute()) {
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
            }
            return $result['id'];
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }
}
