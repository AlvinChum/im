<?php namespace App\Http\Controllers;

use App\access_token;
use App\company;
use App\User;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Session;

class WelcomeController extends Controller
{

    /*
    |--------------------------------------------------------------------------
    | Welcome Controller
    |--------------------------------------------------------------------------
    |
    | This controller renders the "marketing page" for the application and
    | is configured to only allow guests. Like most of the other sample
    | controllers, you are free to modify or remove it as you desire.
    |
    */

    /**
     * Create a new controller instance.
     *
     * @return void
     */
//	public function __construct()
//	{
////		$this->middleware('auth');
//	}

    /**
     * Show the application welcome screen to the user.
     *
     * @return Response
     */
    /*    static public function getRedisData($key)
        {
            if (Redis::EXISTS($key)) {
                return Redis::get($key);
            } else {
                $user_info = Session::get('user_info');
                $access_token = $user_info['access_token'];
                $app_token = $user_info['app_token'];
                if ($key == 'all_user_info') {
                    return self::get_all_user_info($app_token);
                } elseif ($key == 'user_info') {
                    return self::get_user_info($access_token);
                } elseif ($key == 'dept_info') {
                    return self::get_dept_info($app_token);
                }

            }
        }*/

    public function getLogin()
    {
        $server_config = Config::get('app.server_config');
        $server = $server_config['server'];

        $code = Input::get('code');
        $oa = new oauth_client('default');
//        var_dump($code);
//        var_dump($server);exit;
        //获取应用数据
        @$app_access_data = $oa->get_access_token_by_client_credential();

        //获取用户接口数据
        @$user_access_data = $oa->get_access_token_by_authorize_code($code, $server.'/auth/login');
//        var_dump($user_access_data);exit;
//        var_dump($user_access_data);exit;
        if ($user_access_data->response->state != 0 || $app_access_data->response->state != 0) {
            return Redirect::to('getauth');
        } else {

            //获取应用token
            @$app_access_token = $app_access_data->response->access_token;
            Session::put('app_access_token','');
            Session::put('app_access_token',$app_access_token);
//            var_dump($app_access_token);
//            var_dump(Session::get('app_access_token'));exit;
            //获取用户token
            @$user_access_token = $user_access_data->response->access_token;
//            var_dump($user_access_token);exit;
            //获取用户的refresh_token
            @$user_refresh_token = $user_access_data->response->refresh_token;

/*            $dept_info = json_decode(self::get_dept_info($app_access_token), true);
            foreach ($dept_info['data'] as $k => $depts) {
                $company = new company();
                $company->departmentId = $depts['departmentId'];
                $company->departmentName = $depts['departmentName'];
                $company->parentId = $depts['parentId'];
                $company->depth = $depts['depth'];
                $company->fullName = $depts['fullName'];
                $company->save();
            }
            var_dump($dept_info);exit;*/
            if(count(company::get()) == 0 || count(User::get()) == 0){
                $dept_info = json_decode(self::get_dept_info($app_access_token), true);
                $res_data = self::get_all_user_info($app_access_token,2);
                if($res_data == 'redirect_to_getauth'){
                    return Redirect::to('getauth');
                }
                //写入数据库
                DB::table('company')->truncate();
                DB::table('users')->truncate();
                foreach ($dept_info['data'] as $k => $depts) {
                    $company = new company();
                    $company->departmentId = $depts['departmentId'];
                    $company->departmentName = $depts['departmentName'];
                    $company->parentId = $depts['parentId'];
                    $company->depth = $depts['depth'];
                    $company->fullName = $depts['fullName'];
                    $company->save();
                }

                foreach($res_data as $r){
                    foreach($r as $user){
                        $users = new User();
                        $users->openid = $user['openid'];
                        $users->employee_id = $user['employee_id'];
                        $users->fullName = $user['fullName'];
                        $users->eMail = $user['eMail'];
                        $users->enName = $user['enName'];
                        $users->sex = $user['sex'];
                        $users->departmentId = $user['departmentId'];
                        $users->postion = $user['postion'];
                        $users->photo = $user['photo'];
                        $users->save();
                    }
                }
            }

            $user_info = json_decode(self::get_user_info($user_access_token), true);
            $user_info['access_token'] = $user_access_token;
            $user_info['app_token'] = $app_access_token;
            $user_info['refresh_token'] = $user_refresh_token;

            Session::put('user_info', $user_info);
//            $userId = User::where('openid', $user_info['data']['openid'])->orderBy("openid COLLATE utf8_bin ASC")->select('id')->first()->id;
            $openid = $user_info['data']['openid'];
//            $data = DB::select("select id from users where openid collate utf8_bin = '{$openid}'");
//            $userId = $data[0]->id;
            Session::put('userid', $openid);
//        var_dump(Session::get('userid'));exit;
            if ($user_info['state'] == 0) {
                return Redirect::to('m/showim');
            } else {
                return Redirect::to('getauth');
            }
        }

    }

