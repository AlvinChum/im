<?php namespace App\Http\Controllers;

use App\company;
use App\emoji;
use App\group;
use App\group_history;
use App\groups;
use App\history_export;
use App\Http\Controllers\messages\MessagesPush;
use App\Http\Requests;
use App\message;
use App\message_history;
use App\relation;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Nette\Utils\DateTime;
use Symfony\Component\Console\Tests\Input\InputTest;
use Symfony\Component\HttpFoundation\Response;

class MessageController extends Controller
{


    public $message_push;
//    public $socket_ip = '192.168.100.138';

    public function __construct()
    {
        $server_config = Config::get('app.server_config');
//        $this->message_push = new MessagesPush($this->socket_ip);
        $this->message_push = new MessagesPush($server_config['sender_ip']);
        $this->middleware('login');
//        $data = DB::select("select id from users where openid collate utf8_bin = 'qsXf2eUcXqdXq4StMPnBsdxp6j5bgjbzvaDrJccPXVIwsMJ6V9N7gLUb'");
//        $userId = $data[0]->id;
//        Session::put('userid', $userId);


    }

    function get_tree_uls($data, $fid,$class) {
        $stack = array($fid);
        $child = array();
        $added_left = array();
        $added_right= array();
        $html_left     = array();
        $html_right    = array();
        $obj = array();
        $loop = 0;
        foreach($data as $node) {
            $pid = $node['parentId'];
            if(!isset($child[$pid])) {
                $child[$pid] = array();
            }
            array_push($child[$pid], $node['departmentId']);
            $obj[$node['departmentId']] = $node;
        }

        while (count($stack) > 0) {
            $id = $stack[0];
            $flag = false;
            $node = isset($obj[$id]) ? $obj[$id] : null;
            if (isset($child[$id])) {
                $cids = $child[$id];
                $length = count($cids);
                for($i = $length - 1; $i >= 0; $i--) {
                    array_unshift($stack, $cids[$i]);
                }
                $obj[$cids[$length - 1]]['isLastChild'] = true;
                $obj[$cids[0]]['isFirstChild'] = true;
                $flag = true;
            }
            if ($id != $fid && $node && !isset($added_left[$id])) {
                /*if(isset($node['isFirstChild']) && isset($node['isLastChild']))  {
                    $html_left[] = '<li class="first-child last-child">';
                } else if(isset($node['isFirstChild'])) {
                    $html_left[] = '<li class="first-child">';
                } else if(isset($node['isLastChild'])) {
                    $html_left[] = '<li class="last-child">';
                } else {*/
                    $html_left[] ="<ul class='$class'><li class=\"treeview\" style='overflow: hidden;text-overflow: ellipsis;'>";
//                }
                $html_left[] = "<a href=\"javascript:;\"><nobr><i class=\"fa fa-chevron-right \" style=\"color: #3a9ae0;\"></i><span class='getgroupname' data-flag=\"1\" data-id=\"{$node['departmentId']}\" title='{$node['departmentName']}'>{$node['departmentName']}</span></nobr></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"><li class=\"getgroupchat\" data-id=\"{$node['departmentId']}\"><a href=\"#\"><i class=\"pull-left im-group\"></i><span class=\"get_talk_name\">群聊</span></a></li>" ;
                $added_left[$id] = true;
            }
            if ($id != $fid && $node && !isset($added_right[$id])) {
                $html_right[] = '</ul></li></ul>' ;
                $added_right[$id] = true;
            }

            if ($flag == false) {
                if($node) {
                    $cids = $child[$node['parentId']];
                    for ($i = count($cids) - 1; $i >= 0; $i--) {
                        if ($cids[$i] == $id) {
                            array_splice($child[$node['parentId']], $i, 1);
                            break;
                        }
                    }
                    if(count($child[$node['parentId']]) == 0) {
                        $child[$node['parentId']] = null;
                    }
                }
                array_push($html_left, array_pop($html_right));
                array_shift($stack);
            }
            $loop++;
            if($loop > 5000) return $html_left;
        }
        unset($child);
        unset($obj);
        return implode('', $html_left);
    }
    /*
     * 加载所有用户与公司名单
     * @param1 array $data 包含所有数据的数组
     * @param2 int $fid 父id
     * @param3 string $class 控制树形结构的参数
     * @param4 boolean $show_user 是否显示旗下员工,默认为显示,true
     */
    /*private function get_tree_ul($data, $fid, $class, $show_user = true)
    {
        $all_user = User::get()->toArray();
//        foreach($all_user as $users){
//            $dpid = $users[''];
//        }
        $stack = array($fid);
        $child = array();
        $added_left = array();
        $added_right = array();
        $html_left = array();
        $html_right = array();
        $obj = array();
        $user = array();
        $loop = 0;
        foreach ($data as $node) {
            $pid = $node['parentId'];
            if (!isset($child[$pid])) {
                $child[$pid] = array();
            }
            array_push($child[$pid], $node['departmentId']);

            $obj[$node['departmentId']] = $node;
            foreach ($all_user as $u) {
                if ($u['departmentId'] == $node['departmentId']) {
                    $obj[$node['departmentId']]['haveuser'] = true;
                    $obj[$node['departmentId']]['user'][] = $u;
//                    array_push($obj[$node['departmentId']], $u);
                }
            }
        }
//        return $stack;
//var_dump($child);exit;
//        return $user;
        while (count($stack) > 0) {
            $id = $stack[0];
            $flag = false;
            $node = isset($obj[$id]) ? $obj[$id] : null;
            if (isset($child[$id])) {
                $flag = true;
                $cids = $child[$id];
                $length = count($cids);
                for ($i = $length - 1; $i >= 0; $i--) {
                    array_unshift($stack, $cids[$i]);
                    /*if (array_key_exists('user', $obj[$cids[$i]])) {
                        for ($k = 0; $k < count($obj[$cids[$i]]['user']); $k++) {
                            if ($show_user == true) {
                                $user[$cids[$i]][] = "<li><span class='getuserid'><a href=\"#\" class=\"sing-user\" data-id=\"{$obj[$cids[$i]]['user'][$k]['id']}\"><img src=\"/images/user_02.jpg\" class=\"img-circle\"><span class=\"get_talk_name\">{$obj[$cids[$i]]['user'][$k]['fullName']}</span></a></span></li>";;
                            } elseif ($show_user == false) {
                                $user[$cids[$i]][] = '';
                            }
//                            $user[$cids[$i]][] = "<li><a href='#' class='sing-user' data-id='{$obj[$cids[$i]]['user'][$k]['employee_id']}'><img src='/images/user_02.jpg' class='img-circle'><span class='get_talk_name'>{$obj[$cids[$i]]['user'][$k]['fullName']}</span></a></li>";
                        }
                    }
                }
                $obj[$cids[$length - 1]]['isLastChild'] = true;
                $obj[$cids[0]]['isFirstChild'] = true;
//                return implode('',$user[4]);
//                return $obj;

            }
            if ($id != $fid && $node && !isset($added_left[$id])) {
//                if(isset($node['isFirstChild']) && isset($node['isLastChild']))  {
//                    $html_left[] = '<li class="first-child last-child">';
//                } else if(isset($node['isFirstChild'])) {
//                    $html_left[] = '<li class="first-child">';
//                } else if(isset($node['isLastChild'])) {
//                    $html_left[] = '<li class="last-child">';
//                } else {
//                    $html_left[] = '<li class=\"treeview active\">';
//                }
                $html_left[] = "<ul class='$class'><li class=\"treeview active\">";
                if (array_key_exists('haveuser', $node)) {
//                    return implode('', $user[$node['departmentId']]);
//                    $html_left[] = ($flag === false) ? "<a href=\"#\" \"><i class=\"fa fa-home\" style=\"color: #3a9ae0;\"></i><span class='getgroupname'>{$node['departmentName']}</span><i class=\"fa fa-angle-left pull-right\"></i></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"><li class=\"getgroupchat\" data-id=\"{$node['departmentId']}\"><a href=\"#\"><i class=\"pull-left im-group\"></i><span class=\"get_talk_name\">群聊</span></a></li>" . implode('', $user[$node['departmentId']]) : "<a href=\"#\" ><i class=\"fa fa-home\" style=\"color: #3a9ae0;\"></i><span class='getgroupname'>{$node['departmentName']}</span><i class=\"fa fa-angle-left pull-right\"></i></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"><li class=\"getgroupchat\" data-id=\"{$node['departmentId']}\"><a href=\"#\"><i class=\"pull-left im-group\"></i><span class=\"get_talk_name\">群聊</span></a></li>";
                    $html_left[] = "<a href=\"#\" \"><i class=\"fa fa-home\" style=\"color: #3a9ae0;\"></i><span class='getgroupname'>{$node['departmentName']}</span><i class=\"fa fa-angle-left pull-right\"></i></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"><li class=\"getgroupchat\" data-id=\"{$node['departmentId']}\"><a href=\"#\"><i class=\"pull-left im-group\"></i><span class=\"get_talk_name\">群聊</span></a></li>" . implode('', $user[$node['departmentId']]);
                } else {
//                    $html_left[] = ($flag === true) ? "<a href=\"#\" \"><i class=\"fa fa-home\" style=\"color: #3a9ae0;\"></i><span class='getgroupname'>{$node['departmentName']}</span><i class=\"fa fa-angle-left pull-right\"></i></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"><li class=\"getgroupchat\" data-id=\"{$node['departmentId']}\"><a href=\"#\"><i class=\"pull-left im-group\"></i><span class=\"get_talk_name\">群聊</span></a></li>"  : "<a href=\"#\" data-id=\"\"><i class=\"fa fa-home\" style=\"color: #3a9ae0;\"></i><span class='getgroupname'>{$node['departmentName']}</span><i class=\"fa fa-angle-left pull-right\"></i></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"><li class=\"getgroupchat\" data-id=\"{$node['departmentId']}\"><a href=\"#\"><i class=\"pull-left im-group\"></i><span class=\"get_talk_name\">群聊</span></a></li>";
                    $html_left[] = "<a href=\"#\" \"><i class=\"fa fa-home\" style=\"color: #3a9ae0;\"></i><span class='getgroupname'>{$node['departmentName']}</span><i class=\"fa fa-angle-left pull-right\"></i></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"><li class=\"getgroupchat\" data-id=\"{$node['departmentId']}\"><a href=\"#\"><i class=\"pull-left im-group\"></i><span class=\"get_talk_name\">群聊</span></a></li>";
                    $added_left[$id] = true;
                }
            }
            if ($id != $fid && $node && !isset($added_right[$id])) {
//                $html_right[] = ($flag === true) ? '</ul></li></ul>' : '</ul></li></ul>';
                $html_right[] = '</ul></li></ul>';
                $added_right[$id] = true;
            }

            if ($flag == false) {
                if ($node) {
                    $cids = $child[$node['parentId']];
                    for ($i = count($cids) - 1; $i >= 0; $i--) {
                        if ($cids[$i] == $id) {
                            array_splice($child[$node['parentId']], $i, 1);
                            break;
                        }
                    }
                    if (count($child[$node['parentId']]) == 0) {
                        $child[$node['parentId']] = null;
                    }
                }
                array_push($html_left, array_pop($html_right));
                array_shift($stack);
            }
            $loop++;
            if ($loop > 5000) return $html_left;
        }
        unset($child);
        unset($obj);
        return implode('', $html_left);
    }*/
    /*
     * 获取所有联系人是显示旗下的员工
     */
    public function postGetContactDepartmentMember(){
        $department_id = Input::get('department_id');
        $group_id = Input::get('group_id');
        $g_data = groups::where('id',$group_id)->select('relation')->first();
        $relation = json_decode($g_data->relation,true);
        $user_data = User::where('departmentId',$department_id)->whereNotIn('openid',$relation)->select('openid','fullName','photo')->get();
        return $user_data;
    }
    /*
     * 获取当前公司旗下的员工
     */
    public function postGetCurrentDepartmentMember(){
        $department_id = Input::get('department_id');
        $user_data = User::where('departmentId',$department_id)->select('openid','fullName','photo')->get();
        $server_config = Config::get('app.server_config');
        $photo_server = $server_config['photo_server'];
        $str = '';
        foreach ($user_data as $user){
            $str .= "<li><span class='getuserid'><a href=\"javascript:;\" class=\"sing-user\" data-id=\"{$user['openid']}\"><img src=\"$photo_server/upload/photo/s_{$user['photo']}\" class=\"img-circle\"><span class=\"get_talk_name\">{$user['fullName']}</span></a></span></li>";
        }
        return $str;
    }



