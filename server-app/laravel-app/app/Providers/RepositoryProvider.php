<?php

namespace App\Providers;

use App\Repositories\BoardingRepository;
use App\Repositories\UserRepository;
use Carbon\Laravel\ServiceProvider;

class RepositoryProvider extends ServiceProvider {
    public function register()
    {
        $this->app->bind(UserRepository::class);
        $this->app->bind(BoardingRepository::class);
        // generator
        $this->bootRepositoryBinders();
    }

    private function bootRepositoryBinders()
    {

    }
}
