<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController as BaseController;
use App\Ingredients;
use Validator;

class IngredientsController extends BaseController
{
    public function getIngredients(){
        $data =  DB::table('ingredients')->get();
        return $this->sendResponse($data,'fetch ingridients successfully');
    }
}
