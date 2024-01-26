<?php

namespace App\Http\Controllers;

use App\Services\AuthService;
use Illuminate\Http\Request;

class AuthController extends BaseController
{
    public function getService()
    {
        return AuthService::class;
    }

    public function login(Request $request)
    {
        $input = $request->all();
        $result = $this->service->login($input);
        return response()->json($result);
    }

    public function register(Request $request)
    {
        $input = $request->all();
        $result = $this->service->register($input);
        return response()->json($result);
    }

    public function forgotPassword(Request $request)
    {
        $input = $request->all();
        $result = $this->service->forgotPassword($input);
        return response()->json($result);
    }
}
