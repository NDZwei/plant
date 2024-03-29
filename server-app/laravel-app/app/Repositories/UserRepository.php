<?php

namespace App\Repositories;

use App\Models\User;

class UserRepository extends BaseRepository {
    public function getModel()
    {
        return User::class;
    }

    public function getUserByEmail($email) {
        return $this->model->where('email', $email)->first();
    }
}