    /*
     * 获取所有总公司
     */
    public function postAllCompany()
    {
        $com_data = company::get()->toArray();
//        return $com_data;
        return $this->get_tree_uls($com_data, 0,'talk-company-menu');
    }

    public function postFindTest()
    {
        $user_id = Input::get('user_id');
        return $user_id;
    }

    /*
     * 显示im界面
     */
    public function getShowim()
    {
//        var_dump(Redis::get('all_user_info'));exit;
//        var_dump($this->user_info);exit;
//        var_dump($this->dept_info);exit;
//        var_dump($this->GetUsers());exit;
        $userPhoto = User::where('openid',Session::get('userid'))->select('photo')->first()->photo;
//        return Session::get('userid');

        $server_config = Config::get('app.server_config');
        $server = $server_config['server'];
        $photo_server = $server_config['photo_server'];
        $userPhoto = $photo_server.'/upload/photo/s_'.$userPhoto;
        Session::forget('group_id');
        return view('im')
//            ->with('company', $com)
//            ->with('depts', $depts)
//            ->with('dcount', $depts_count)
            ->with('userId', Session::get('userid'))
            ->with('username', Session::get('user_info')['data']['fullName'])
            ->with('photo_server', $photo_server)
            ->with('server_address',$server)
            ->with('userPhoto',$userPhoto);
    }

    /*
     * AJAX请求获取单对单聊天组的id
     */

    public function postGetgroup()
    {
        $send_to = (string)trim(Input::get('send_to_id'));
        $send_from = (string)Session::get('userid');

//        var_dump($send_to);var_dump($send_from);exit;
        $send_to_name = User::where('openid', $send_to)->select('fullName')->first();

//        var_dump($send_to_name->fullName);
//        exit;
        if ($send_from == $send_to) {
            return -9999;
        } else {
            //先转为json格式
            $arr1 = array(
                "user1" => $send_to,
                "user2" => $send_from
            );
            $arr2 = array(
                "user1" => $send_from,
                "user2" => $send_to
            );
            $relation1 = json_encode($arr1);
            $relation2 = json_encode($arr2);
//            var_dump($relation1,$relation2);exit;
            if (groups::where('relation', $relation1)->orWhere('relation', $relation2)->select('relation', 'id')->first()) {    //判断是否已经存在聊天组了
                $gid = groups::where('relation', $relation1)->orWhere('relation', $relation2)->select('relation', 'id','history_type')->first();
//                //创建会话历史记录
//                if(groups::where('id', $gid->id)->select('history_type')->first()->history_type == 0){
//                    self::addGroupHistory($gid->id, $send_from, $send_to_name->fullName,'no');
//                }
                if($gid->history_type == 0 ){
                    //查找当前用户有没有聊天历史
                    $a = group_history::where('group_id',$gid->id)->where('uid',$send_from)->first();
                    if(count($a) == 0){
                        self::addGroupHistory($gid->id, $send_from, $send_to_name->fullName,'no');
                    }

                }
                group_history::where('group_id', $gid->id)->update(['status' => 0]);
                return $gid->id;    //返回聊天组id
            } else {  //如果不存在则创建聊天组
                $g = new groups();
                $g->relation = $relation1;
                $g->type = 'single';
                $g->name = '';
                $g->history_type = 0;
                if ($g->save()) {
                    //创建会话历史记录
                    self::addGroupHistory($g->id, $send_from, $send_to_name->fullName, 'no');
                    return $g->id;
                } else {
                    return false;
                }
            }
        }
    }

    /*
     * AJAX请求获取群聊id
     */
    public function postGetGroupChatId()
    {
        $depts_id = trim(Input::get('depts_id'));//gid=1
        $user_id = (string)Session::get('userid');//create_id = 14
        $depts_name = company::where('departmentId', $depts_id)->select('departmentName')->first();
        //判断当前用户是否为该部门
        if (User::where('openid', $user_id)->where('departmentId', $depts_id)->first()) {
            $flag = true;
        } else {
            $flag = false;
        }
        $arr = array(
            "gid" => $depts_id,
        );
        $str = json_encode($arr);//{"gid":"1"}
        if (groups::where('relation', $str)->where('flag', 1)->first() && $flag == true) {  //寻找组内成员已创建的群聊，当前群聊只包含部门所有人
            //判断是否存在会话历史
            $gid = groups::where('relation', $str)->where('flag', 1)->first();
            $a = group_history::where('group_id', $gid->id)->Where('uid',$user_id)->get();
            if (groups::where('id', $gid->id)->select('history_type')->first()->history_type == 0  && count($a) == 0) {
                $obj_name = $depts_name->departmentName;
                self::addGroupHistory($gid->id, $user_id, $obj_name, 'no');//创建会话历史
                return $gid->id;
            } else {
                return $gid->id;
            }

//            if ($flag) {
//            $obj_name = $depts_name->departmentName;
//            } else {
//                $obj_name = $depts_name->departmentName . " & " . $username;
//            }
//             groups::where('relation', $str)->where('flag',1)->first();
//            var_dump($gid);exit;


        } else if (groups::where('relation', $str)->where('create_id', $user_id)->where('flag', 2)->first() && $flag == false) { //寻找组外成员已创建的群聊，当前群聊包含创建人与部门所有人
            $gid = groups::where('relation', $str)->where('create_id', $user_id)->where('flag', 2)->first();
            $a = group_history::where('group_id', $gid->id)->Where('uid',$user_id)->get();
            //判断是否存在会话历史
            if (groups::where('id', $gid->id)->select('history_type')->first()->history_type == 0 && count($a) == 0) {
                $username = User::where('openid', $user_id)->select('fullName')->first()->fullName;
//                $obj_name = $depts_name->departmentName . " & " . $username;
                $obj_name = $depts_name->departmentName ;
                self::addGroupHistory($gid->id, $user_id, $obj_name, 'no');//创建会话历史
            }
            return $gid->id;
        } else {         //创建新的群聊
            $g = new groups();
            $g->relation = $str;
            $g->type = 'group';
            $username = User::where('openid', $user_id)->select('fullName')->first()->fullName;
            if ($flag) {
                $obj_name = $depts_name->departmentName;
                $g->flag = 1;
            } else {
//                $obj_name = $depts_name->departmentName . " & " . $username;
                $obj_name = $depts_name->departmentName ;
                $g->flag = 2;
            }
            $g->name = $obj_name;
            $g->create_id = $user_id;
            if ($g->save()) {
                //创建会话历史
                self::addGroupHistory($g->id, $user_id, $obj_name, 'no');
                return $g->id;
            } else {
                return false;
            }
        }
    }
    /*
     * 删除多选的导出历史
     */
    public function postDeleteCurrentSelectHistory(){
        $checkbox = Input::get('checkbox');
        $group_id = Input::get('group_id');
        $checkbox = explode('&',$checkbox);
        $res = array();
        foreach($checkbox as $v){
            $res[] = substr($v,10);
        }
        if(history_export::whereIn('id',$res)->where('marked_group',$group_id)->delete()){
            return 'success';
        }
    }

