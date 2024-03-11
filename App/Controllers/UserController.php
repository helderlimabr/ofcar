<?php

namespace App\Controllers;

use App\BladeInstance;
use App\Models\User;
use App\Transaction;
use Exception;

class UserController {

    public function index() {
        $blade = BladeInstance::getInstance();
        Transaction::open('ofcar');
        $user = new User;
        $users = $user->list();
        Transaction::close();
        echo $blade->make('user.list')->with('users', $users)->render();
    }

    public function show($id) {
        echo 'show';
    }

    public function form() {
        $blade = BladeInstance::getInstance();
        echo $blade->make('user.form')->render();
    }

    public function store() {
        try {
            Transaction::open('ofcar');
            $user = new User;
            $user->full_name = $_REQUEST['full_name'];
            $user->cpf = $_REQUEST['cpf'];
            $user->email = $_REQUEST['email'];
            $user->password = password_hash($_REQUEST['password'], PASSWORD_DEFAULT);
            $user->store();
            Transaction::close();
            $_SESSION['message'] = "Dados salvos com sucesso!";
            $_SESSION['message_type'] = "success";
            header('Location: user');
            exit();
        } catch (Exception $e) {
            $_SESSION['message'] = "Falha ao salva os dados!";
            $_SESSION['message_type'] = "error";
            header('Location: user');
            exit();
        }
    }
}
