<?php namespace App\Http\Middleware;

use App\company;
use App\Http\Controllers\oauth_client;
use App\relation;
use App\User;
use Closure;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Session;

class LoginMiddleware {
	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next)
	{
        /*if(array_key_exists('message',$user_info)){

            if($user_info['message'] == "缺少access token或http head中缺少Authorization" ){
                $oa = new oauth_client();

                return Redirect::to('/getauth');
            }else{
                return $next($request);
            }
        } else{

        }*/
        $com_data = count(company::get());
        $user_data = count(User::get());
        if($com_data == 0 || $user_data == 0){
            return Redirect::to('getauth');
        }
        $data = Session::get('user_info');
        $id_data = Session::get('userid');

        if($data['state'] != 0){
            return Redirect::to('/getauth');
        }
        if($data == '' || $data == null || $id_data == '' || $id_data == null){
            if($request->ajax()){
                return response('Unauthorized',401);
            }else{
                return Redirect::to('/getauth');
            }
        }
            return $next($request);

	}

}
