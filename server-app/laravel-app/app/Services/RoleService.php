<?php

namespace App\Services;

use App\Models\Role;

class RoleService extends BaseService {
    public function getRepository()
    {
        return Role::class;
    }
}
