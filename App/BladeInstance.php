<?php

namespace App;

use Jenssegers\Blade\Blade;

class BladeInstance {
    private static $instance;

    public static function getInstance() {
        if (!isset(self::$instance)) {
            $viewsPath = __DIR__ . '/views'; // Substitua pelo seu caminho de visualização
            $cachePath = __DIR__ . '/cache'; // Substitua pelo seu caminho de cache
            self::$instance = new Blade($viewsPath, $cachePath);
        }
        return self::$instance;
    }
}