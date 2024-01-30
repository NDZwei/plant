<?php

namespace App\Services;

use App\Repositories\RoleRepository;
use App\Repositories\UserRepository;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Laravel\Passport\Token;

class AuthService extends BaseService {
    private $userRepository;
    private $roleRepository;

    public function getRepository()
    {
        return null;
    }

    public function __construct(UserRepository $userRepository, RoleRepository $roleRepository) {
        $this->userRepository = $userRepository;
        $this->roleRepository = $roleRepository;
    }

    public function login(array $request) {
        if(!Auth::attempt($request)) {
            return $this->getResponse401();
        }
        $user = auth()->user();
        if($user->is_active) {
            $data['token'] = $this->createToken($user);
            $data['email'] = $user->email;
            $data['roles'] = $user->roles;
            return $this->getResponse200($data);
        }
        return $this->getResponse403('User not active');
    }

    public function register(array $request) {
        try {
            DB::beginTransaction();
            $user = $this->userRepository->save($request);
            // role
            $role = $this->roleRepository->getByName('ROLE_CUSTOMER');
            $user->roles()->attach($role->id, ['created_at' => now(), 'updated_at' => now()]);
            DB::commit();
            // send mail
            Auth::login($user);
            $success['token'] = $user->createToken('token')->accessToken;
            $success['message'] = "Registration successfull..";
            try {
                $user->sendMailVerification();
            } catch (Exception $e) {
                DB::rollBack();
                return ['data' => null, 'message' => "Can't send email verification", 'code' => 500];
            }
            return $this->getResponse200($user);
        }
        catch(Exception $e) {
            DB::rollBack();
            return $this->getResponse500($e->getMessage());
        }
    }

    public function forgotPassword(array $request) {
        if(isset($request['email'])) {
            $user = $this->userRepository->getUserByEmail($request['email']);
            $token = $this->createToken($user);
            $reset_url = url(route('password.reset', [
                'token' => $token,
                'email' => $request['email'],
            ], false));
            Mail::send('emails.reset-password', ['reset_url' => $reset_url], function ($message) use ($user) {
                $message->to($user->email);
                $message->subject('Password Reset');
            });
            return $this->getResponse200(null);
        }
        return $this->getResponse500('Email is null');
    }

    public function createToken($user) {
        Token::where('user_id', $user->id)->delete();
        return $user->createToken('token')->accessToken;
    }
}
