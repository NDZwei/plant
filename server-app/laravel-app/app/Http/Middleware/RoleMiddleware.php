<?php

namespace App\Http\Middleware;

use Closure;

class RoleMiddleware {
    public function handle($request, Closure $next, $roles)
    {
        $userRoles = $request->user()->roles->pluck('name')->toArray();
        $roles = explode('|', $roles);
        if (empty(array_intersect($userRoles, $roles))) {
            return response('Forbidden.', 403);
        }
        return $next($request);
    }
}
