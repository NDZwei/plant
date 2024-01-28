<?php

namespace App\Services;

use App\Repositories\UserRepository;

class UserService extends BaseService {
    public function getRepository()
    {
        return UserRepository::class;
    }
}