    static private function microtime_float()
    {
        list($usec, $sec) = explode(" ", microtime());
        return ((float)$usec + (float)$sec);
    }
    static private function get_dept_info($app_access_token)
    {
        $server_config = Config::get('app.server_config');
        $oa_server = $server_config['oa_server'];
        $dept_info = file_get_contents("{$oa_server}/openapi/department?access_token={$app_access_token}");
        $dept_info_data = json_decode($dept_info, true);
        if ($dept_info_data['state'] != 0) {
            return Redirect::to('getauth');
        }
        Redis::set('dept_info', $dept_info);
        return $dept_info;
    }
//    static private function count_all_user($app_access_token)
    static private function get_all_user_info($app_access_token,$flag)
    {
        $server_config = Config::get('app.server_config');
        $oa_server = $server_config['oa_server'];
        //获取所有公司成员的openid
        $all_user_info_data = file_get_contents("{$oa_server}/openapi/user/openid_list?access_token={$app_access_token}");
        $all_user_info_data = json_decode($all_user_info_data, true);
        if ($all_user_info_data['state'] != 0) {
//            var_dump($all_user_info_data);exit;
            return 'redirect_to_getauth';
        }
        $all_user_array = $all_user_info_data['data'];
        if($flag == 1){
            return $all_user_array;
        }elseif($flag == 2){
            $res_data = array();
            $split = array_chunk($all_user_array,100);
            foreach($split as $s){
                $send_data = implode(',',$s);
                $url = "{$oa_server}/openapi/user/batchget?access_token={$app_access_token}";
                $post_data['openid_list'] = $send_data;
                $ch = curl_init();//初始化curl
                curl_setopt($ch, CURLOPT_URL,$url);//抓取指定网页
                curl_setopt($ch, CURLOPT_HEADER, 0);//设置header
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);//要求结果为字符串且输出到屏幕上
                curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
                curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
                $r = curl_exec($ch);//运行curl
                $res_json = json_decode($r,true);
                $res_data[] = $res_json['data'];
                curl_close($ch);
            }

            //获取所有公司成员的信息
            $redis_all_array = json_encode($all_user_array);
            Redis::set('all_user_info', $redis_all_array);

            return $res_data;
        }

    }

    /*
     * 预加载
    */
    public function postPreviousLoad()
    {
        $app_access_token = Session::get('app_access_token');
        $starttime = self::microtime_float();
        $dept_info = json_decode(self::get_dept_info($app_access_token), true);
        $all_user_array_count = self::get_all_user_info($app_access_token,1);
        if($all_user_array_count == 'redirect_to_getauth'){
            return 'redirect';
        }
        $res_data = self::get_all_user_info($app_access_token,2);
        $runtime = (int)ceil(number_format((self::microtime_float() - $starttime), 4));
//        var_dump(count($all_user_array));exit;
        if($runtime > 58){
            return false;
        }else{
            //判断数据库是否存在数据
            if(count($dept_info) != 0 && count($all_user_array_count) != 0) {
                if (count(company::get()) == 0 || count(User::get()) == 0 || count($all_user_array_count) != count(User::get()) || count(company::get()) != count($dept_info['data'])) {
                    //写入数据库
                    DB::table('company')->truncate();
                    DB::table('users')->truncate();
                    foreach ($dept_info['data'] as $k => $depts) {
                        $company = new company();
                        $company->departmentId = $depts['departmentId'];
                        $company->departmentName = $depts['departmentName'];
                        $company->parentId = $depts['parentId'];
                        $company->depth = $depts['depth'];
                        $company->fullName = $depts['fullName'];
                        $company->save();
                    }

                    foreach($res_data as $r){
                        foreach($r as $user){
                            $users = new User();
                            $users->openid = $user['openid'];
                            $users->employee_id = $user['employee_id'];
                            $users->fullName = $user['fullName'];
                            $users->eMail = $user['eMail'];
                            $users->enName = $user['enName'];
                            $users->sex = $user['sex'];
                            $users->departmentId = $user['departmentId'];
                            $users->postion = $user['postion'];
                            $users->photo = $user['photo'];
                            $users->save();
                        }
                    }
                    return 'success';
                }else{
                    return 'success';
                }
            }
        }
    }



    static private function get_user_info($user_access_token)
    {
        $server_config = Config::get('app.server_config');
        $oa_server = $server_config['oa_server'];
        $user_info = file_get_contents("{$oa_server}/openapi/u/get_user_info?access_token={$user_access_token}");
//        var_dump($user_info);exit;
        $user_info_data = json_decode($user_info, true);
        if ($user_info_data['state'] != 0) {
            return Redirect::to('getauth');
        }
        Redis::set('user_info', $user_info);
//        var_dump($user_info);exit;
        return $user_info;
    }



    static private function change_aeecss_token($access_token)
    {
        $oa = new oauth_client('default');
        $data = Session::get('user_info');
        $token = $data['refresh_token'];
        $oa->refresh_access_token($token);
    }

}
