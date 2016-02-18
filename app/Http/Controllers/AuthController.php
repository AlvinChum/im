<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Session;

//use stdClass;

class AuthController extends Controller {

    public function __construct()
    {

    }

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
        $server_config = Config::get('app.server_config');
        $server = $server_config['server'];
//        var_dump($server);exit;
		//
        $oauth = new oauth_client('default');
        $get_uri = $oauth->get_authorize_code_uri($server.'/auth/login',csrf_token());
//        var_dump($get_uri);exit;
        self::checkSession();
        return Redirect::to($get_uri);
	}

    static private  function checkSession(){
        if(Session::get('user_info') == '' || Session::get('user_info') == null){
            Redis::flushall();
        }
    }
}
