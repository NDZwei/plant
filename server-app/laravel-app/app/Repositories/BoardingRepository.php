<?php

namespace App\Repositories;

use App\Models\Boarding;

class BoardingRepository extends BaseRepository {
    public function getModel()
    {
        return Boarding::class;
    }
}
