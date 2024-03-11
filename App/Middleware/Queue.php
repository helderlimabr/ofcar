<?php

namespace App\Middleware;

class Queue {

    private $middleawre = [];

    private $controller;

    /**
     * @var array
     */
    private $controllerArgs = [];

    public function handle($args) {
        var_dump($args);
        die();
        //        echo 'Aqui';exit();
    }

}