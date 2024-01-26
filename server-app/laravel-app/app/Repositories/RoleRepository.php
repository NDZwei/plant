<?php

namespace App\Repositories;

use App\Models\Role;

class RoleRepository extends BaseRepository {
    public function getModel()
    {
        return Role::class;
    }

    public function getByName(string $name) {
        return $this->model->where('name', $name)->first();
    }
}
