<?php

namespace App;

class Core {
    public function run($routes) {
        $url = '/';
        isset($_GET['url']) ? $url .= $_GET['url'] : '';
        [$model, $action, $param] = explode('/', $_GET['url']);
        require_once $model."Controller.php";
        $newController = new $model."Controller.php"();
        $newController->$action();

    }
}