    /*
     * 合并导出的历史
     */
    public function postMergeHistory(){
        $group_id = Input::get('group_id');
        $checkbox = Input::get('checkbox');
        $user_id = Session::get('userid');
        $time = Input::get('time');
        $checkbox = explode('&',$checkbox);
        $res = array();
        foreach($checkbox as $v){
            $res[] = substr($v,10);
        }

        $first_id = $res[0];
        $end_id = $res[count($res)-1];
        $first_data = history_export::where('id',$first_id)->select('start_message_id','start_content','start_time')->first();
        $end_data = history_export::where('id',$end_id)->select('end_message_id','end_content','end_time')->first();
        $first_start_message_id = $first_data->start_message_id;
        $first_start_content = $first_data->start_content;
        $first_start_time = $first_data->start_time;
//        $first_id_str = $first_data->id_str;
        $end__end_message_id = $end_data->end_message_id;
        $end_end_content = $end_data->end_content;
        $end_end_time = $end_data->end_time;
//        $end_id_str = $end_data->id_str;
//        $first_str_array = explode(',',$first_id_str);
//        $end_str_array = explode(',',$end_id_str);
//        $str_array = array_merge($first_str_array,$end_str_array);
//        $str_array = array_unique($str_array);
//        $id_str = implode(',',$str_array);
        $id_str_data = history_export::whereIn('id',$res)->select('id_str')->get();
        $id_str_array = array();
        foreach($id_str_data as $id_str){
            $str_array = explode(',',$id_str['id_str']);
            foreach($str_array as $sa){
                if(!in_array($sa,$id_str_array)){
                    $id_str_array[] = $sa;
                }
            }
        }
        $id_str_insert = implode(',',$id_str_array);
        //新建

        $insert_res = new history_export();
        $insert_res->start_message_id = $first_start_message_id;
        $insert_res->start_content = $first_start_content;
        $insert_res->start_time = $first_start_time;
        $insert_res->end_message_id = $end__end_message_id;
        $insert_res->end_content = $end_end_content;
        $insert_res->end_time = $end_end_time;
        $insert_res->id_str = $id_str_insert;
        $insert_res->marked_group = $group_id;
        $insert_res->marked_user_id = $user_id;
        $insert_res->time = $time;
        $insert_res->state = 1;
        if($insert_res->save()){
            history_export::whereIn('id',$res)->delete();
            return $insert_res->id;
        }




    }
    /*
     * 删除导出的聊天历史
     */
    public function postDeleteExportHistory(){
        $id = Input::get('id');
        if($res = history_export::where('id',$id)->delete()){
            return 'success';
        }else{
            return 'failed';
        }

    }
    /*
     * 获取当前组已经导出的聊天
     */
    public function postLoadExportHistory(){
        $group_id = Input::get('group_id');
        $user_id = Session::get('userid');
        $data = DB::table('history_export')->where('marked_group',$group_id)->where('marked_user_id',$user_id)->select('id','start_message_id','start_content','start_time','end_message_id','end_content','end_time')->get();
        return $data;
    }
    /*
     * 获取当前导出的所有信息
     */
    public function postGetExportInformation(){
        $str = Input::get('str');
        $id = Input::get('id');
        $pos = strpos($str,',');
        $res = array();
        if($pos == false){
            $first = $str;
            $data1 = message::where('id',$first)->select('content','send_time','msg_type')->first();
            $str1 = $data1->content.','.$data1->send_time.'|'.$data1->msg_type;
            $res['data1'] = $str1;
        }elseif($pos != false) {
            $first = substr($str,0,$pos);
            $data1 = message::where('id',$first)->select('content','send_time','msg_type')->first();
            $str1 = $data1->content.','.$data1->send_time.'|'.$data1->msg_type;
            $res['data1'] = $str1;
            $second = substr($str, $pos + 1, strlen($str));
            $data2 = message::where('id',$second)->select('content','send_time','msg_type')->first();
            $str2 = $data2->content.','.$data2->send_time.'|'.$data2->msg_type;
            $res['data2'] = $str2;
        }
        $res['id'] = $id;
        return $res;
    }
    /*
     * 编辑为TXT并下载聊天记录
     */
    public function postExportHistory(){
        $id = Input::get('id');
        $group_id = Input::get('group_id');
        $user_id = Session::get('userid');
        $id_str = history_export::where('id',$id)->select('id_str')->first()->id_str;
        $id_str = explode(',',$id_str);
/*        $data = DB::table('message as m')
            ->leftJoin('relation as r', 'm.id', '=', 'r.message_id')
            ->leftJoin('message_history as mh', 'mh.message_id', '=', 'r.message_id')
            ->leftJoin('users as u', 'u.openid', '=', 'mh.uid')
            ->where('r.group_id', $group_id)
            ->where('mh.uid', $user_id)
            ->whereIn('m.id', $id_str)
            ->select('m.id as mid','m.content as content','m.send_time as time','m.msg_type','u.fullName as name')
            ->get();
        return $data;*/
        $data = DB::table('message as m')
            ->leftJoin('relation as r', 'm.id', '=', 'r.message_id')
            ->leftJoin('message_history as mh', 'mh.message_id', '=', 'r.message_id')
            ->leftJoin('users as u', 'u.openid', '=', 'mh.uid')
            ->where('r.group_id', $group_id)
            ->where('mh.uid', $user_id)
            ->whereIn('m.id', $id_str)
            ->select('m.id as id', 'm.content as content', 'm.send_time as time', 'mh.uid as uid', 'mh.type as type', 'r.msg_type as msg_type', 'u.fullName as uname','u.photo as photo','mh.read as read','mh.message_type as group_type')
            ->orderBy('id', 'desc')
            ->get();
//        var_dump($data);exit;
        foreach($data as $k=>$d){
            if($d->type == 0){
                $send_id = message_history::where('message_id',$d->id)->where('type',1)->select('uid')->first()->uid;
                $send_data = User::where('openid',$send_id)->select('fullName','photo')->first();
                $data[$k]->photo = $send_data->photo;
                $data[$k]->uname = $send_data->fullName;
            }
        }
        return array_reverse($data);
      /*  $filename = date("YmdHis").'|'.$group_id . ".txt";
        $filepath = "log/" . $filename;
        foreach ($data as $v){
            if($v->msg_type == 1){
                $v->content = '[图片文件]';
            }elseif($v->msg_type == 2) {
                $v->content = '[传输文件]';
            }elseif($v->msg_type == 3){
                $v->content = '[震屏消息]';
            }
            try{
                $content = "-------------------------------------------\n"
                    . "发送者:{$v->name}\n"
                    . "发送时间:{$v->time}\n"
                    . "消息内容:{$v->content}\n\n\n";
                file_put_contents($filepath, $content, FILE_APPEND);
            } catch (Exception $ex) {

            }
        }
//        return $filepath;
        $this->downloadTxt($filename,$filepath);*/

    }
    private function downloadTxt($filename,$filepath){
//        if (!file_exists($filepath)) {
//            echo "文件不存在";
//        } else {
//            header('Content-Type: application/octet-stream');
//            header('Content-Disposition: attachment; filename=' . $filename);
//            header('Content-Length: ' . filesize($filepath));
//            header('Content-Transfer-Encoding: binary');
//            readfile($filepath);
//            ob_end_clean();
//            flush();
//            header("X-Sendfile: $filepath");
//            echo '<script>window.close();</script>';    //关闭下载窗口
//        }
//        $fp=fopen($filepath,"r");
//        $file_size=filesize($filepath);
////下载文件需要用到的头
//        Header("Content-type: application/octet-stream");
//        Header("Accept-Ranges: bytes");
//        Header("Accept-Length:".$file_size);
//        Header("Content-Disposition: attachment; filename=".$filename);
//        $buffer=1024;
//        $file_count=0;
////向浏览器返回数据
//        while(!feof($fp) && $file_count<$file_size){
//            $file_con=fread($fp,$buffer);
//            $file_count+=$buffer;
//            echo $file_con;
//        }
//        fclose($fp);
        $file= public_path(). '/'.$filepath;
        $headers = array(

            'Content-Type: text/plain',

        );

        return response()->download($file);
    }
    /*
     * 获取checkboxa数值
     */
    public function postCheckBoxValue(){
        $user_id = Session::get('userid');
        $group_id = Input::get('group_id');
        $checkbox = Input::get('checkbox');
        $time = Input::get('time');
        $checkbox = explode('&',$checkbox);
        $res = array();
        foreach($checkbox as $v){
            $res[] = substr($v,10);
        }
        $res_count = count($res);
        $start_id = $res[0];
        $end_id = $res[$res_count-1];
        $data1 = message::where('id',$start_id)->select('content','send_time','msg_type')->first();
        $data2 = message::where('id',$end_id)->select('content','send_time','msg_type')->first();
        if($data1->msg_type == 1){
            $content1 = '[图片文件]';
        }elseif($data1->msg_type == 2){
            $content1 = '[传输文件]';
        }elseif($data1->msg_type == 3){
            $content1 = '[震动消息]';
        }else{
            $content1 = $data1->content;
        }
        if($data2->msg_type == 1){
            $content2 = '[图片文件]';
        }elseif($data2->msg_type == 2){
            $content2 = '[传输文件]';
        }elseif($data2->msg_type == 3){
            $content2 = '[震动消息]';
        }else{
            $content2 = $data2->content;
        }
        sort($res);
        if($res_count == 1){
            $id_str = $res[0];
        }else{
            $id_str_data = DB::table('message as m')
                ->leftJoin('relation as r', 'm.id', '=', 'r.message_id')
                ->leftJoin('message_history as mh', 'mh.message_id', '=', 'r.message_id')
                ->leftJoin('users as u', 'u.openid', '=', 'mh.uid')
                ->where('r.group_id', $group_id)
                ->where('mh.uid', $user_id)
                ->whereBetween('m.id',$res)
                ->select('m.id')
                ->get();
//            return $id_str_data;
            $str_data = array();
            foreach($id_str_data as $isd){
                foreach($isd as $v){
                    $str_data[] = $v;
                }
            }
            $id_str = implode(',',$str_data);
        }

        $time1 = $data1->send_time;
        $time2 = $data2->send_time;
        $he = new history_export();
        $he->start_message_id = $start_id;
        $he->start_time = $time1;
        $he->start_content = $content1;
        $he->end_message_id = $end_id;
        $he->end_content = $content2;
        $he->end_time = $time2;
        $he->id_str = $id_str;
        $he->marked_group = $group_id;
        $he->marked_user_id = $user_id;
        $he->time = $time;
        if($he->save()){
            if($res_count == 1){
                $str = $he->id.'|'.$id_str;
                return $str;
            }else{
                $str = $he->id.'|'.$start_id.','.$end_id;
                return $str;
            }

        }else{
            return 'false';
        }
    }
    /*
     * 关键词搜索聊天记录
     */
    public function postSearchSubmit(){
        $user_id = Session::get('userid');
        $group_id = Input::get('group_id');
        $key_word = Input::get('key_word');
        $data = DB::table('message as m')
            ->leftJoin('relation as r', 'm.id', '=', 'r.message_id')
            ->leftJoin('message_history as mh', 'mh.message_id', '=', 'r.message_id')
            ->leftJoin('users as u', 'u.openid', '=', 'mh.uid')
            ->where('r.group_id', $group_id)
            ->where('r.msg_type',0)
            ->where('mh.uid', $user_id)
            ->where('m.content','like','%'.$key_word.'%')
            ->select('m.id as id', 'm.content as content', 'm.send_time as time', 'mh.uid as uid', 'mh.type as type', 'r.msg_type as msg_type', 'u.fullName as uname','u.photo as photo')
            ->orderBy('id', 'desc')
            ->get();
        return array_reverse($data);
    }
    /*
     * 聊天记录分页
     */
    public function postHistoryPage(){
        $page = Input::get('pages') ? Input::get('pages') : 1;
        $move = Input::get('move');
        $offset = ($page - 1) * 10;
        $group_id = Input::get('group_id');
        $user_id = Session::get('userid');

        if($move == 'count'){
            $count = DB::table('message as m')
                ->leftJoin('relation as r', 'm.id', '=', 'r.message_id')
                ->leftJoin('message_history as mh', 'mh.message_id', '=', 'r.message_id')
                ->leftJoin('users as u', 'u.openid', '=', 'mh.uid')
                ->where('r.group_id', $group_id)
                ->where('mh.uid', $user_id)
                ->select('m.id as id')
                ->count();
            return ceil($count/10);
        }
        if($move == ''){
            $data = DB::table('message as m')
                ->leftJoin('relation as r', 'm.id', '=', 'r.message_id')
                ->leftJoin('message_history as mh', 'mh.message_id', '=', 'r.message_id')
                ->leftJoin('users as u', 'u.openid', '=', 'mh.uid')
                ->where('r.group_id', $group_id)
                ->where('mh.uid', $user_id)
                ->select('m.id as id', 'm.content as content', 'm.send_time as time', 'mh.uid as uid', 'mh.type as type', 'r.msg_type as msg_type', 'u.fullName as uname','u.photo as photo')
                ->skip($offset)
                ->take(10)
                ->orderBy('id', 'desc')
                ->get();
            return array_reverse($data);
        }
    }
    /*
     * 后去未读的消息id
     */
    public function postGetRead(){
        $group_id = Input::get('group_id');
        $user_id = Session::get('userid');
        $g_data = groups::where('id',$group_id)->select('relation','type')->first();
        if(relation::where('group_id',$group_id)->count() == 0){
            return 'meiyou';
        }
        if($g_data->type == 'single'){
            $relation = json_decode($g_data->relation,true);
            if($relation['user1'] == $user_id){
                $user = $relation['user2'];
            }else{
                $user = $relation['user1'];
            }
            $data = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('mh.read', 1)->where('r.group_id', $group_id)->where('mh.uid', $user)->select('r.message_id as id')->get();
            $send = array();
            foreach($data as $v){
                $send[] = $v->id;
            }
            $s = implode(',',$send);
            if(count($s) == 0){
                return 'meiyou';
            }else {
                return $s;
            }
        }else{
            return 'meiyou';
        }

    }
    /*
     * AJAX获取聊天记录
     */
    public function postGetHistory()
    {
/*        $page = Input::get('pages') ? Input::get('pages') : 1;
        $group_id = Input::get('group_id');
        $group_data = groups::where('id',$group_id)->select('type','flag','relation')->first();
        $group_type = $group_data->type;
        $flag = $group_data->flag;
        if($group_type == 'single'){
            $take = 10 * 2 ;
        }elseif($group_type == 'group'){
            $relation = $group_data->relation;
            $group_array = json_decode($relation,true);
            $str = explode(',',$group_array['gid']);
            $count = User::whereIn('departmentId',$str)->count();
//            return $count;
//            return var_dump($str);
            if($flag == 1) {
                $take = 10 * $count;
            }elseif($flag == 2){
                $num = $count + 1;
                $take = 10 * $num;
            }
        }

//        return $take;
        $offset = ($page - 1) * $take;
//        $user_id = Session::get('userid');
        $data = DB::table('message as m')
            ->leftJoin('relation as r', 'm.id', '=', 'r.message_id')
            ->leftJoin('message_history as mh', 'mh.message_id', '=', 'r.message_id')
            ->leftJoin('users as u', 'u.id', '=', 'mh.uid')
            ->where('r.group_id', $group_id)
//            ->where('mh.uid', $user_id)
            ->select('m.id as id', 'm.content as content', 'm.send_time as time', 'mh.uid as uid', 'mh.type as type', 'r.msg_type as msg_type', 'u.fullName as uname','u.photo as photo')
            ->skip($offset)
            ->take($take)
            ->orderBy('id', 'desc')
            ->get();*/
        $page = Input::get('pages') ? Input::get('pages') : 1;
        $offset = ($page - 1) * 10;
        $group_id = Input::get('group_id');
        $user_id = Session::get('userid');
        $data = DB::table('message as m')
            ->leftJoin('relation as r', 'm.id', '=', 'r.message_id')
            ->leftJoin('message_history as mh', 'mh.message_id', '=', 'r.message_id')
            ->leftJoin('users as u', 'u.openid', '=', 'mh.uid')
            ->where('r.group_id', $group_id)
            ->where('mh.uid', $user_id)
            ->select('m.id as id', 'm.content as content', 'm.send_time as time', 'mh.uid as uid', 'mh.type as type', 'r.msg_type as msg_type', 'u.fullName as uname','u.photo as photo','mh.read as read','mh.message_type as group_type')
            ->skip($offset)
            ->take(10)
            ->orderBy('id', 'desc')
            ->get();
//        var_dump($data);exit;
        foreach($data as $k=>$d){
            if($d->type == 0){
                $send_id = message_history::where('message_id',$d->id)->where('type',1)->select('uid')->first()->uid;
                $send_data = User::where('openid',$send_id)->select('fullName','photo')->first();
                $data[$k]->photo = $send_data->photo;
                $data[$k]->uname = $send_data->fullName;
            }
        }
//        var_dump($data);
//        exit;
        if ($page == 1) {
            return array_reverse($data);
        } else {
            return $data;
        }
    }

