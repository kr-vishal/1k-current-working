<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(['namespace' => 'App\Http\Controllers\Api'], function(){
    Route::group(['namespace' => 'Auth'], function(){
        Route::post('/register', 'AuthController@register')->name("api.auth.register");
    });

    Route::group(['prefix' => 'v1/resources', 'as' => 'api.resource.'], function ($router) {
        Route::get('fetch', 'DataController@fetch');
        Route::get('{slug}', 'DataController@list')->name('list');
        Route::get('{slug}/{id}', 'DataController@browse')->name('browser');
        Route::post('{slug}', 'DataController@add')->name('add');
        Route::put('{slug}', 'DataController@add')->name('update');
        Route::delete('{slug}', 'DataController@delete')->name('delete');
    });
});

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
