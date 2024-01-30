<?php

use Illuminate\Support\Facades\Route;

Route::group(['middleware' => ['guest:api']], function () {
    $routes = glob(__DIR__ . "/api/guest/*.php");
    foreach ($routes as $route) require($route);
});
