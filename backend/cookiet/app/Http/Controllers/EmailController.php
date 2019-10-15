<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;
use Illuminate\Support\Facades\Mail; 

use Validator;

class EmailController extends BaseController
{
    public function sendEmail(request $request){
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' =>'required|email'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation error', $validator->errors());       
        }
        $to_name = $request->name;
        $to_email = $request->email;
        $data = array('name'=>$request->name, 'body' => "Thanks for the purchase");
        Mail::send('email', $data, function($message) use ($to_name, $to_email) {
            $message->to($to_email, $to_name)->subject("Purchase");
            $message->from("asketheral@gmail.com","etheral.id");
        });
        return $this->sendResponse($request,"successful");
 
    }
}