    /*
     * AJAX发送信息，并写入数据库
     */
    /**
     * @return array
     */
    public function postGetmsg()
    {
        //接收信息
        $group_id = trim(Input::get('group_id'));
        $content = htmlspecialchars(trim(Input::get('msg')));
        $msg_type = trim(Input::get('msg_type')) ? trim(Input::get('msg_type')) : 0;
        $send_from = Session::get('userid');
        $time = Input::get('time');
        $send_to_name = User::where('openid', $send_from)->select('fullName')->first();
        //获取聊天组的成员信息
        $g_data = groups::where('id', $group_id)->select('relation', 'type', 'name')->first();
        $relation = $g_data->toArray();
        $r_data = json_decode($relation['relation'], true);
        $type = $relation['type'];
        if (($content == '' || $content == null) && $msg_type != 3) {
            return 'null';
        }
        if ($type == 'single') {
            //拆分聊天组信息
//            $relation = groups::where('id', $group_id)->select('relation', 'type', 'name')->first();
//            $arr = json_decode($relation->relation, true);
            $user1 = $r_data['user1'];
            $user2 = $r_data['user2'];
            if ($user1 == $send_from) {
                $send_to = $user2;

            } elseif ($user2 == $send_from) {
                $send_to = $user1;
            } else {
                return false;
            }
            $m = new message();
            $m->content = $content;
            $m->send_time = $time;
            $m->msg_type = $msg_type;
            if ($m->save()) {
                $message_id = $m->id;
                $r = new relation();
                $r->group_id = $group_id;
                $r->message_id = $message_id;
                $r->msg_type = $msg_type;
                $r->save();
//                var_dump(1142);exit;
                DB::table('message_history')->insert(array(
                    array('message_id' => $message_id, 'uid' => $send_from, 'type' => 1, 'read' => 1),
                    array('message_id' => $message_id, 'uid' => $send_to, 'type' => 0, 'read' => 0),
                ));
                $this->message_push->push($m->content, $send_to, $m->id, $msg_type);
                //创建会话历史
//                return $send_to_name;exit;

                //判断是否存在会话历史
                if (groups::where('id', $group_id)->select('history_type')->first()->history_type == 0) {
                    self::addGroupHistory($group_id, $send_to, $send_to_name->fullName, 'no');
                    groups::where('id', $group_id)->update(['history_type' => 1]);
                } else {
                    self::addGroupHistory($group_id, '', '', 'yes');
                }

                return array('name' => $send_to_name->fullName, 'content' => $m->content,'message_id'=> $message_id,'group_type' => $type);
            } else {
                return 'null';
            }
        }
        elseif($type == 'custom'){
            //不包含自己的数组
//            $member = array();
//            foreach($r_data as $v){
//                if($v != $send_from){
//                    $member[] = $v;
//                }
//            }
            $photo = User::where('openid',Session::get('userid'))->select('photo')->first()->photo;
            //增加message
            $m = new message();
            $m->content = $content;
            $m->send_time = $time;
            $m->msg_type = $msg_type;
            $m->save();
            $message_id = $m->id;
            //增加relation
            $r = new relation();
            $r->group_id = $group_id;
            $r->message_id = $message_id;
            $r->msg_type = $msg_type;
            $r->save();

            $message_history_for_all_user = array();              //保存该条消息的历史查看记录和存储该条消息是谁接收的（不包括自己）
            $push_user_id = array();    //保存推送的所有用户的id（不包括自己）

            $content_str = $m->content.'|'.$photo;

            for ($i = 0; $i < count($r_data); $i++) {
                if ($r_data[$i] != $send_from) {
                    $message_history_for_all_user[$i]['message_id'] = $message_id;
                    $message_history_for_all_user[$i]['uid'] = $r_data[$i];
                    $message_history_for_all_user[$i]['type'] = 0;
                    $message_history_for_all_user[$i]['read'] = 0;
                    $message_history_for_all_user[$i]['message_type'] = 'custom';
                    $push_user_id[] = $r_data[$i];
//                        $this->message_push->push($content_str ,$member[$i], $m->id, $msg_type);
                }
            }
//                var_dump($member);exit;
            $message_history_for_self = array('message_id' => $message_id, 'uid' => $send_from, 'type' => 1, 'read' => 1, 'message_type' => 'custom');       //保存该条消息的历史记录和存储该条消息为自己发送的
            //保存该条消息的历史查看记录和存储该条消息是谁接收的（包括自己）
            $message_history_for_all_user[] = $message_history_for_self;
            //message_history表
            DB::table('message_history')->insert($message_history_for_all_user);
            //推送消息
            $this->message_push->push($content_str ,$push_user_id, $m->id, $msg_type);

            //判断是否已经有会话历史
            $data = groups::where('id', $group_id)->select('history_type', 'add_new','name')->first();
//                    var_dump($data->history_type,$data->add_new);exit;
//                    return $member;
            if ($data->history_type == 0) {
                //创建会话
                $t_arr = array();
                for ($i = 0; $i < count($r_data); $i++) {
                    if($r_data[$i] != $send_from){
                        $t_arr[$i]['group_id'] = $group_id;
                        $t_arr[$i]['uid'] = $r_data[$i];
                        $t_arr[$i]['time'] = time();
                        $t_arr[$i]['object'] = $data->name;
                    }
                }
//                        return $t_arr;

                DB::table('group_history')->insert($t_arr);
//                        $time61 = time();
                //更新groups表的会话状态为已创建
                groups::where('id', $group_id)->update(['history_type' => 1, 'add_new' => 0]);
//                        $time7 = time();
//                        $timestr = $time1.'  |t1| '.$time2.'  |t2| '.$time3.'  |t3| '.$time4.'  |t4| '.$time51.'  |t5| '.$time61.'  |t6| '.$time7.'  |t7--';
//                        $this->log($timestr, implode(',', $push_user_id), $send_from);
            }
            if ($data->history_type == 1 && $data->add_new == 0) {
//                        $time52 = microtime();
//                        exit;
                //更新会话时间
//                        for ($i = 0; $i < count($push_user_id); $i++) {
//                        var_dump(123123);exit;
                self::addGroupHistory($group_id, '', '', 'yes');

//                        }
//                        $time62 = microtime();
//                        $timestr = $time1.'  |t1| '.$time2.'  |t2| '.$time3.'  |t3| '.$time4.'  |t4| '.$time52.'  |t5| '.$time62.'  |t6--';
//                        $this->log($timestr, implode(',', $push_user_id), $send_from);
            }
            if ($data->history_type == 1 && $data->add_new == 1) {
//                        var_dump(53424324);exit;
                //新增了人员,删除之前的人员
                DB::table('group_history')->where('group_id', $group_id)->delete();
                //创建新的会话
//                        DB::transaction(function()use($group_id,$member,$dept_name){
                $d = array();
                for ($i = 0; $i < count($r_data); $i++) {
//                                self::addGroupHistory($group_id, $member[$i], $dept_name,'no');

                    $d[] = ['group_id' => $group_id, 'uid' => $r_data[$i], 'time' => time(), 'object' => $data->name];
                }
//                        var_dump($d);exit;
                DB::table('group_history')->insert($d);
                //更新groups表的会话状态为已创建
                groups::where('id', $group_id)->update(['history_type' => 1, 'add_new' => 0]);
            }
            return array('name' => $send_to_name->name, 'content' => $content,'group_type' => $type);

        }
        elseif ($type == 'group') {
            //获取部门名称
//            $dept_name = depts::where('id', $r_data['gid'])->select('dept_name')->first();
            /*if (array_key_exists('uid', $r_data)) {  //组外成员
                $str = explode(',',$r_data['gid']);
                //获取当前聊天组成员
                $origin = User::whereIn('depts_id', $str)->select('id')->get()->toArray();
                $extra = User::where('id', $r_data['uid'])->select('id')->first()->toArray();
                $origin[] = $extra;
                $member = array();
                foreach ($origin as $v) {
                    $member[] = $v['id'];
                }
                $m = new message();
                $m->content = $content;
                $m->send_time = $time;
                $m->msg_type = $msg_type;
                if ($m->save()) {
                    $message_id = $m->id;
                    $r = new relation();
                    $r->group_id = $group_id;
                    $r->message_id = $message_id;
                    $r->msg_type = $msg_type;
                    $ha = array();
                    $push_user_id = array();
                    for ($i = 0; $i < count($member); $i++) {
                        if ($member[$i] != $send_from) {
                            $ha[$i]['message_id'] = $message_id;
                            $ha[$i]['type'] = 0;
                            $ha[$i]['uid'] = $member[$i];
                            $push_user_id[] = $member[$i];
                        }

                    }
                    $haha = array('message_id' => $message_id, 'uid' => $send_from, 'type' => 1);
                    $ha[] = $haha;
                    if ($r->save()) {
                        DB::table('message_history')->insert($ha);
                        $this->message_push->push($m->content, $push_user_id, $m->id , $msg_type);
                        //判断是否已经创建会话历史
                        if (groups::where('id', $group_id)->select('history_type')->first()->history_type == 0) {
                            $username = User::where('id',$r_data['uid'])->select('name')->first()->name;
                            $obj_name = $dept_name." & ".$username;
                            //创建会话
                            for ($i = 0; $i < count($member); $i++) {
                                self::addGroupHistory($group_id, $member[$i], $obj_name);
                            }
                            //更新groups表的会话状态为已创建
                            groups::where('id', $group_id)->update(['history_type' => 1]);
                        } else {
                            //更新会话时间
                            for ($i = 0; $i < count($member); $i++) {
                                self::addGroupHistory($group_id, $member[$i], $dept_name->dept_name);
                            }
                        }
                        return array('name'=>$send_to_name->name,'content'=>$content);
                    }
                }
            } else {  //组内成员*/
            //获取当前聊天组成员
//            $time1 = time();
            $photo = User::where('openid',Session::get('userid'))->select('photo')->first()->photo;
            $dept_name = $relation['name'];
            $str = explode(',', $r_data['gid']);
            $origin = User::whereIn('departmentId', $str)->select('fullName', 'openid')->get()->toArray();

            $member = array();
            foreach ($origin as $v) {
                $member[] = $v['openid'];
            }
            //判断推送的组成员中是否有当前用户，如果存在直接推送，没有则添加
            if (!in_array(Session::get('userid'), $member)) {
                array_push($member, Session::get('userid'));
            }
            $m = new message();
            $m->content = $content;
            $m->send_time = $time;
            $m->msg_type = $msg_type;
            if ($m->save()) {
//                $time2 = time();
                $message_id = $m->id;
                $r = new relation();
                $r->group_id = $group_id;
                $r->message_id = $message_id;
                $r->msg_type = $msg_type;
                $message_history_for_all_user = array();              //保存该条消息的历史查看记录和存储该条消息是谁接收的（不包括自己）
                $push_user_id = array();    //保存推送的所有用户的id（不包括自己）
                $content_str = $m->content.'|'.$photo;
                for ($i = 0; $i < count($member); $i++) {
                    if ($member[$i] != $send_from) {
                        $message_history_for_all_user[$i]['message_id'] = $message_id;
                        $message_history_for_all_user[$i]['uid'] = $member[$i];
                        $message_history_for_all_user[$i]['type'] = 0;
                        $message_history_for_all_user[$i]['read'] = 0;
                        $message_history_for_all_user[$i]['message_type'] = 'group';
                        $push_user_id[] = $member[$i];
//                        $this->message_push->push($content_str ,$member[$i], $m->id, $msg_type);
                    }
                }
//                var_dump($member);exit;
                $message_history_for_self = array('message_id' => $message_id, 'uid' => $send_from, 'type' => 1, 'read' => 1, 'message_type' => 'group');       //保存该条消息的历史记录和存储该条消息为自己发送的
                $message_history_for_all_user[] = $message_history_for_self;
                if ($r->save()) {
//                    $time3 = time();
                    DB::table('message_history')->insert($message_history_for_all_user);
//                    $this->log($m->content, implode(',', $push_user_id), $send_from);

//                    $this->message_push->push($content_str ,$push_user_id, $m->id, $msg_type);

                    $this->message_push->push($content_str ,$push_user_id, $m->id, $msg_type);
//                    $time4 = time();
                    //判断是否已经有会话历史
                    $data = groups::where('id', $group_id)->select('history_type', 'add_new')->first();
//                    var_dump($data->history_type,$data->add_new);exit;
//                    return $member;
                    if ($data->history_type == 0) {
//                        var_dump(2314);exit;
//                        exit;
                        //创建会话
                        $t_arr = array();
                        for ($i = 0; $i < count($member); $i++) {
                            if($member[$i] != $send_from){
                                $t_arr[$i]['group_id'] = $group_id;
                                $t_arr[$i]['uid'] = $member[$i];
                                $t_arr[$i]['time'] = time();
                                $t_arr[$i]['object'] = $dept_name;
                            }
                        }
//                        return $t_arr;

                        DB::table('group_history')->insert($t_arr);
//                        $time61 = time();
                        //更新groups表的会话状态为已创建
                        groups::where('id', $group_id)->update(['history_type' => 1, 'add_new' => 0]);
//                        $time7 = time();
//                        $timestr = $time1.'  |t1| '.$time2.'  |t2| '.$time3.'  |t3| '.$time4.'  |t4| '.$time51.'  |t5| '.$time61.'  |t6| '.$time7.'  |t7--';
//                        $this->log($timestr, implode(',', $push_user_id), $send_from);
                    }
                    if ($data->history_type == 1 && $data->add_new == 0) {
//                        $time52 = microtime();
//                        exit;
                        //更新会话时间
//                        for ($i = 0; $i < count($push_user_id); $i++) {
//                        var_dump(123123);exit;
                        self::addGroupHistory($group_id, '', '', 'yes');

//                        }
//                        $time62 = microtime();
//                        $timestr = $time1.'  |t1| '.$time2.'  |t2| '.$time3.'  |t3| '.$time4.'  |t4| '.$time52.'  |t5| '.$time62.'  |t6--';
//                        $this->log($timestr, implode(',', $push_user_id), $send_from);
                    }
                    if ($data->history_type == 1 && $data->add_new == 1) {
//                        var_dump(53424324);exit;
                        //新增了人员,删除之前的人员
                        DB::table('group_history')->where('group_id', $group_id)->delete();
                        //创建新的会话
//                        DB::transaction(function()use($group_id,$member,$dept_name){
                        $d = array();
                        for ($i = 0; $i < count($member); $i++) {
//                                self::addGroupHistory($group_id, $member[$i], $dept_name,'no');

                            $d[] = ['group_id' => $group_id, 'uid' => $member[$i], 'time' => time(), 'object' => $dept_name];
                        }
//                        var_dump($d);exit;
                        DB::table('group_history')->insert($d);
//                        });
//                        for ($i = 0; $i < count($member); $i++) {
//                            self::addGroupHistory($group_id, $member[$i], $dept_name,'no');
//                        }
                        $time61 = time();
                        //更新groups表的会话状态为已创建
                        groups::where('id', $group_id)->update(['history_type' => 1, 'add_new' => 0]);
                    }
                    return array('name' => $send_to_name->name, 'content' => $content,'group_type' => $type);
                }
            }
//            }
        }
    }

