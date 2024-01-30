<?php

namespace App\Http\Controllers;

use App\Services\UserService;

class UserController extends BaseController
{
    public function getService()
    {
        return UserService::class;
    }
}
