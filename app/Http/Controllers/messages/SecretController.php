<?php namespace App\Http\Controllers\messages;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class SecretController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
	}

	/*
	 *
	 *
	 * 单向加密*/
    public function secretEncode($text){
        if(is_array($text)){
            $text = implode('=',$text);
        }
        return bcrypt('yaojun',array('salt'=>'123456'));
    }

}