    private function log($msg, $userid = '', $send_from = '')
    {
        try {
            $time_str = date("Y-m-d H:i:s");
            $content = "-------------------------------------------\n"
                . "{$time_str}\n"
                . "msg:{$msg}\n"
                . "send_id:{$send_from}\n"
                . "userid:{$userid}\n\n\n";
            file_put_contents("log/" . date("Ymd") . ".txt", $content, FILE_APPEND);
        } catch (Exception $ex) {

        }
    }
    /*
     * 消息已读
     */
    public function postMessageCheck(){
        $message_id = Input::get('message_id');
        $group_id = Input::get('group_id');
        $user_id = Session::get('userid');
        $array = [$message_id];
//        return $array;
        $this->message_push->push(array(), $user_id, 'yidu','97');
        return $array;
//        $this->message_push->push($m->content, $send_to, $m->id, $msg_type);
    }

    /*
     * 判断接收用户是否合法
     */
    public function postChatMessage()
    {
        $message_id = Input::get('message_id');
        $current_group_id = Input::get('group_id');
        $relation = relation::where('message_id', $message_id)->select('group_id', 'msg_type')->first();
        $current_user_id = Session::get('userid');
//        var_dump($message_id,$current_group_id,$relation);exit;
        $group_id = $relation->group_id;
        $msg_type = $relation->msg_type;
        $relation = groups::where('id', $group_id)->select('relation', 'type', 'name')->first();
        $arr = json_decode($relation->relation, true);
        $data = array(); //存储用户信息
        if (empty($group_id)) {
            return false;
        } else {
            if ($relation->type == 'single') {
                $user1 = $arr['user1'];
                $user2 = $arr['user2'];
                if ($user1 == $current_user_id) {
                    $send_from = $user2;
                    $user = User::where('openid', $user2)->select('fullName','photo')->first();
                    $data['name'] = $user->fullName;
                    $data['photo'] = $user->photo;
                    $data['group_id'] = $group_id;
                    $data['type'] = 'single';
                    $data['msg_type'] = $msg_type;
                } else {
                    $send_from = $user1;
                    $user = User::where('openid', $user1)->select('fullName','photo')->first();
                    $data['name'] = $user->fullName;
                    $data['photo'] = $user->photo;
                    $data['group_id'] = $group_id;
                    $data['type'] = 'single';
                    $data['msg_type'] = $msg_type;
                }
            }
            /*elseif($relation->type == 'custom'){
                $user_data = DB::table('relation as r')->leftJoin('message_history as mh','r.message_id','=','mh.message_id')->where('r.group_id',$group_id)->where('mh.message_id',$message_id)->where('mh.type',1)->select('mh.uid as uid')->first();
                $group_name = groups::where('id',$group_id)->select('name')->first()->name;
                $send_id = $user_data->uid;
                $name = User::where('openid',$send_id)->select('fullName')->first()->fullName;

            }*/
            elseif ($relation->type == 'group' || $relation->type == 'custom') {
//                $name = $relation->name;
                $user_data = DB::table('relation as r')->leftJoin('message_history as mh','r.message_id','=','mh.message_id')->where('r.group_id',$group_id)->where('mh.message_id',$message_id)->where('mh.type',1)->select('mh.uid as uid')->first();
                $group_name = groups::where('id',$group_id)->select('name')->first()->name;
                $send_id = $user_data->uid;
                $name = User::where('openid',$send_id)->select('fullName')->first()->fullName;
                $data['name'] = $name;
                $data['group_id'] = $group_id;
                $data['group_name'] = $group_name;
                if($relation->type == 'group'){
                    $data['type'] = 'group';
                }else{
                    $data['type'] = 'custom';
                }
                $data['msg_type'] = $msg_type;
            }
            if($current_group_id == $group_id){
                $user_id = Session::get('userid');
                $res = DB::table('message_history as mh')->leftJoin('relation as r','mh.message_id','=','r.message_id')->where('r.group_id',$current_group_id)->where('r.message_id',$message_id)->where('mh.uid',$user_id)->update(['mh.read'=>1]);
                if ($relation->type == 'single') {
                    $send = "$message_id";
                    $this->message_push->push($send, $send_from, 'yidu', '97');
                }
            }
            return $data;
        }
    }


    /*
     * 插入会话记录
     */
    static private function addGroupHistory($group_id, $uid = '', $object = '', $type = 'no')
    {
        //判断是否已经存在会话记录
        if ($type == 'yes') {
            //更新时间
            DB::table('group_history')->where('group_id', $group_id)->update(['time' => time(), 'status' => 0]);
        } elseif ($type == 'no') {
            //创建会话历史
            DB::table('group_history')->insert(['group_id' => $group_id, 'uid' => $uid, 'time' => time(), 'object' => $object]);
        }
    }

