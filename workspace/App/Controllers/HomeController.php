<?php

namespace App\Controllers;

use App\BladeInstance;

class HomeController {
    public function index() {
        $blade = BladeInstance::getInstance();
        echo $blade->make('login.form')->render();
    }

    public function login() {
        $blade = BladeInstance::getInstance();
        header('Location: dashboard');
        exit();
    }
    public function dashboard() {
        $blade = BladeInstance::getInstance();
        echo $blade->make('dashboard')->render();
    }

}