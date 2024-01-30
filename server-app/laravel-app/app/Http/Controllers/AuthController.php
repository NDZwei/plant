<?php

namespace App\Http\Controllers;

use App\Services\AuthService;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Auth\Events\Verified;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class AuthController extends BaseController
{
    public function getService()
    {
        return AuthService::class;
    }

    public function __construct() {
        parent::__construct();
        $this->middleware('auth:api')->only('resend');
        $this->middleware('throttle:5,1')->only('verify', 'resend');
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

    public function resend(Request $request)
    {
        if ($request->user()->hasVerifiedEmail()) {
            return [
                'status' => Response::HTTP_OK,
                'message' => 'Account verified successfully',
            ];
        }

        $request->user()->sendMailVerification();

        if ($request->wantsJson()) {
            $success['message'] = "メールアドレス を送信しました。";
            return [
                'status' => Response::HTTP_OK,
                'message' => 'Account verified successfully',
            ];
        }

        return back()->with('resent', true);
    }
}