    /*
     * 载入当前用户的聊天历史
     */
    public function postLoadHistory()
    {
        $user_id = Session::get('userid');
//        return $user_id;
        //判断是否已经存在会话历史
        $single_data = DB::table('group_history as gh')->leftJoin('groups as g','gh.group_id','=','g.id')->where('gh.uid',$user_id)->where('g.type','single')->where(function($query){$query->where('status',0)->orWhere('status',2);})->orderBy('time', 'desc')->select('g.type as type','gh.group_id as group_id','gh.object as object')->take(20)->get();
        $multi_data = DB::table('group_history as gh')->leftJoin('groups as g','gh.group_id','=','g.id')->where('gh.uid',$user_id)->where(function($query){$query->where('g.type','custom')->orWhere('g.type','group');})->where(function($query){$query->where('status',0)->orWhere('status',2);})->orderBy('time', 'desc')->select('g.type as type','gh.group_id as group_id','gh.object as object')->take(20)->get();
        $gh_data = array_merge($single_data,$multi_data);
//        foreach($multi_data as $k => $v){
//            $group_id = $v['group_id'];
//        }
//        var_dump($single_data);exit;
        if (count($gh_data) != 0) {
            //判断是群聊还是单聊
            foreach ($gh_data as $k => $v) {
                $group_id = $v->group_id;
                    $unread = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('r.group_id', $group_id)->where('mh.uid', $user_id)->where('mh.read', 0)->count();
                    if ($v->type == 'single') {
                        $gh_data[$k]->unread = $unread;
                        $gh_data[$k]->type = 'single';

                        $g_data = groups::where('id', $group_id)->select('relation')->first();
                        $relation = $g_data->toArray();
                        $r_data = json_decode($relation['relation'], true);
                        $user1 = $r_data['user1'];
                        $user2 = $r_data['user2'];
                        if($user1 == $user_id){
                            $photo = User::where('openid',$user2)->select('photo')->first()->photo;
                        }elseif($user2 == $user_id){
                            $photo = User::where('openid',$user1)->select('photo')->first()->photo;
                        }
                        $gh_data[$k]->photo = $photo;
                    } elseif($v->type == 'custom'){
                        $gh_data[$k]->unread = $unread;
                        $gh_data[$k]->type = 'custom';

                    }
                    elseif($v->type == 'group') {
                        $gh_data[$k]->unread = $unread;
                        $gh_data[$k]->type = 'group';
                    }
            }
            return array_reverse($gh_data);
        }
    }

    /*
     * 载入未读消息
     */
    public function postLoadUnreadMessage()
    {
        //查询所有未读消息数目
        $data['single_data'] = count(DB::table('message_history')->where('read', 0)->where('message_type', 'single')->where('uid', Session::get('userid'))->get());
        $data['group_data'] = count(DB::table('message_history')->where('read', 0)->where('message_type', 'group')->where('uid', Session::get('userid'))->get());
        $data['custom_data'] = count(DB::table('message_history')->where('read', 0)->where('message_type', 'custom')->where('uid', Session::get('userid'))->get());
        return $data;
    }

    /*
     * 删减未读消息数目
     */
    public function postReduceUnreadNumber()
    {
        $group_id = Input::get('group_id');
        $userid = Session::get('userid');
//        return $group_id;
//        return $userid;
        //1,9
        $data = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('mh.read', 0)->where('r.group_id', $group_id)->where('mh.uid', $userid)->select('r.message_id as id')->get();

        $send = array();
            foreach($data as $v){
                $send[] = $v->id;
            }
            if(count($data) != 0){

            $s = implode(',',$send);
            $g_data = groups::where('id',$group_id)->select('relation','type')->first();
            if($g_data->type == 'single'){
                $relation = json_decode($g_data->relation,true);
                if($relation['user1'] == $userid){
                    $user = $relation['user2'];
                }else{
                    $user = $relation['user1'];
                }
                $this->message_push->push($s, $user, 'yidu', 97);

            }

//            $this->message_push->push($s, $user, '', 97);
        }
//        $res = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('mh.read', 0)->where('r.group_id', $group_id)->where('mh.uid', $userid)->update(['mh.read' => 1]);
//        $count = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('mh.read', 0)->where('r.group_id', $group_id)->where('mh.uid', $userid)->count();
//        var_dump($res);exit;
        $res = DB::table('message_history')->whereIn('message_id',$send)->where('uid',$userid)->update(['read' => 1]);
        return $res;

    }

    public function getEmoji()
    {
        return json_encode(emoji::all()->toArray());
    }
    /*
     * 为上传文件而创建session保存group_id，上传完毕后销毁
     */
    public function postSetSessionForUpload(){
        $id = Input::get('group_id');
//        var_dump($id);
//        Session::put
        Session::forget('group_id');
        Session::put('group_id',$id);
        $gr = Session::get('group_id');
        return $gr;
    }
    public function postSetSession(){
        $id = Input::get('group_id');
//        var_dump($id);
//        Session::put
        Session::forget('group_id');
        Session::put('group_id',$id);
        $gr = Session::get('group_id');
        return $gr;
    }

    public function postUploadFileTwo(){
        $id = Session::get('group_id');
        $file = $_FILES;
        if($id == ''){
            return 'false';
        }
        if (!empty($file)) {
            $file_path = $_FILES['Filedata']['name'];
            $extension = substr(strrchr($file_path, '.'), 1);;
            $file_name = basename($file_path, '.' . $extension);
            $newName = md5(date('ymdhis') . $file_name) . "." . $extension;
            $path = 'uploads/files';
            if (move_uploaded_file($_FILES['Filedata']['tmp_name'], $path . '/' . $newName)) {
                $pic = $path . '/' . $newName . '|' . $file_path;
                return $pic;
            } else {
                return 'false';
            }
        }

    }
    /*
     * 上传文件
     */
    public function postUpload()
    {
        $image = Input::file('upload_image');
        $file = Input::file('upload_file');
        $group_id = Input::get('pic_group_id');
//        ini_set('max_execution_time', '3600'); //上传时间限制
//        ini_set('max_input_time ', '3600'); //上传时间限制
        if ($group_id == '') {
            exit("<script>alert('请选择用户！')</script>");
        }

        if ($image != '' && $file == '') {  //上传图片
//            $input = array('image' => $image);
//            $rules = array(
//                'image' => 'image'
//            );
//            $validator = Validator::make($input, $rules);
            $validator = Validator::make(['image' => $image], ['image' => 'image']);
            if ($validator->fails()) {
//                echo "<script>alert('上传的格式不对！')</script>";
                exit;
            }
            $filename = $image->getClientOriginalName();
            $extension = $image->getClientOriginalExtension(); //上传文件的后缀.
            $newName = md5(date('ymdhis') . $filename) . "." . $extension;
            $path = 'uploads/images';
            if ($image->move($path, $newName)) {
                $pic = $path . '/' . $newName;
                echo "<script>parent.upload_image('$pic')</script>";
            }
        }
    }

    public function postUploadFile()
    {
        if(!Session::has('group_id')){
             return Redirect::to('getauth');
        }
        $group_id = Session::get('group_id');
//        var_dump($group_id);exit;
        if($group_id == ''){
            exit;
        }
//        if ($group_id == '') {
//            return '请选择用户!';
//        }
        $file = $_FILES;
        if (!empty($file)) {
            $file_path = $_FILES['file']['name'];
            $extension = substr(strrchr($file_path, '.'), 1);;
            $file_name = basename($file_path, '.' . $extension);
            $newName = md5(date('ymdhis') . $file_name) . "." . $extension;
            $path = 'uploads/files';
            if (move_uploaded_file($_FILES['file']['tmp_name'], $path . '/' . $newName)) {
                $pic = $path . '/' . $newName . '|' . $file_path;
                echo $pic;
            } else {
                return '上传失败！';
            }
        }

    }
    /*
     * 减少全部未读数目
     */
    public function postReduceAllGroupUnread(){
        $type = Input::get('type');
        $userid = Session::get('userid');
//        return $type;
        if($type == 'single'){
//            $res1 = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('mh.read', 0)->where('')->select('r.message_id as id')->get();
            $res1 = DB::table('relation as r')->leftJoin('groups as g', 'g.id', '=', 'r.group_id')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('g.type', $type)->where('mh.read', 0)->select('mh.message_id as id','g.id as gid','g.relation as relation')->get();
            $res2 = DB::table('relation as r')->leftJoin('groups as g', 'g.id', '=', 'r.group_id')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('g.type', $type)->where('mh.read', 0)->groupBy('g.id')->select('g.id as gid','g.relation as relation')->get();
            $send = array();
            $a = array();
            foreach($res2 as $r){
                foreach($res1 as $k=>$v){
                    $send[] = $v->id;
                    if($r->gid == $v->gid){
                        $a[$r->relation][] = $v->id;
                    }
                }
            }
            if(count($res1) != 0){
                foreach($a as $k=>$v) {
                    $s = implode(',', $v);
                    $relation = json_decode($k, true);
                    if ($relation['user1'] == $userid) {
                        $user = $relation['user2'];
                    } else {
                        $user = $relation['user1'];
                    }
                    $this->message_push->push($s, $user, 'yidu', 97);
                }

            }
            $res = DB::table('message_history')->whereIn('message_id',$send)->where('uid',$userid)->update(['read' => 1]);
            return $res;
        }else {
            return 1;
            $res = DB::table('relation as r')->leftJoin('groups as g', 'g.id', '=', 'r.group_id')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('g.type', $type)->where('mh.read', 0)->update(['mh.read' => 1]);
            return $res;
        }
    }
    /*
     * 减少群聊的未读数目
     */
    public function postReduceGroupUnread(){
        $group_id = Input::get('group_id');
        $userid = Session::get('userid');
        $type = Input::get('type');
        if($type == 'single'){
            $res1 = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('mh.read', 0)->where('r.group_id', $group_id)->where('mh.uid', $userid)->select('r.message_id as id')->get();
            $send = array();
            foreach($res1 as $v){
                $send[] = $v->id;
            }
            if(count($res1) != 0){
                $s = implode(',',$send);
                $g_data = groups::where('id',$group_id)->select('relation')->first();
                $relation = json_decode($g_data->relation,true);
                if($relation['user1'] == $userid){
                    $user = $relation['user2'];
                }else{
                    $user = $relation['user1'];
                }
                $this->message_push->push($s, $user, 'yidu', 97);


            }
            $res = DB::table('message_history')->whereIn('message_id',$send)->where('uid',$userid)->update(['read' => 1]);
            return $res;

        }else {
            $res = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('mh.read', 0)->where('r.group_id', $group_id)->where('mh.uid', $userid)->update(['mh.read' => 1]);
            return $res;
        }
    }
    /*
     * 删除群聊
     */
    public function postDeleteGroupChat(){
        $group_id = Input::get('group_id');
        $userid = Session::get('userid');
        $type = Input::get('type');
        if($type == 'single'){
            $res1 = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('mh.read', 0)->where('r.group_id', $group_id)->where('mh.uid', $userid)->select('r.message_id as id')->get();
            $send = array();
            foreach($res1 as $v){
                $send[] = $v->id;
            }
            if(count($res1) != 0){

                $s = implode(',',$send);
                $g_data = groups::where('id',$group_id)->select('relation')->first();
                    $relation = json_decode($g_data->relation,true);
                    if($relation['user1'] == $userid){
                        $user = $relation['user2'];
                    }else{
                        $user = $relation['user1'];
                    }
                    $this->message_push->push($s, $user, 'yidu', 97);

            }
            $res = DB::table('message_history')->whereIn('message_id',$send)->where('uid',$userid)->update(['read' => 1]);
            $res2 = group_history::where('group_id',$group_id)->where('uid',$userid)->update(['status'=>1]);
            return $res.$res2;
        }else{
            $res1 = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('mh.read', 0)->where('r.group_id', $group_id)->where('mh.uid', $userid)->update(['mh.read' => 1]);
            $res2 = group_history::where('group_id',$group_id)->where('uid',$userid)->update(['status'=>1]);
            return $res1.$res2;
        }

    }
    /*
     * 删除左侧会话栏
     */
    public function postDeleteChatHistory()
    {
        $userid = Session::get('userid');
        $group_id = Input::get('group_id');
        if ($group_id == '') {
            return false;
        }
        $res1 = DB::table('relation as r')->leftJoin('message_history as mh', 'r.message_id', '=', 'mh.message_id')->where('mh.read', 0)->where('r.group_id', $group_id)->where('mh.uid', $userid)->select('r.message_id as id')->get();
        $send = array();
        foreach($res1 as $v){
            $send[] = $v->id;
        }
        if(count($res1) != 0) {

            $s = implode(',', $send);
            $g_data = groups::where('id', $group_id)->select('relation')->first();
            $relation = json_decode($g_data->relation, true);
            if ($relation['user1'] == $userid) {
                $user = $relation['user2'];
            } else {
                $user = $relation['user1'];
            }
            $this->message_push->push($s, $user, 'yidu', 97);
            $res = DB::table('message_history')->whereIn('message_id', $send)->where('uid', $userid)->update(['read' => 1]);
        }
        $res2 = group_history::where('group_id',$group_id)->where('uid',$userid)->update(['status'=>1]);
        return $res2;
    }

