<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Services\AuthService;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\Verified;
use Illuminate\Auth\Access\AuthorizationException;

class RegisterController extends Controller
{
    public function getService()
    {
        return AuthService::class;
    }

    public function __construct()
    {
        $this->middleware('signed')->only('verify');
    }

    public function verify(Request $request)
    {
        auth()->loginUsingId($request->route('id'));

        if ($request->route('id') != $request->user()->getKey()) {
            throw new AuthorizationException;
        }

        $user = $request->user();
        $message = "";
        if ($user->hasVerifiedEmail()) {
            $message = "すでに確認済みです。";
        } else if ($user->markEmailAsVerified()) {
            event(new Verified($user));
            $user->is_active = true; // Update the isActive field to true
            $user->save();
            $message = "正常に確認されました。";
        }

        return view('emails.confirm-email', ['message' => $message]);

    }
}
