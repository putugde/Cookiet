<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController as BaseController;
use App\Fridge;
use Validator;

class FridgeController extends BaseController
{   
    public function getKulkas(){
        if(isset($_GET['id_user'])){
            $data = DB::table('fridges')->where('id_user','=',$_GET['id_user'])->join('ingredients','fridges.id_ingredients','=','ingredients.id_ingredients')->get();
            return $this->sendResponse($data,'get kulkas');
        } else{
            return $this->sendError('id_user required');
        }
    }

    public function tambahKulkas(Request $request){
        $validator = Validator::make($request->all(), [
            'id_user' => 'required',
            'id_ingredients' =>'required',
            'jumlah' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation error', $validator->errors());       
        }
        $data = DB::table('fridges')->where('id_user','=',$request->id_user)->where('id_ingredients','=',$request->id_ingredients)->first();
        if(isset($data)){
            $query = "UPDATE `fridges` SET jumlah = ".strval($data->jumlah+$request->jumlah)." WHERE id_fridge = ".$data->id_fridge;
            DB::statement($query);
            return $this->sendResponse([],'successfull add data');
        } else{
            $query = "INSERT INTO `fridges`(`id_user`,`id_ingredients`,`jumlah`)  VALUES (".$request->id_user." , ".$request->id_ingredients." ," .$request->jumlah.")";
            DB::statement($query);
            return $this->sendResponse([],'successfull add data');
        }
    }
}
