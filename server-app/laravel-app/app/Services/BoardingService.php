<?php

namespace App\Services;

use App\Repositories\BoardingRepository;

class BoadringService extends BaseService {
    public function getRepository()
    {
        return BoardingRepository::class;
    }
}
