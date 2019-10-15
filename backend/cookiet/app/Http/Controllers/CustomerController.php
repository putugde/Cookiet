<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController as BaseController;
use App\Customer;
use Validator;

class CustomerController extends BaseController
{   
    public function createUser(request $request){
        $validator = Validator::make($request->all(), [
            'username' => 'required',
            'email' =>'required|email',
            'password' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation error', $validator->errors());       
        }
        $username = $request->username;
        $email = $request->email;
        $password = $request->password;

        $data = DB::table('customers')->select('username')->where('username','=',$request->username)->first();
        if(!isset($data)){
            $customer = new Customer;
            $customer->username = $request->username;
            $customer->password = md5($request->password);
            $customer->email = $request->email; 
            $customer->save();
            unset($customer->password);
            return $this->sendResponse($customer,'Register customer Succesfully');
        } else{
            return $this->sendError('username has been taken');
        }
    }

    public function login(request $request){
        $validator = Validator::make($request->all(), [
                'username' => 'required',
                'password' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation error', $validator->errors());       
        }
        $username = $request->username;
        $password = $request->password;
        $data = DB::table('customers')->where('username','=',$request->username)->where('password','=',md5($request->password))->first();
        if(isset($data)){
            unset($data->password);
            return $this->sendResponse($data,'Login success');
        } else{
            return $this->sendError('login error');
        }
    }
}
