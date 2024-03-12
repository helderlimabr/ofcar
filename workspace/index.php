<?php

require_once 'bootstrap.php';
require_once 'App/Connection.php';

use App\Models\ServProd;
use App\Router;
use App\Transaction as TransactionAlias;
use App\Core;

$router = new \CoffeeCode\Router\Router($_ENV['BASE_URL']);
$router->namespace("App\Controllers");
$router->group(null);
$router->get("/", "HomeController:index");
$router->post("/login", "HomeController:login");
$router->get("/dashboard", "HomeController:dashboard");

$router->get("/user", "UserController:index");
$router->get("/user/form", "UserController:form");
$router->post("/user", "UserController:store");
$router->post("/user/{id}", "UserController:show");
$router->post("/user/update/{id}", "UserController:update");
$router->get("/user/delete/{id}", "UserController:delete");

$router->get("/profile", "ProfileController:index");
$router->post("/profile", "ProfileController:store");
$router->get("/profile/{id}", "ProfileController:view");
$router->get("/profile/update/{id}", "ProfileController:show");
$router->post("/profile/update", "ProfileController:update");
$router->get("/profile/delete/{id}", "ProfileController:delete");
$router->get("/profile/form", "ProfileController:form");

$router->post("/permission/update", "PermissionController:update");

$router->dispatch();
