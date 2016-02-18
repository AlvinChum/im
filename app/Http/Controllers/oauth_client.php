<?php namespace App\Http\Controllers;
use App\Http\Requests;
use Illuminate\Http\Request;
use stdClass;


/**
 * OAuth2.0客户端
 */
class oauth_client {

    protected $server;
    protected $client_id;
    protected $client_secret;
    protected $entry_name;

    /**
     * 
     * @param type $entry_name 入口名称
     */
    function __construct($entry_name = NULL) {
        //加载基础配置
        $config = require_once 'oauth_client.config.php';
        if (isset($config["client"][$entry_name])) {
            $this->entry_name = $entry_name;
            $client = $config["client"][$entry_name];
        } else {
            $client = next($config["client"]);
            $this->entry_name = key($config["client"]);
        }
        $this->server = $config["server"];
        $this->client_id = $client["client_id"];
        $this->client_secret = $client["client_secret"];
    }

    /**
     * 通过客户端凭据获取客户端access_token
     */
    function get_access_token_by_client_credential() {
        $url = "{$this->server}/openapi/oauth2/access_token?grant_type=client_credential&client_id={$this->client_id}&client_secret={$this->client_secret}";
        return $this->curl_get($url);
    }

    /**
     * 获取请求用户授权url
     * @param type $redirect_uri 回调地址
     * @param type $state 客户端状态值
     * @param type $scope 申请scope权限
     * @param boolean $forcelogin 是否强制用户重新登录
     * @return string
     */
    function get_authorize_code_uri($redirect_uri, $state, $scope = "", $forcelogin = FALSE) {
        $url = "{$this->server}/openapi/oauth2/authorize?client_id={$this->client_id}&response_type=code&redirect_uri="
                . urlencode($redirect_uri) . "&state={$state}&scope={$scope}&forcelogin=" . ($forcelogin ? "true" : "false");
        return $url;
    }

    /**
     * 通过用户授权码获取用户access_token
     * @param type $code 用户授权码
     * @param type $redirect_uri 回调地址
     * @return type
     */
    function get_access_token_by_authorize_code($code, $redirect_uri) {
        $url = "{$this->server}/openapi/oauth2/access_token?grant_type=authorization_code&client_id={$this->client_id}&client_secret={$this->client_secret}&code={$code}&redirect_uri={$redirect_uri}";
        return $this->curl_get($url);
    }

    /**
     * 刷新用户授权凭据
     * @param type $refresh_token 刷新凭据
     * @return type
     */
    function refresh_access_token($refresh_token) {
        $url = "{$this->server}/openapi/oauth2/access_token?grant_type=refresh_token&client_id={$this->client_id}&client_secret={$this->client_secret}&refresh_token={$refresh_token}";
        return $this->curl_get($url);
    }

    /**
     * 检验授权凭证
     * @param type $access_token 授权凭据
     * @return type
     */
    function auth($access_token) {
        $url = "{$this->server}/openapi/oauth2/auth?access_token={$access_token}";
        return $this->curl_get($url);
    }

    /**
     * 撤销access_token授权
     * @param type $access_token 授权凭据
     * @return type
     */
    function revoke($access_token) {
        $url = "{$this->server}/openapi/oauth2/revoke?access_token={$access_token}";
        return $this->curl_get($url);
    }

    protected function curl_get($url, $assoc = false) {
        return $this->curl_request("GET", $url, NULL, $assoc);
    }

    protected function curl_post($url, $aVars, $assoc = false) {
        return $this->curl_request("POST", $url, $aVars, $assoc);
    }

    protected function curl_post_stream($url, $stream, $assoc = false) {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $stream);

        $oRet = new StdClass;
        $response = curl_exec($ch);
        $oRet->response = json_decode($response, $assoc);
        $oRet->status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        //写日志
        $this->writelog("POST", $url, $stream, $oRet->status, $response);

        return $oRet;
    }

    protected function curl_request($method, $url, $aVars, $assoc = false) {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $method = strtoupper($method);

        switch ($method) {
            case "DELETE":
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
                break;
            case "PUT":
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
            case "POST":
                curl_setopt($ch, CURLOPT_POST, 1);
                $stream = http_build_query($aVars);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $stream);
                break;
            case "GET":
            default:
        }

        $oRet = new StdClass;
        $response = curl_exec($ch);
        $oRet->response = json_decode($response, $assoc);
        $oRet->status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        //写日志
        $this->writelog($method, $url, $stream, $oRet->status, $response);

        return $oRet;
    }

    private function writelog($method, $url, $stream, $status, $response) {
        try {
            $time_str = date("Y-m-d H:i:s");
            $content = "------------------------------------------------------------------\n"
                    . "{$time_str}\n"
                    . "{$method} {$url}\n"
                    . "stream:{$stream}\n"
                    . "status:{$status}\n"
                    . "response:{$response}\n\n\n";
            file_put_contents("log/" . date("Ymd") . ".txt", $content, FILE_APPEND);
        } catch (Exception $ex) {
            
        }
    }

    /**
     * 获取消息列表
     * @param type $access_token
     * @return type
     */
    function get_notice_list($access_token) {
        $url = "{$this->server}/openapi/notice?access_token={$access_token}";
        return $this->curl_get($url);
    }

    /**
     * 获取消息列表
     * @param type $access_token
     * @return type
     */
    function get_notice($access_token) {
        $url = "{$this->server}/openapi/notice?access_token={$access_token}";
        return $this->curl_get($url);
    }

    /**
     * 获取用户信息
     * @param type $access_token
     * @return type
     */
    function get_user_info($access_token) {
        $url = "{$this->server}/openapi/u/get_user_info?access_token={$access_token}";
        return $this->curl_get($url);
    }

}
