<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="csrf-token" content="{{ csrf_token() }}" />

	<title>企管易IM</title>
	<link href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
	<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600&amp;subset=latin,latin-ext' rel='stylesheet'>
	<link href='/css/im.css' rel="stylesheet">
	<link href='/css/font-awesome.css' rel="stylesheet">
	<link href='/css/lightbox.css' rel="stylesheet">
	<link href='/css/jquery-ui.css' rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/js/uploadifive/uploadifive.css" />
	<link rel="stylesheet" href="/css/smartMenu.css" type="text/css" />

	<!-- Fonts -->
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
		<script src="http://libs.useso.com/js/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
    <!-- 用于退出讨论组或删除人员的确定模态框 -->
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="modal_delete">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">确认框</h4>
                </div>
                <div class="modal-body">
                    <p>确定退出吗？</p>
                    <div class="text-center icon-wait">
                        <i class="fa fa-spinner "></i>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="modal_enter">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    {{--<div class="group-id-hidden" style="display: none"></div>--}}
	<div class="wrapper">
	<div class='unreachable'><div id='maskLayer'></div><div class='l-wrapper'><svg viewBox='0 0 120 120' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'><g id='circle' class='g-circles g-circles--v1'><circle id='12' transform='translate(35, 16.698730) rotate(-30) translate(-35, -16.698730) ' cx='35' cy='16.6987298' r='10'></circle><circle id='11' transform='translate(16.698730, 35) rotate(-60) translate(-16.698730, -35) ' cx='16.6987298' cy='35' r='10'></circle><circle id='10' transform='translate(10, 60) rotate(-90) translate(-10, -60) ' cx='10' cy='60' r='10'></circle><circle id='9' transform='translate(16.698730, 85) rotate(-120) translate(-16.698730, -85) ' cx='16.6987298' cy='85' r='10'></circle><circle id='8' transform='translate(35, 103.301270) rotate(-150) translate(-35, -103.301270) ' cx='35' cy='103.30127' r='10'></circle><circle id='7' cx='60' cy='110' r='10'></circle><circle id='6' transform='translate(85, 103.301270) rotate(-30) translate(-85, -103.301270) ' cx='85' cy='103.30127' r='10'></circle><circle id='5' transform='translate(103.301270, 85) rotate(-60) translate(-103.301270, -85) ' cx='103.30127' cy='85' r='10'></circle><circle id='4' transform='translate(110, 60) rotate(-90) translate(-110, -60) ' cx='110' cy='60' r='10'></circle><circle id='3' transform='translate(103.301270, 35) rotate(-120) translate(-103.301270, -35) ' cx='103.30127' cy='35' r='10'></circle><circle id='2' transform='translate(85, 16.698730) rotate(-150) translate(-85, -16.698730) ' cx='85' cy='16.6987298' r='10'></circle><circle id='1' cx='60' cy='10' r='10'></circle></g><use xlink:href='#circle' class='use'/></svg></div></div>
		<!-- 整个IM框架 -->
		<section class="im col-xs-4">
			<!-- 工作类别栏 -->
			<aside class="work-type pull-left bg-opacity">
                <!-- <span class="work-im action"></span>
                <span class="work-flow"></span> -->
                <!-- Nav tabs -->
                <ul class="nav nav-tabs talk" role="tablist">
                    <li role="presentation" class="active talking">
                        <!-- 交谈中-->
                        <a href="#talking" aria-controls="talking" role="tab" data-toggle="tab"></a>
                        <span class="warn-im-message label-danger" id="talking_single_unread" style="display:none;">0</span>
                    </li>
                    <li role="presentation" class="takl-user">
                        <!--   交谈的人 -->
                        <a href="#messages" aria-controls="messages" role="tab" data-toggle="tab" ></a>
                        <span class="warn-im-message label-danger" style="display:none;">0</span>
                    </li>
                    <li role="presentation" class="talk-group">
                        <!-- 交谈gorup -->
                        <a href="#talk-group" aria-controls="talk-group" role="tab" data-toggle="tab"></a>
                        <span class="warn-im-message label-danger" id="talking_group_unread" style="display:none;">0</span>
                    </li>
                </ul>
                <span class="login-work-user">
                    <img src="{{$userPhoto}}" class="img-circle"  data-toggle="tooltip" data-placement="top" title data-original-title="{{$username}}" data-id="{{$userId}}">
                </span>
            </aside>
            {{--工作区--}}
            <div class="work-place">
                <div class="work-place-head">工作区</div>
            </div>
            <!-- 用户中心 -->
            <div class="work-user pull-left">
                <div>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <!-- 交谈中-->
                        <div role="tabpanel" class="tab-pane active" id="talking">
                            <div id="talk-user-form" class="talk-user-form"></div>
                        </div>
                        <div role="tabpanel" class="tab-pane company-menu" id="messages">
                            <div class="messagess"></div>
                        </div>
                        <div role="tabpanel" class="tab-pane group-menu" id="talk-group">
                            <ul class="talk-group-menu" id="tan"></ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 聊天板面 -->
            <div class="work-talk pull-left" >
                {{--<div class="work-talk-title"><span id="talk_name_show"></span></div>--}}
                <div class="work-talk-title">
                    <span id="talk_name_show" title=""></span>
                    <a class="add-member pull-right" data-type="custom" style="
                        margin-right: 20px;display: none;
                    "><i class="fa fa-plus"></i></a>
                </div>
                <div class="work-talk-show-content" >
                     <div id="work-talk-show-content" style="overflow: hidden; width: auto; height: 338px;padding-bottom: 30px;">

                     </div>
                     <!-- <div class="show-upload" style="display: none"></div> -->
                </div>
                <div class="work-talk-send">
                    <div class="work-talk-send-option">
                        <form name="uploadForm" id="uploadForm" action="{{URL('m/upload')}}" method="post"  target="tarframe" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                            <iframe src=""  width="0" height="0" style="display:none;" name="tarframe"></iframe>
                            <i class="fa fa-meh-o right10" id="emoji_i"></i>
                            <i class="fa fa-picture-o right10" onclick="document.getElementById('upload_image').click()"></i>
                            <input type="file" id="upload_image" name="upload_image"  style="display: none;">
                            <input type="hidden" name="MAX_FILE_SIZE" value="200000000">
                            <input type="hidden" id="pic_group" name="pic_group_id" value=""/>
                            <i class="fa fa-file-o right10"
                            onclick="document.getElementById('uploadifive-undefined').lastChild.click()">
                            </i>
                            {{--<i id='lofile' class="fa fa-chain right10" --}}{{--onclick="document.getElementById('upload_file').click()"--}}{{--></i>--}}
                            <input type="file" id="upload_file" name="upload_file"  style="display: none;">
                            <div class="show-upload" style="display: none"></div>
                            <i class="fa shake-logo right10"></i>
                            <i class="fa fa-history pull-right"></i>
                        </form>
                    </div>
                    <div class="form-group">
                        <textarea id="msg" class="form-control work-talk-content" rows="3"></textarea>
                    </div>
                    <div class="form-group btn-send">
                        <button type="submit" id="btnSend" class="btn btn-sm btn-primary" style="padding:3px 20px 3px 20px;">发送</button>
                    </div>
                    <div id="lc"></div>
                </div>
            </div>

            {{--聊天记录--}}
            <div class="work-history pull-left">
                <div>
                    <ul class="nav nav-tabs nav-tabs-history" role="tablist">
                        <li class=" show-talking-content pull-left disabled" role="presentation"><div id="history-show-talk-name"><span></span></div></li>
                        <li class="active chat-history pull-left" role="presentation"><a href="#chat-history-tab" aria-controls="chat-history-tab" role="tab" data-toggle="tab">聊天记录</a></li>
                        <li class="export-chat-history pull-left" role="presentation"><a href="#export-chat-history-tab" aria-controls="export-chat-history-tab" role="tab" data-toggle="tab">导出历史</a></li>
                        <li class="work-history-close  pull-right">
                            <i class="fa fa-times" title="关闭"></i>
                        </li>
                    </ul>
                    <div class="tab-content">
                        {{--聊天记录--}}
                        <div role="tabpanel" class="tab-pane active" id="chat-history-tab">
                            <div class="history-search">
                                <a class="fr pull-left" onclick="returnToHistory(); return false;" href="javascript:void(0);"><i class="fa fa-arrow-left"></i></a><div class="search-count pull-left"></div>
                                <a class="fr pull-right" onclick="search_submit(); return false;" href="javascript:void(0);"><i class="fa fa-search pull-right"></i></a>
                                <input type="text" class="js_search_txt pull-right" placeholder="搜索聊天记录" id="search_word" onkeydown="if(event.keyCode==13) { search_submit(); }" value="" style="width: 150px;">
                            </div>
                            <div class="history-content">
                                <!-- <div id="history-content" style="overflow: hidden; width: 504px; height: 410px;padding-bottom: 30px;">
                                
                                </div> -->
                            </div>
                            <div class="history-bottom">
                                <div class="tag-num-hidden" style="display: none"></div>
                                <div class="history-bottom-tag pull-left"><i class="fa fa-dot-circle-o pull-left"></i></div><div class="history-bottom-tag-number pull-left">标记了 <span>0</span> 个标记块</div>
                                <button type="button" class="btn btn-primary pull-left history-export-button">导出</button><button type="button" class="btn btn-primary pull-left history-reset-button">重置</button>
                                <div class="change-history-page pull-right">
                                    <button type="button" class="btn btn-link " id="history-page-first"><i class="fa fa-angle-double-left"></i></button>
                                    <button type="button" class="btn btn-link " id="history-page-prev"><i class="fa fa-angle-left"></i></button>
                                    <button type="button" class="btn btn-link " id="history-page-next" ><i class="fa fa-angle-right"></i></button>
                                    <button type="button" class="btn btn-link " id="history-page-last" ><i class="fa fa-angle-double-right"></i></button>
                                </div>
                                <div class="history-page-data" style="display: none" data-id="1"></div>
                                <div class="history-page-count" style="display: none" data-id=""></div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane " id="export-chat-history-tab">
                            <div class="export-history-content">

                            </div>
                            <div class="check-history-content" style="display: none">
                                <div class="return-export-history-content">
                                    <div class="search-count-copy" ><a class="fr"  href="javascript:void(0);" style="display: inline;"><i class="fa fa-arrow-left"></i></a>返回</div>

                                </div>
                                <div class="show-export-content" style="width: 503px;height: 420px"></div>
                            </div>
                            <div class="history-bottom">
                                <div class="history-bottom-tag pull-left"><i class="fa fa-dot-circle-o pull-left"></i></div><div class="history-bottom-tag-number pull-left">标记了 <span>0</span> 个标记块</div>
                                <button type="button" class="btn btn-primary pull-left export-select-button">全选/反选</button>
                                <button type="button" class="btn btn-primary pull-left export-delete-button">删除</button>
                                <button type="button" class="btn btn-primary pull-left history-merge-button">合并</button>
                            </div>
                        </div>
                        {{--导出记录--}}
{{--                        <div role="tabpanel" class="tab-pane" id="export-chat-history-tab">
                            <div class="export-history-content">
                            dddsfdfdsa
                            </div>
                            <div class="history-bottom">
                                <div class="history-bottom-tag pull-left"><i class="fa fa-dot-circle-o pull-left"></i></div><div class="history-bottom-tag-number pull-left">标记了 <span></span> 个标记块</div>
                                <button type="button" class="btn btn-primary pull-left history-export-button">导出</button><button type="button" class="btn btn-primary pull-left history-reset-button">重置</button>
                            </div>
                        </div>--}}
                    </div>
                </div>
            </div>
            {{--增加聊天成员--}}
            <div class="add-number-content pull-left">
                <div class="add-number-close">
                    <div class="add-number-name pull-left">编辑讨论组</div>
                    <i class="fa fa-times pull-right" style="padding-top: 8px;" title="关闭"></i>
                    <button type="button" class="btn btn-danger pull-right" title="退出讨论组" data-whatever='退出' data-toggle="modal" data-target='#modal_delete'>退出</button>
                    <!-- <div class="btn-group pull-right" role="group">
                       <button type="button" class="btn btn-default">解散讨论组</button>
                       <button type="button" class="btn btn-danger" title="退出讨论组" data-whatever='退出' data-toggle="modal" data-target='#modal_delete'>退出</button>
                    </div> -->
                </div>
                <div class="origin-member"></div>
                <div class="all-member-float"></div>
            </div>

            <div class="right-contact-plus-hide pull-left" style="height: 520px;width:200px;display: none;">
                <div class="right-contact-number-div" style="height: 38px;width: 200px">

                </div>
                <div class="right-contact-content-div" style="width: 200px;height: 480px"></div>
            </div>
		</section>
	</div>
    <script type="text/javascript">
    //当前用户的userId
            {{--user_id = -{{$userId}};--}}
            user_id = '{{$userId}}';
            //WebSocket = null;
            server_address = '{{$server_address}}';
            photo_server = '{{$photo_server}}';
        </script>
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src='/js/im.js'></script>
    <script src='/js/lightbox.js'></script>
    <script type="text/javascript" src="/js/sender.js"></script>
    <script type="text/javascript" src="/js/jquery-smartMenu.js"></script>
    {{--<script src="/js/plupload/plupload.full.min.js"></script>--}}
    <script type="text/javascript" src="/js/uploadifive/jquery.uploadifive.js"></script>
    <script src="/js/chat.js"></script>
    <!-- <script src="/js/t.js"></script> -->
    {{--<script type="text/javascript" src="http://www.zhangxinxu.com/study/js/jquery-smartMenu.js"></script>--}}
</body>
</html>

