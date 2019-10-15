<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController as BaseController;
use App\Recipe;
use Validator;

class RecipeController extends BaseController
{   
    public function search(){
        if(isset($_GET['search'])){
            $query_search = $_GET['search'];
            $search_result = DB::table('recipes')->select('id_recipe','deskripsi','photo','nama')->where('nama','LIKE',"%{$query_search}%")->get();
            if(isset($search_result)){
                return $this->sendResponse($search_result,'get search result');
            }
        } else{
            return $this->sendError('no search query');
        }
    }

    public function fetch(){
        if(isset($_GET['mood']) and isset($_GET['id_user'])){
            if($_GET['mood'] == 1){
                $recipes = DB::table('recipes')->orderBy('score','desc')->get();
            } else{
                $recipes = DB::table('recipes')->orderBy('score','asc')->get();
            }
            $result = array();
            $aval_ingre = DB::table('fridges')->select('id_ingredients')->where('id_user','=',$_GET['id_user'])->get();
            foreach ($recipes as $val){
                $data = DB::table('bahans')->select('id_ingredients')->where('id_recipe','=',$val->id_recipe)->get();
                $counter = 0;
                $length = sizeof($data);
                foreach($data as $datum){
                    foreach($aval_ingre as $ingre){
                        if($datum->id_ingredients === $ingre->id_ingredients){
                            $counter += 1;
                            break;
                        }
                    }
                }
                if($length != 0){
                    if (($counter / $length) > 0.6){
                        array_push($result,$val);
                    }
                }
            }
            return $this->sendResponse($result,'fetch food successfully');
        } else{
            return $this->sendError('no mood or id _user');
        }
    }

    public function detail(){
        if(isset($_GET['id_recipe']) and isset($_GET['id_user'])){
            $ingre = array();
            $data_recipe = DB::table('recipes')->where('id_recipe','=',$_GET['id_recipe'])->first();
            $aval_ingre = DB::table('fridges')->select('id_ingredients')->where('id_user','=',$_GET['id_user'])->get();
            $data_ingredients = DB::table('bahans')->select('id_ingredients')->where('id_recipe','=',$_GET['id_recipe'])->get();
            $counter = 0;
            foreach($data_ingredients as $datum){
                $cek = false;
                foreach($aval_ingre as $inge){
                    if($datum->id_ingredients == $inge->id_ingredients){
                        $cek = true;
                        array_push($ingre,array(
                            'id_ingredients'=>$datum->id_ingredients,
                            'avail'=>true));
                        $counter += 1;
                        break;
                    } 
                }
                if($cek == false){
                        array_push($ingre,array(
                            'id_ingredients'=>$datum->id_ingredients,
                            'avail'=>false));
                }
            }
            $percent = $counter / sizeof($data_ingredients);
            $response = array();
            array_push($response,array(
                "data_recipe" => $data_recipe,
                "ingredients" => $ingre,
                "percent" => $percent));
            return $this->sendResponse($response,"success");
        } else{
            return $this->sendError('missing query');
        }
    }

    public function masak(Request $request){
        $validator = Validator::make($request->all(), [
            'id_user' => 'required',
            'id_recipe' =>'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation error', $validator->errors());       
        }
        $aval_ingre = DB::table('fridges')->where('id_user','=',$request->id_user)->get();
        $data_ingredients = DB::table('bahans')->select('id_ingredients')->where('id_recipe','=',$_GET['id_recipe'])->get();
        foreach ($data_ingredients as $ingre){
            foreach($aval_ingre as $aval){
                if($ingre->id_ingredients === $aval->$id_ingredients){
                    if($aval->jumlah === 1){
                        $query = "DELETE FROM `fridges` WHERE id_user = ".$request->id_user." AND id_ingredients = ".$aval->id_ingredients;
                        DB::statement($query);
                    } else{
                        $query = "UPDATE `fridges` SET jumlah = ".($aval->jumlah-1)." WHERE id_user = ".$request->id_user." AND id_ingredients = ".$aval->id_ingredients;
                        DB::statement($query);
                    }
                }
            }
        }
        return $this->sendResponse([],'success');
    }
}