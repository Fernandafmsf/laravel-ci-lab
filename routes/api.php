<?php

use Illuminate\Support\Facades\Route;

Route::get('/health', function (){
    return response()->json([
        'status' => 'ok',
        'message' => 'API is healthy'
    ]);
});

Route::get('/version', function () {
    return response()->json([
        'app_name' => config('app.name'),
        'version' => config('version.version'),
        'environment' => app()->environment(),
        'commit' => env('APP_COMMIT', 'local'),
        'build_at' => env('APP_BUILD_DATE', 'local'),
    ]);
});
