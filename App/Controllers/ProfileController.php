<?php

namespace App\Controllers;

use App\BladeInstance;
use App\Models\Profile;
use App\Transaction;
use Exception;

class ProfileController {

    public function index() {
        $blade = BladeInstance::getInstance();
        Transaction::open();
        $profiles = new Profile;
        $profiles = $profiles->list();
        Transaction::close();
        echo $blade->make('profile.list')->with(['profiles' => $profiles])->render();
    }

    public function show($args) {
        $blade = BladeInstance::getInstance();
        Transaction::open();
        $profile = new Profile;
        $profile = $profile->load($args['id']);
        Transaction::close();
        echo $blade->make('profile.form')->with(['profile' => $profile, 'update' => TRUE])->render();
    }

    public function form() {
        $blade = BladeInstance::getInstance();
        echo $blade->make('profile.form')->with(['update' => FALSE, 'view' => FALSE])->render();
    }

    public function view($args) {
        $blade = BladeInstance::getInstance();
        Transaction::open();
        $profile = new Profile;
        $profile = $profile->load($args['id']);
        Transaction::close();
        echo $blade->make('profile.form')->with(['profile' => $profile, 'view' => TRUE])->render();
    }

    public function store() {
        $blade = BladeInstance::getInstance();
        try {
            Transaction::open();
            $profile = new Profile;
            $profile->description = $_REQUEST['description'];
            $profile->store();
            $_SESSION['message'] = "Dados salvos com sucesso!";
            $_SESSION['message_type'] = "success";
            Transaction::close();
            header('Location: profile');
            exit();

        } catch (Exception $e) {
            $_SESSION['message'] = "Falha ao salva os dados!";
            $_SESSION['message_type'] = "error";
            header('Location: profile');
            exit();
        }
    }

    public function update() {
        $blade = BladeInstance::getInstance();
        try {
            Transaction::open();
            $profile = new Profile($_REQUEST['id']);
            $profile->description = $_REQUEST['description'];
            $profile->store();
            $_SESSION['message'] = "Dados salvos com sucesso!";
            $_SESSION['message_type'] = "success";
            echo $blade->make('profile.form')->with(['profile' => $profile, "update" => TRUE])->render();
            Transaction::close();
        } catch (Exception $e) {
            $_SESSION['message'] = "Falha ao salva os dados!";
            $_SESSION['message_type'] = "error";
            header('Location: profile');
            exit();
        }
    }
}
