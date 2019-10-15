<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});



Route::post('/sendEmail','EmailController@sendEmail');

// User
Route::post('/createUser','CustomerController@createUser'); //username,email,password
Route::post('/login','CustomerController@login'); //username,password


// Resep
Route::get('/search','RecipeController@search');
Route::get('/fetch','RecipeController@fetch');
Route::post('/masak','RecipeController@masak')

// Kulkas
Route::get('/getKulkas','FridgeController@getKulkas');
Route::post('/tambahKulkas','FridgeController@tambahKulkas'); //id_


// Ingredients
Route::get('/getIngredients','IngredientsController@getIngredients');