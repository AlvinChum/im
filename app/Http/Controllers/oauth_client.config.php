<?php
$server_config = \Illuminate\Support\Facades\Config::get('app.server_config');;
return array(
//    "server" => "http://work.icom2work.com",
    "server" => $server_config['oa_server'],
    "client" => array(
        "default" => array(
            "client_id" => $server_config['oa_client_id'],
            "client_secret" => $server_config['oa_client_secret'],
        )
    )
);