    /*
     * 跳转到下载页
     */
    public function getDownload($a, $b, $c, $d)
    {
        $filepath = $a . '/' . $b . '/' . $c;
        $downloadpath = '/' . $a . '/' . $b . '/' . $c;
        $orginname = $d;
        if (!file_exists($filepath)) {
            echo "文件不存在";
        } else {
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename=' . $d);
            header('Content-Length: ' . filesize($filepath));
            header('Content-Transfer-Encoding: binary');
            ob_end_clean();
            flush();
//            readfile($downloadpath);
            header("X-Sendfile: $downloadpath");
            echo '<script>window.close();</script>';    //关闭下载窗口
        }
    }

    /*
     * 加载联系人名单
     */
    public function postLoadRightContact()
    {
        $user_id =Session::get('userid');
        $group_id = Input::get('group_id'); //聊天组id
        $g_data = groups::where('id', $group_id)->select('relation', 'type','flag','create_id')->first(); //找出成员的json数据
        $r_data = json_decode($g_data->relation, true);  //转为数组格式
        if($g_data->type == 'custom'){
            $g_data = groups::where('id',$group_id)->select('create_id')->first()->create_id;
            $u_data['arr'] = User::whereIn('openid',$r_data)->select('fullName as event_name','openid','photo','departmentId')->get();
            $u_data['type'] = 'custom';
            if($g_data == $user_id){
                $u_data['flag'] = 'ok';
            }else{
                $u_data['flag'] = 'deny';
            }
            return $u_data;
        }
        if($g_data->type == 'group'){
            $arr = explode(',', $r_data['gid']);
            $dept_name['arr'] = company::whereIn('departmentId', $arr)->select('departmentName', 'departmentId')->get()->toArray();

            if ($g_data->flag == 2) {  //组外成员
                $extra_name = User::where('openid', $g_data->create_id)->select('fullName as event_name','photo')->first()->toArray();//发起人姓名
                array_push($dept_name['arr'], $extra_name);
                $dept_name['type'] = 'group';
                $dept_name['create_id'] = $g_data->create_id;
                return $dept_name;
            } else {
                $extra_name = array('event_name'=>'');
                array_push($dept_name['arr'], $extra_name);
                $dept_name['type'] = 'group';
                $dept_name['create_id'] = $g_data->create_id;
                return $dept_name;
            }
        }



    }

    /*
     * 当点击右侧部门时，加载所有的部门成员
     */
    public function  postGetAllDepartmentMember()
    {
        $dept_id = Input::get('dept_id');
        $data = User::where('departmentId', $dept_id)->select('openid', 'fullName','photo')->get();
        return $data;
    }

    /*
     * 加载右侧联系人数目
     */
    public function postLoadContactNumber()
    {
        $group_id = Input::get('group_id');
        $g_data = groups::where('id', $group_id)->select('relation', 'type')->first();
        $relation = $g_data->toArray();
        $r_data = json_decode($relation['relation'], true);
        if($g_data->type == 'custom'){
            $arr['num'] = count($r_data);
            $arr['type'] = 'custom';
            return $arr;
        }
        if($g_data->type == 'group'){
            $g_num = count(explode(',', $r_data['gid']));
            $dept_num = company::count();
            $arr['online_num'] = $g_num;
            $arr['dept_num'] = $dept_num;
            $arr['type'] = 'group';
            return $arr;
        }
    }

    /*
     * 增加所有联系人时加载所有部门
     */
    public function postGetAllCompany()
    {
        $com_data = company::get()->toArray();
        $str = "<div class='right-contact-plus-box'>" .
            "<div class='right-contact-plus-box-close'><a  href='javascript://'>x</a></div>" .
            "<div role=\"tabpanel\" class=\"tab-pane company-menu \" id=\"messagesss\">";
        $str .= $this->get_tree_uls($com_data, 0, 'talk-company-menu-copyx');

        $str .=
            "</div>" .
            "</div>";


        return $str;
//        var_dump($arr);

    }
    /*
     * 读取自定义的人
     */
    public function postGetOriginMember(){
        $group_id = Input::get('group_id');
        $g_data = groups::where('id',$group_id)->select('relation','type')->first();
        if($g_data->type == 'single'){
            $r_data = json_decode($g_data->relation,true);
            $u_data = User::where('openid',$r_data['user1'])->orWhere('openid',$r_data['user2'])->select('fullName','photo')->get();
            return $u_data;
        }
        if($g_data->type == 'custom'){
            $r_data = json_decode($g_data->relation,true);
           $u_data = User::whereIn('openid',$r_data)->select('fullName','photo')->get();
            return $u_data;
        }


    }
    /*
     * 退出自定义
     */
    public  function postQuitCustomGroup(){
        $group_id = Input::get('group_id');
        $user_id = Session::get('userid');
        $g_data = groups::where('id',$group_id)->select('relation','create_id')->first();
        $relation = json_decode($g_data->relation,true);
        $arr = array();
        foreach($relation as $v){
            if($v != $user_id){
                $arr[] = $v;
            }
        }

        $str_arr = json_encode($arr);
        groups::where('id',$group_id)->update(['relation'=>$str_arr]);
        group_history::where('uid',$user_id)->Where('group_id',$group_id)->delete();

        $gh_data = group_history::where('group_id',$group_id)->select('status','object')->first();
        if(count($gh_data) == 0){
            return $group_id;
        }else{

            if($gh_data->status == 0){
                $name_data = User::whereIn('openid',$arr)->select('fullName')->get();
                $str = '';
                foreach($name_data as $v){
                    $str .= $v['fullName'].'、';
                }
                $str = mb_substr($str,0,mb_strlen($str)-1);
                //更新
                $effect_row1 = groups::where('id', $group_id)->update(['name' => $str]);
                $effect_row2 = group_history::where('group_id', $group_id)->update(['object' => $str]);
                if ($effect_row1 != 0 && $effect_row2 != 0) {
                    $str = $str.'|'.$user_id;
                    $this->message_push->push($str,$arr,$group_id,95);
                }
            }elseif($gh_data->status == 2){
                //更新
                $str = $gh_data->object.'|'.$user_id;
                $this->message_push->push($str,$arr,$group_id,95);
            }
            return $group_id;
        }
    }
    /*
     * 删除自定义
     */
    public function postDeleteCustomGroup(){
        $group_id = Input::get('group_id');
        $delete_user_id = Input::get('user_id');
        $user_id = Session::get('userid');
        $g_data = groups::where('id',$group_id)->select('relation','create_id')->first();
        if($g_data->create_id != $user_id){
            //无权限
            return 'deny';
        }else{
            $relation = json_decode($g_data->relation,true);
            $arr = array();
            foreach($relation as $v){
                if($v != $delete_user_id){
                    $arr[] = $v;
                }
            }
            $json_arr = json_encode($arr);
            $a =groups::where('id',$group_id)->update(['relation'=>$json_arr]);
            $b =group_history::where('uid',$delete_user_id)->Where('group_id',$group_id)->delete();

            $gh_data = group_history::where('group_id',$group_id)->select('status','object')->first();
            if($gh_data->status == 0){
                $name_data = User::whereIn('openid',$arr)->select('fullName')->get();
                $str = '';
                foreach($name_data as $v){
                    $str .= $v['fullName'].'、';
                }
                $str = mb_substr($str,0,mb_strlen($str)-1);
                //更新
                $effect_row1 = groups::where('id', $group_id)->update(['name' => $str]);
                $effect_row2 = group_history::where('group_id', $group_id)->update(['object' => $str]);
                if ($effect_row1 != 0 && $effect_row2 != 0) {
                    $this->pushDeleteCustomGroup($group_id, $str,$delete_user_id);
                }else{
                    //更新数据失败
                    return 'fail';
                }
            }elseif($gh_data->status == 2){
                //更新
                $this->pushDeleteCustomGroup($group_id, $gh_data->object,$delete_user_id);
            }
            //成功
            return 'ok';

        }
    }
    /*
     * 增加自定义
     *
     *
     */
    public function postAddCustomGroup(){
        $group_id = Input::get('group_id');
        $new_user_id = Input::get('user_id');
        $user_id = Session::get('userid');
        $input_custom_name = Input::get('custom_name')?trim(Input::get('custom_name')):'';
        $g_data = groups::where('id',$group_id)->select('relation', 'name', 'id','create_id','flag','type')->first();
        $r_data = json_decode($g_data->relation,true);
        $username = User::where('openid',$new_user_id)->select('fullName','photo','departmentId')->first();

        $arr['username'] = $username->fullName;
        $arr['openid'] = $new_user_id;
        $arr['photo'] = $username->photo;

        if($g_data->type == 'single'){
            $user_arr = array();
            $user1 = $r_data['user1'];
            $user2 = $r_data['user2'];
            $self_name1 = User::where('openid',$user1)->select('fullName')->first()->fullName;
            $self_name2 = User::where('openid',$user2)->select('fullName')->first()->fullName;

            if($new_user_id == $user1 || $new_user_id == $user2){
                return 'already';
            }else{
                array_push($user_arr,$user1,$user2,$new_user_id);
                $json_user_arr = json_encode($user_arr);
//                $a = groups::where('id',$group_id)->update(['relation'=>$json_user_arr,'type' => 'custom','name'=>'聊天组','add_new'=>1]);
//                group_history::where('group_id',$group_id)->update(['object'=>'聊天组']);
                if($input_custom_name == '' || $input_custom_name == ' '){
                    if($user_id == $user1){
                        $name = $self_name1."、".$self_name2."、".$username->fullName;
                    }else{
                        $name = $self_name2."、".$self_name1."、".$username->fullName;
                    }
                }else{
                    $name = $input_custom_name;
                }
                $g = new groups();
                $g->relation = $json_user_arr;
                $g->type = 'custom';
                $g->name = $name;
                $g->create_id = $user_id;
                $g->history_type = 0;
                $g->save();
                    //创建会话历史记录
                    self::addGroupHistory($g->id,$user_id , $name, 'no');
                    $arr['group_id'] = $g->id;
                    $arr['name'] = $name;
                    $arr['departmentId'] = $username->departmentId;
                return $arr;
            }
        }

        if($g_data->type == 'custom'){
            if(in_array($new_user_id,$r_data)){
                return 'already';
            }
            array_push($r_data,$new_user_id);
            $json_user_arr = json_encode($r_data);
            $new_name = User::where('openid',$new_user_id)->select('fullName')->first()->fullName;
            $data = group_history::where('group_id',$group_id)->select('status')->first()->status;
            if($data == 0){

                $name = $g_data->name.'、'.$new_name;
                group_history::where('group_id',$group_id)->update(['object'=>$name]);
                groups::where('id',$group_id)->update(['relation'=>$json_user_arr,'type' => 'custom','name'=>$name,'add_new'=>1]);
                $arr['name'] = $name;
                $arr['group_id'] = $group_id;
                $arr['flag'] = 1;
                $arr['departmentId'] = $username->departmentId;
                $this->pushNewAddGroup($group_id,$name);
                return $arr;
            }elseif($data == 2){
                groups::where('id',$group_id)->update(['relation'=>$json_user_arr,'type' => 'custom','add_new'=>1]);
                $arr['group_id'] = $group_id;
                $arr['departmentId'] = $username->departmentId;
                $arr['flag'] = 2;
                $this->pushNewAddGroup($group_id,$new_name);
                return $arr;
            }

        }

    }
    /*
     * 增加群聊
     */
    public function postAddGroupChat()
    {
        $old_group_id = Input::get('old');
        $new_group = Input::get('new');
        //获取原来聊天组的数据
        $g_data = groups::where('id', $old_group_id)->select('relation', 'name', 'id','create_id','flag')->first()->toArray();
        $r_data = json_decode($g_data['relation'], true);
        //寻找创建人的公司id
        $u_data = User::where('openid',$g_data['create_id'])->select('departmentId')->first();
        //判断是否在聊天群里

        $id = $g_data['id'];
        //原来聊天组的群组id（1）
        $orgin_gid = $r_data['gid'];
        //判断点击的群组是否已经存在
        $orgin_gid_array = explode(',',$orgin_gid);
        if(in_array("$new_group",$orgin_gid_array)){
            return 'already';
        }
        //新增的组名
        $new_group_name = company::where('departmentId', $new_group)->select('departmentName')->first();
        $name = $g_data['name'] . " & " . $new_group_name->departmentName;
        $new_gid = $orgin_gid . "," . $new_group;
        //新的群组数据（1,3）
        $r_data['gid'] = $new_gid;
        $str = json_encode($r_data);
//            $data = explode(',', $new_gid);
//            var_dump($data);exit;
        //判断是否存在该成员
//        $user_id = Session::get('userid');
//        $num = User::where('departmentId',$new_group)->where('openid',$user_id)->count();
//        if($num != 0){
//
//        }

        if($new_group == $u_data->departmentId  && $g_data['flag'] == 2){
            $effect_row1 = groups::where('id', $id)->update(['relation' => $str,'flag'=>1,'name' => $name, 'add_new' => 1]);
        }else {
            $effect_row1 = groups::where('id', $id)->update(['relation' => $str, 'name' => $name, 'add_new' => 1]);
        }
//            return $effect_row1;
//            foreach($r_data as $k=>$v){
//
//            }
        group_history::where('group_id', $id)->update(['object' => $name]);
        if ($effect_row1 == 0) {  //更新失败
            return 'fail';
        } else {
            $array = array();
            $array['new_add_name'] = $new_group_name->departmentName;
            $array['name'] = $name;
            $array['id'] = $new_group;
            $this->pushNewAddGroup($old_group_id,$name);
            return $array;
        }
    }


