<?php namespace App\Http\Controllers\messages;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;

class MessagesPush extends Controller {
    protected $_client;
    static $user_id = 0; //默认是系统发送的信息 当为0时就是系统发送的信息

/*    public function __construct($ip = '192.168.100.138' , $port = '3232'){
//        $this->_client = stream_socket_client('tcp://'.$ip.':'.$port,$err_no,$err_string);
//        if(!$this->_client){
//            throw new Exception('连接建立失败');
//        }
    }*/


    /* 发送信息
     * @param string $content 发送的内容
     * @param int|array $to_user_ids 发送给的用户 , 用户可以是一个或者多个 当发送到的用户为O时就是发给在线的所有人
     * @return bool
     * @throws Exception
     * */

     function push($content  , $to_user_ids , $message_id = 0 , $msg_type = 0 , $ip = '' , $port = ''){
         $server_config = Config::get('app.server_config');
         if($ip == ''){
             $ip = $server_config['sender_ip'];
         }
         if($port == ''){
             $port = $server_config['sender_send_port'];
         }
        if(is_array($to_user_ids) == false){
            $to_user_ids = array($to_user_ids);
        }
//         $to_user_ids = array(17);
        foreach($to_user_ids as $to_user_id){
            $_client = stream_socket_client('tcp://'.$ip.':'.$port,$err_no,$err_string);

//            $to_user_id = intval($to_user_id);
//            var_dump($content,$to_user_id);
            $message = $this->setMessage($content,$to_user_id,$message_id , $msg_type);
//            var_dump($message);
            if(fwrite($_client,$message."\n") === false) {
                //发送失败 TODO
//                var_dump($to_user_id);
            } else {
                fclose($_client);

                //发送成功 TODO
            }
        }
    }

    /* 设置推送的信息
     * @param string $content : 推送的内容
     * @param int $to_user_id : 抢着给的用户
     * @return bool
     * */
    public function setMessage($content , $to_user_id , $message_id , $msg_type = 0){
        $message = array(
            'type' => 'send',
            'to_user_id' => $to_user_id,
            'content' => $content,
            'user_id' => self::$user_id,
            'message_id' => $message_id,
            'msg_type' => $msg_type
        );
        return json_encode($message);
    }

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
	}

	/**
	 *  发送信息
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}
    function pushBack($content  , $to_user_ids , $message_id = 0 , $msg_type = 0,$ip = '192.168.100.138' , $port = '3233'){
        if(is_array($to_user_ids) == false){
            $to_user_ids = array($to_user_ids);
        }
//         $to_user_ids = array(17);
        foreach($to_user_ids as $to_user_id) {
            $to_user_id = intval($to_user_id);
//            var_dump($content,$to_user_id);
            /*            $message = $this->setMessage($content, $to_user_id, $message_id, $msg_type);
                        $this->_client = stream_socket_client('tcp://'.$ip.':'.$port,$err_no,$err_string);
                        if(!$this->_client){
                            throw new Exception('连接建立失败');
                        }

                        if(fwrite($this->_client,$message."\n") === false) {
                            //发送失败 TODO
            //                var_dump($message.'11');exit;
                        } else {
                            //发送成功 TODO
            //                var_dump($message);exit;
                            fclose($this->_client);
                        }*/

            // 指明给谁推送，为空表示向所有在线用户推送
            $to_uid = $to_user_id;
// 推送的url地址，上线时改成自己的服务器地址
//            $push_api_url = "http://192.168.100.138:2121/";
            $push_api_url = "http://localhost:2121/";
            $post_data = array(
                "type" => "publish",
                "content" => $content,
                'message_id' => $message_id,
                'msg_type' => $msg_type,
//                'title' => 'title',
                "to" => $to_uid,
            );
//            var_dump($post_data);exit;
            $ch = curl_init ();
            curl_setopt ( $ch, CURLOPT_URL, $push_api_url );
            curl_setopt ( $ch, CURLOPT_POST, 1 );
            curl_setopt ( $ch, CURLOPT_HEADER, 0 );
            curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
            curl_setopt ( $ch, CURLOPT_POSTFIELDS, $post_data );
            $return = curl_exec ( $ch );
            curl_close ( $ch );
//            var_export($return);
        }
//            var_dump($message);



    }
}
