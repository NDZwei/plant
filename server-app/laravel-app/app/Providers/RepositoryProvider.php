<?php

namespace App\Providers;

use Carbon\Laravel\ServiceProvider;

class RepositoryProvider extends ServiceProvider {
    public function register()
    {

        // generator
        $this->bootRepositoryBinders();
    }

    private function bootRepositoryBinders()
    {

    }
}