    /*
     * 解散企业群聊
     */
    public function postDismissGroupChat(){
        $group_id = Input::get('group_id');
        $delete_user_id = Input::get('user_id');
//        $user_id = Session::get('userid');
        $g_data = groups::where('id',$group_id)->select('relation','create_id','type','history_type','flag')->first();
//        return $delete_user_id . $group_id;

        if($delete_user_id != $g_data->create_id){
            return $res['res'] = 'request_deny';
        }
        if($g_data->history_type == 0){
            $a = groups::where('id',$group_id)->update(['type'=>'delete','relation'=>'']);
            $b = group_history::where('group_id',$group_id)->update(['status'=>1]);

            return $group_id;
        }elseif($g_data->history_type == 1){
            $a = groups::where('id',$group_id)->update(['type'=>'delete','relation'=>'']);
            $b = group_history::where('group_id',$group_id)->update(['status'=>1]);
            $c = DB::table('message_history as mh')->leftJoin('relation as r','mh.message_id','=','r.message_id')->where('r.group_id',$group_id)->update(['mh.read'=>1]);
            $relation = json_decode($g_data->relation, true);

            $str = explode(',', $relation['gid']);
            $origin = User::whereIn('departmentId', $str)->select('openid')->get()->toArray();
            $member = array();
            foreach ($origin as $v) {
                if ($v['openid'] != Session::get('userid')) {
                    $member[] = $v['openid'];
                }
            }
            $this->message_push->push('', $member, $group_id, 94);
            return $group_id;
        }


    }

    /*
     * 推送新增群聊到所有客户端
     */
    private function pushNewAddGroup($group_id,$name){
        $g_data = groups::where('id', $group_id)->select('relation', 'history_type','type')->first();
        if ($g_data->history_type == 1) {
            //获取所有的被推id
            if($g_data->type == 'custom'){
                $relation = json_decode($g_data->relation, true);
                $member = array();
                foreach ($relation as $v) {
                    if ($v != Session::get('userid')) {
                        $member[] = $v;
                    }
                }
            }
            if($g_data->type == 'group'){
                $relation = json_decode($g_data->relation, true);
                $str = explode(',', $relation['gid']);
                $origin = User::whereIn('departmentId', $str)->select('openid')->get()->toArray();
                $member = array();
                foreach ($origin as $v) {
                    if ($v['openid'] != Session::get('userid')) {
                        $member[] = $v['openid'];
                    }
                }
            }
            $this->message_push->push($name, $member, $group_id, 98);
        }
    }
    /*
     * 群主删除自定义的聊天
     */
    private function pushDeleteCustomGroup($group_id, $name,$delete_openid){
        $user_id = Session::get('userid');
        //判断是否已经有聊天历史
        $g_data = groups::where('id', $group_id)->select('relation', 'history_type')->first();
        if ($g_data->history_type == 1) {
            //获取所有的被推id
            $relation = json_decode($g_data->relation, true);
            $member = array();
            foreach ($relation as $v) {
                if ($v != $user_id) {
                    $member[] = $v;
                }
            }
            $name = $name .'|'.$delete_openid;
            $this->message_push->push($name, $member, $group_id, 96);
            $this->message_push->push($name, $delete_openid, $group_id, 96);
        }

    }
    /*
     * 推送群聊的备注到所有客户端
     */
    private function pushNewTalkTitle($group_id, $name)
    {
        //判断是否已经有聊天历史
        $g_data = groups::where('id', $group_id)->select('relation', 'history_type','type')->first();
        if ($g_data->history_type == 1) {
            //获取所有的被推id
            $relation = json_decode($g_data->relation, true);
            if($g_data->type == 'custom'){
                $member = array();
                foreach ($relation as $v) {
                    if ($v != Session::get('userid')) {
                        $member[] = $v;
                    }
                }
            }
            if($g_data->type == 'group'){
                $str = explode(',', $relation['gid']);
                $origin = User::whereIn('departmentId', $str)->select('openid')->get()->toArray();
                $member = array();
                foreach ($origin as $v) {
                    if ($v['openid'] != Session::get('userid')) {
                        $member[] = $v['openid'];
                    }
                }
            }
            $this->message_push->push($name, $member, $group_id, 99);
        }
    }

    /*
     * 增加和修改聊天的标题的备注
     */
    public function postGetNewTalkTitle()
    {
        $new_name = trim(Input::get('name'));
        $group_id = Input::get('group_id');
        //获取之前的名称
        $orgin_name = groups::where('id', $group_id)->select('name','type')->first()->name;
        //如果输入为空则返回之前的名称(删除备注)
        if ($new_name == "" || $new_name == ' ') {

//            if (strpos($orgin_name, ')') != 0) {
//                $str = substr($orgin_name, strpos($orgin_name, ')') + 1, strlen($orgin_name));
//                //更新数据库的名称
//                $effect_row1 = groups::where('id', $group_id)->update(['name' => $str]);
//                $effect_row2 = group_history::where('group_id', $group_id)->update(['object' => $str]);
//                if ($effect_row1 != 0 && $effect_row2 != 0) {
//                    $this->pushNewTalkTitle($group_id, $str);
//                    return $str;
//                }
//            } else {
                return $orgin_name;
//            }
        }
        //判断是否存在
        //判断之前的名称是否有括号，如果有括号就替换括号的内容，没有则添加括号和备注名
//        if (strpos($orgin_name, "(") === false) {
            //没有则添加“（”
            $str = "(" . $new_name . ")" . $orgin_name;
            $str = $new_name ;
            //更新数据库的名称
            $effect_row1 = groups::where('id', $group_id)->update(['name' => $str]);
            $effect_row2 = group_history::where('group_id', $group_id)->update(['object' => $str,'status' => 2]);
            if ($effect_row1 != 0 && $effect_row2 != 0) {
                $this->pushNewTalkTitle($group_id, $str);
                return $str;
            }
//        } else {
            //之前已经新增备注
//            $orgin_mark = substr($orgin_name, strrpos($orgin_name, ")"), strlen($orgin_name));
//            $str = "(" . $new_name . $orgin_mark;
//            //更新数据库的名称
//            $effect_row1 = groups::where('id', $group_id)->update(['name' => $str]);
//            $effect_row2 = group_history::where('group_id', $group_id)->update(['object' => $str]);
//            if ($effect_row1 != 0 && $effect_row2 != 0) {
//                $this->pushNewTalkTitle($group_id, $str);
//                return $str;
//            }
//        }
    }

    /*
     * 判断改变的备注是否为群聊
     */
    public function postIfIsGroup()
    {
        $group_id = Input::get('group_id');
        $result = groups::where('id', $group_id)->select('type')->first()->type;
        if ($result == 'group' || $result == 'custom') {
            return "1";
        } elseif($result == 'single'){
            return "2";
        }
    }

    /*
     * 读取所有联系人
     */
    public function postGetAllMember(){
        $group_id = Input::get('group_id');
        $g_data = groups::where('id',$group_id)->select('relation')->first()->relation;
        $relation = json_decode($g_data,true);
        $u_data = User::whereNotIn('openid',$relation)->select('fullName','openid')->get();
        return  $u_data;
    }
}
