$(function () {


    $.im.index = {
        talk_content_height: 0
    };
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    /*
     // 连接服务端
     var socket = io(' '+document.domain+':2120');
     // 连接后登录
     socket.on('connect', function(){
     socket.emit('login', user_id);
     });
     //alert(user_id);
     // 后端推送来消息时
     socket.on('new_msg', function(msg){
     console.log(msg);
     //$('#content').html('收到消息：'+msg.message);
     show_msg(msg);
     //$('.notification.sticky').notify();
     });*/


    prev_load();
    //getAllCompany();
    $('#talk-user-form').slimScroll({
        height: '510px',
        size: '2px'
    });
    $('#tan').slimScroll({
        height: '510px',
        size: '2px'
    });


    $('#talk-history-form').slimScroll({
        height: 'auto',
        size: '2px'
    });
    $('.login-work-user img').tooltip();
    //Flat red color scheme for iCheck
    loadHistory();
//            $('#talk-user-form').unbind('click');
    $('#talk-user-form').on('click', '.talk-sing-user', function () {
        if (!$(this).hasClass('active')) {
            var $this = $(this).find('a');
            getGroupId($this);
        }
    });
//            $('.talk-group-menu').unbind('click');
    $('.talk-group-menu').on('click', '.getgroupchat', function () {
        var $this = $(this);
        getGroupChatId($this);
    });

    //$('.work-im.action').on('click', showWorkPlace);
    //$('.work-flow').on('click', closeWorkPlace);

//            $('.work-user').on('click','.getgroupchat',getGroupChatId);
//            $(document).ready(function(){
//
//            });
//            getAllCompany();
//             $('#talk-user-form').unbind('click');
    $('#talk-user-form').on('click', '.talk-sing-user .pull-right.close', delChatHistory);

    //uploadifive上传文件
    $('.show-upload').uploadifive({
        'multi': false,
        'uploadScript': '/m/upload-file-two',
        'buttonClass': 'pull-left',
        'buttonText': '',
        'fileSizeLimit': 100000,
        'hideButton': true,

        // Put your options here
        'onSelect': function (file) {
            var gid = $('div').data('group_id');
            if (gid == '' || gid == undefined) {
                alert('请选择分组');
                $('.show-upload').uploadifive('cancel', $('.uploadifive-queue-item').first().data('file'));
                $('.uploadifive-undefined-queue').remove();
                return false;
            }
            var data = {
                group_id: gid
            };
            $.post('/m/set-session', data, function () {
            });
            var queue = $('.uploadifive-queue');
            queue.show();
            queue.css('cssText', 'position: absolute;height: 20px;z-index: 88;width: 504px;');
            $(queue).insertAfter('.work-talk-send-option');
            //$('#uploadifive-undefined .uploadifive-queue').remove();

            //var id = $('div').data('group_id');
            //alert(id);
        },
        'onQueueComplete': function (queueData) {
            //console.log(queueData);

            setTimeout(function () {
                $('.uploadifive-queue-item.complete').remove()
            }, 1800);
        },
        'onUploadError': function (file, errorCode, errorMsg, errorString) {
            setTimeout(function () {
                $('.uploadifive-queue-item.error').remove()
            }, 1800);
        },
        'onUploadComplete': function (file, data) {

            if (data == 'false') {
                $('.uploadifive-queue-item.complete').remove();
                alert('请重新选择聊天组');
                return false;
            }
            var t = new Date();
            var time = t.toLocaleString();

            var pic = data;
            var href = pic.substr(0, pic.indexOf('|'));
            $('#work-talk-show-content .talk-sing-user:last .pull-right .popover .popover-content a').attr('href', "/" + href);
            //$('#work-talk-show-content .talk-sing-user:last .pull-right .popover').addClass('file');
            sendMsg($(this), 2, pic);
        }
    });
    /*    $('.fa.fa-chain.right10').unbind('click');
     $('.fa.fa-chain.right10').on('click',function(){
     $('#uploadifive-undefined input').unbind('click');
     $('#uploadifive-undefined input').unbind('trigger');
     $('#uploadifive-undefined input').trigger('click');

     })*/


    $('#btnSend').bind('click', sendMsg);
//            $('#talk_name_show').unbind('click');
    $('#talk_name_show').on('click', changeTalkTitle);
//            $('.nav.nav-tabs.talk').unbind('click');
    $('ul.talk li').on('click', closeRightContact);

    //上传文件
    //pluploadFile();
    $('.shake-logo').on('click', function () {
        if ($('div').data('group_id') > 0) {
            //如果有group_id就发送
            sendMsg($(this), 3);
        }
    });

    $("#upload_image").change(function () {
        var group_id = $('div').data('group_id');
        $('#pic_group').val(group_id);
        $("#uploadForm").submit();
    });
    $('.fa.fa-history.pull-right').unbind('click');
    $('.fa.fa-history.pull-right').on('click', function () {
        var group_id = $('div').data('group_id');
        if (group_id != undefined && group_id != '' && group_id != 0) {
            searchHistory();
        }
    });
    document.onkeydown = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            ev.preventDefault();
            if($('#msg').val() != '') {
                sendMsg();
            }
        }
    }
});
function notify(title, content,photo) {


    var iconUrl = photo_server+"/upload/photo/s_"+photo;

    if (window.webkitNotifications) {
        //chrome老版本
        if (window.webkitNotifications.checkPermission() == 0) {
            var notif = window.webkitNotifications.createNotification(iconUrl, title, content);
            notif.display = function() {};
            notif.onerror = function() {};
            notif.onclose = function() {};
            notif.onclick = function() {this.cancel();};
            notif.replaceId = 'Meteoric';
            notif.show();
            setTimeout(function(){
                notification.close();
            }, 3000);
        } else {
            window.webkitNotifications.requestPermission($jy.notify);
        }
    }
    else if("Notification" in window){
        // 判断是否有权限
        if (Notification.permission === "granted") {
            var notification = new Notification(title, {
                "icon": iconUrl,
                "body": content
            });
            setTimeout(function(){
                notification.close();
            }, 3000);
        }
        //如果没权限，则请求权限
        else if (Notification.permission !== 'denied') {
            Notification.requestPermission(function(permission) {
                // Whatever the user answers, we make sure we store the
                // information
                if (!('permission' in Notification)) {
                    Notification.permission = permission;
                }
                //如果接受请求
                if (permission === "granted") {
                    var notification = new Notification(title, {
                        "icon": iconUrl,
                        "body": content
                    });
                }
            });
        }
    }
}
//显示工作区
function showWorkPlace() {
    $('.work-place').show();
    $('.work-user.pull-left').hide();
    $('.work-talk.pull-left').hide();
    $('.right-contact-plus-hide.pull-left').hide();
    $('.im.col-xs-4').css('cssText', ' width: 750px !important;');

}
//关闭工作区
function closeWorkPlace() {
    if ($('.work-place').css('display') == 'block') {
        $('.work-place').hide();
        $('.work-user.pull-left').show();
        $('.work-talk.pull-left').show();
        if ($('.right-contact-plus-hide.pull-left').css('display') == 'block') {
            $('.im.col-xs-4').css('cssText', ' width: 750px !important;');
        }
    }

}


var t_flag;
//载入前先判断数据库与接口数据差异,无反应5秒后自动调用原先数据库
function prev_load() {
    t_flag = setTimeout("getAllCompany()", 58000);
    var t = new Date();
    var data = {
        n: t.toLocaleString()
    };
    $.post("/auth/previous-load", data, function (res) {
        if (res == 'redirect') {

            location.href = server_address+"/getauth";
        } else if (res == 'success') {
            remove_prev();

        }
    });
}
//载入超时清除loading
function remove_prev() {
    clearTimeout(t_flag);
    getAllCompany();
}

//合并历史
function mergeHistory() {
    $("input[name='checkboxb']").change(function () {
        var cb = $("input[name='checkboxb']:checked");
        $('#export-chat-history-tab').find('.history-bottom-tag-number span').html(cb.length);
        if ($(this).parent().css('background-color') != 'rgb(250, 235, 215)') {
            $(this).parent().css('background-color', '#FAEBD7');
        } else if ($(this).parent().css('background-color') == 'rgb(250, 235, 215)') {
            $(this).parent().css('background-color', '#fff');
        }
    });
    $('.history-merge-button').off('click');
    $('.history-merge-button').on('click', function () {
        var checkboxb = $("input[name='checkboxb']:checked").serialize();
        if (checkboxb.length == 0) {
            alert('请选择');
            return;
        }
        var group_id = $('div').data('group_id');
        var t = new Date();
        var data = {
            group_id: group_id,
            checkbox: checkboxb,
            time: t.toLocaleString(),
            n: t.getTime()
        };
        $.post("/m/merge-history", data, function (res) {
            $('.export-history-content').html('');
            $('#export-chat-history-tab').find('.history-bottom-tag-number span').html('0');
            loadExportHistory(group_id);
        }).error(function (data) {
            if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                alert('身份过期,点击自动刷新..');
                location.reload();
                return false;
            }
        });
    })
}

//导出历史为txt文件
function exportHistory() {
    $('.export-history-content').find('.fa-eye').off('click');
    $('.export-history-content').find('.fa-eye').on('click', function () {
        var id = $(this).parent().parent().parent().attr('data-id');
        var group_id = $('div').data('group_id');
        var data = {
            id: id,
            group_id: group_id,
            n: new Date().getTime()
        };
        $('.export-history-content').parent().hide();
        $('.check-history-content').show();
        $('.show-export-content').html('查询中，请稍后...');
        $.post("/m/export-history", data, function (msg) {
            $('.show-export-content').html('');

            $.each(msg, function (i, item) {
                if (item.type == 1) {
                    var group_type = msg[0]['group_type'];
                    addRight(item.content, item.time, 0, item.msg_type, item.uname, '', '.show-export-content', item.id, group_type);
                }
                if (item.type == 0) {
                    addLeft(item.content, item.photo, item.time, 0, item.msg_type, item.uname, '', '.show-export-content', item.id);
                }

            });
        }).error(function (data) {
            if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                alert('身份过期,点击自动刷新..');
                location.reload();
                return false;
            }
        });
        $('.return-export-history-content').unbind('click');
        $('.return-export-history-content').on('click',function(){
            $('.export-history-content').parent().show();
            $('.check-history-content').hide();
        });
        $('.show-export-content').slimScroll({
            height: '420px',
            size: '5px',
            start: 'bottom',
            scrollTo: scroll_to
        });

    });
}

function appendExportHistory(str) {
    var str_length = str.length;
    var id = str.substring(0, str.indexOf('|'));
    var num = parseInt(str.indexOf(','));
    var first = '';
    var second = '';
    var id_str = str.substring(str.indexOf('|') + 1, str_length);
    var t = new Date();
    if (num != -1) {
        first = str.substring(str.indexOf('|') + 1, num);
        second = str.substring(num + 1, str_length);
    } else {
        first = str.substring(str.indexOf('|') + 1, str_length);
    }
    var data = {
        str: id_str,
        id: id,
        n: t.getTime()
    };
    $.post("/m/get-export-information ", data, function (res) {
        var flag = res['data2'];
        var string = '';
        var id = res['id'];
        if (flag == undefined) {
            res = res['data1'];
            var time = res.substr(res.lastIndexOf(',') + 1, res.lastIndexOf('|') - 1);
            var content = res.substr(0, res.lastIndexOf(','));
            var type = res.substr(res.lastIndexOf('|') + 1, res.length);
            if (type == 1) {
                content = "[图片文件]";
            } else if (type == 2) {
                content = "[传输文件]";
            } else if (type == 3) {
                content = "[震动消息]";
            }
            string = "<div class=\"talk-sing-user\" style=\"height: 74px;\" data-id='" + id + "'><input type=\"checkbox\" class=\"checkbox pull-left\" name=\"checkboxb\" id='checkboxb'  value=\"" + id + "\" style=\"margin-top: 35px;margin-left: 10px;\"><div class=\"popover fade right in pull-left\" role=\"tooltip\" style=\"display: block;width:185px;margin-left: 20px;\"><div class=\"work-time\" data-id=\"" + first + "\" style=\"width: 185px;\">" + time + "</div><div class=\"popover-content nowarp\" style=\"width:178px;text-align: center;text-overflow: ellipsis;overflow: hidden;word-break: break-all;\"><span style=\"width:178px;text-align: center;\">" + content + "</span></div></div><div class=\"pull-left\" style=\"margin-top: 30px;\">--</div><div class=\"pull-right\" style=\"width:70px;height: 40px;margin-top: 20px;\"><div class=\"pull-left\" style=\"height: 32px;width: 35px;padding-top: 7px;\"><i class=\"fa fa-eye fa-lg\"></i></div><div class=\"pull-left\" style=\"height:32px;width: 35px;padding-top: 10px;\"><i class=\"fa fa-trash fa-lg pull-left\"></i></div></div><div class=\"popover fade right in pull-right\" role=\"tooltip\" style=\"display: block;width:185px;margin-right: 0px\"><div class=\"work-time\" data-id=\"" + first + "\" style=\"width: 185px;margin-right: 0px;\">" + time + "</div><div class=\"popover-content nowarp\" style=\"width:178px;text-align: center;text-overflow: ellipsis;overflow: hidden;word-break: break-all;\"><span style=\"width:178px;text-align: center;\">" + content + "</span></div></div></div>";
            $('.export-history-content').append(string);
        } else if (flag != undefined) {
            var time1 = res['data1'].substr(res['data1'].lastIndexOf(',') + 1, res['data1'].lastIndexOf('|') - 1);
            var time2 = res['data2'].substr(res['data2'].lastIndexOf(',') + 1, res['data2'].lastIndexOf('|') - 1);
            var content1 = res['data1'].substr(0, res['data1'].lastIndexOf(','));
            var content2 = res['data2'].substr(0, res['data2'].lastIndexOf(','));
            var type1 = res['data1'].substr(res['data1'].lastIndexOf('|') + 1, res['data1'].length);
            var type2 = res['data2'].substr(res['data2'].lastIndexOf('|') + 1, res['data2'].length);
            if (type1 == 1) {
                content1 = "[图片文件]";
            } else if (type1 == 2) {
                content1 = "[传输文件]";
            } else if (type1 == 3) {
                content1 = "[震动消息]";
            }
            if (type2 == 1) {
                content2 = "[图片文件]";
            } else if (type2 == 2) {
                content2 = "[传输文件]";
            } else if (type2 == 3) {
                content2 = "[震动消息]";
            }
            string = "<div class=\"talk-sing-user\" style=\"height: 74px;\" data-id='" + id + "'><input type=\"checkbox\" class=\"checkbox pull-left\" name=\"checkboxb\" id='checkboxb' value=\"" + id + "\" style=\"margin-top: 35px;margin-left: 10px;\"><div class=\"popover fade right in pull-left\" role=\"tooltip\" style=\"display: block;width:185px;margin-left: 20px;\"><div class=\"work-time\" data-id=\"" + first + "\" style=\"width: 185px;\">" + time1 + "</div><div class=\"popover-content nowarp\" style=\"width:178px;text-align: center;text-overflow: ellipsis;overflow: hidden;word-break: break-all;\"><span style=\"width:178px;text-align: center;\">" + content1 + "</span></div></div><div class=\"pull-left\" style=\"margin-top: 30px;\">--</div><div class=\"pull-right\" style=\"width:70px;height: 40px;margin-top: 20px;\"><div class=\"pull-left\" style=\"height: 32px;width: 35px;padding-top: 7px;\"><i class=\"fa fa-eye fa-lg\"></i></div><div class=\"pull-left\" style=\"height:32px;width: 35px;padding-top: 10px;\"><i class=\"fa fa-trash fa-lg pull-left\"></i></div></div><div class=\"popover fade right in pull-right\" role=\"tooltip\" style=\"display: block;width:185px;margin-right: 0px\"><div class=\"work-time\" data-id=\"" + second + "\" style=\"width: 185px;margin-right: 0px;\">" + time2 + "</div><div class=\"popover-content nowarp\" style=\"width:178px;text-align: center;text-overflow: ellipsis;overflow: hidden;word-break: break-all;\"><span style=\"width:178px;text-align: center;\">" + content2 + "</span></div></div></div>";
            $('.export-history-content').append(string);
        }
        //合并导出的记录
//                mergeHistory();
//                exportHistory();
        $(".fa.fa-trash.fa-lg.pull-left").unbind('click');
        $(".fa.fa-trash.fa-lg.pull-left").on('click', function () {
            var id = $(this).parent().parent().parent().attr('data-id');
            var data = {
                id: id,
                n: t.getTime()
            };
            $.post("/m/delete-export-history ", data, function (res) {
                if (res == 'success') {
                    $('.export-history-content').html('');
                    var group_id = $('div').data('group_id');
                    loadExportHistory(group_id);
                }
            }).error(function (data) {
                if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                    alert('身份过期,点击自动刷新..');
                    location.reload();
                    return false;
                }
            });
        });

        $('.export-history-content .talk-sing-user .popover .popover-content').hover(
            function () {
                $(this).removeClass('nowarp');
            }, function () {
                $(this).addClass('nowarp');
            });
    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
    //            var string = "<div class=\"talk-sing-user\" style=\"height: 74px;\"><div class=\"popover fade right in pull-left\" role=\"tooltip\" style=\"display: block;width:185px;margin-left: 38px;\"><div class=\"work-time\" data-id=\"79\" style=\"width: 185px;\">2015/11/2 下午3:16:41</div><div class=\"popover-content\"><span>2015/11/2 下午3:17:03</span></div></div><div class=\"pull-left\" style=\"margin-top: 30px;\">--</div><div class=\"pull-right\" style=\"width:70px;height: 40px;margin-top: 20px;\"><div class=\"pull-left\" style=\"height: 32px;width: 35px;padding-top: 7px;\"><i class=\"fa fa-eye fa-lg\"></i></div><div class=\"pull-left\" style=\"height:32px;width: 35px;padding-top: 10px;\"><i class=\"fa fa-trash fa-lg pull-left\"></i></div></div><div class=\"popover fade right in pull-right\" role=\"tooltip\" style=\"display: block;width:185px;margin-right: 0px\"><div class=\"work-time\" data-id=\"79\" style=\"width: 185px;margin-right: 0px;\">2015/11/2 下午3:16:41</div><div class=\"popover-content\"><span>2015/11/2 下午3:17:03</span></div></div></div>"
}

function changeNumberColor($this) {
    if ($this.attr('data-id') == 1) {
        if ($this.parent().css('background-color') != 'rgb(250, 235, 215)') {
            $this.parent().css('background-color', 'antiquewhite');
        } else if ($this.parent().css('background-color') == 'rgb(250, 235, 215)') {
            $this.parent().css('background-color', 'white');
        }
    } else {
        if ($this.parent().parent().css('background-color') != 'rgb(250, 235, 215)') {
            $this.parent().parent().css('background-color', 'antiquewhite');
        } else if ($this.parent().parent().css('background-color') == 'rgb(250, 235, 215)') {
            $this.parent().parent().css('background-color', 'white');
        }
    }
}

function changeHistoryNumber(one, two) {
    $("input[name='checkboxa']").each(function () {
        if ($(this).val() == one || $(this).val() == two) {
            changeNumberColor($(this));
            $(this).attr('checked', 'checked');
        }
    });

    if (two != 0) {
        $("input[name='checkboxa']").not("input:checked").prop('disabled', 'disabled');
    }
    if (one != 0 && two != 0) {
        $("input[name='checkboxa']").not("input:checked").prop('disabled', 'disabled');
    }

    var already_cb = $("input[name='checkboxa']:checked");
    var already_length = parseInt(already_cb.length);
    if (already_length == 0 && one == 0 && two == 0) {
        $('div').data('tag-num-one', 0);
        $('div').data('tag-num-two', 0);
        $("input[name='checkboxa']").change(function () {
//                    alert('a');
            changeNumberColor($(this));
            if ($(this).is(':checked')) {
                $(this).attr('data-isClick', '1');
            }else{
                $(this).removeAttr('data-isClick');
            }
            var cb = $("input[data-isClick='1'][name='checkboxa']:checked");
            console.log(cb.length);
            var length = parseInt(cb.length);
            if (length == 0) {
                $('div').data('tag-num', 0);
                $('#chat-history-tab').find('.tag-num-hidden').html('');
                $('div').data('tag-num-one', 0);
                $('div').data('tag-num-two', 0);
                $('div.history-content').find('.talk-sing-user[data-follow_change=true]')
                .prop({disabled:false,checked:false})
                .css('background-color', '#fff')
                .find('input').prop({checked: false,disabled:false});
            }
            if (length == 1) {
                $('div').data('tag-num', 1);
                $("input[name='checkboxa']").not("input:checked").removeAttr('disabled');
                $('#chat-history-tab').find('.tag-num-hidden').html(cb.val());
                $('div').data('tag-num-one', cb.val());
                $('div.history-content').find('.talk-sing-user[data-follow_change=true]')
                .prop({disabled:false,checked:false})
                .css('background-color', '#fff')
                .find('input').prop({checked: false,disabled:false});
            } else if (length >= 2) {
                $('div').data('tag-num', 2);
                var str = cb.serialize();
                var one = str.substring(10, str.indexOf('&'));
                var two = str.substring(str.lastIndexOf('=') + 1, str.length);
                for (var i = parseInt(one)+1; i < parseInt(two); i++) {
                    $('div.history-content').find('input[value="'+i+'"]')
                    .prop({checked:true,disabled:true})
                    .parents('.talk-sing-user').css('background-color', '#FAEBD7')
                    .attr('data-follow_change', true);
                }
                $('div').data('tag-num-one', one);
                $('div').data('tag-num-two', two);
                $("input[name='checkboxa']").not("input:checked").prop('disabled', 'disabled');
            }

            $('#chat-history-tab').find('.history-bottom-tag-number span').html(cb.length);
        });
    }

    if (already_length == 0 && one != 0 && two == 0) {
        $("input[name='checkboxa']").change(function () {
//                    alert('b');
            changeNumberColor($(this));
            var cb = $("input[name='checkboxa']:checked");
            var length = parseInt(cb.length);
            if (length == 0) {
                $('div').data('tag-num', 0);
                $('#chat-history-tab').find('.tag-num-hidden').html('');
                $('div').data('tag-num-two', 0);
                $("input[name='checkboxa']").not("input:checked").removeAttr('disabled');
                $('#chat-history-tab').find('.history-bottom-tag-number span').html(1);
            }
            if (length == 1) {
                $('div').data('tag-num', 1);
                $("input[name='checkboxa']").not("input:checked").prop('disabled', 'disabled');
                $('div').data('tag-num-two', cb.val());
                $('#chat-history-tab').find('.history-bottom-tag-number span').html(2);
            }
        });
    }

    if (already_length == 1 && one != 0 && two != 0) {
        var flag = '';
        $("input[name='checkboxa']").each(function () {
            if ($(this).val() == one) {
                flag = true;
            }
        });
        if (flag == true) {
            $("input[name='checkboxa']").change(function () {
//                        alert('c');
                changeNumberColor($(this));
                var cb = $("input[name='checkboxa']:checked");
                var length = parseInt(cb.length);
                if (length == 0) {
                    $('div').data('tag-num-one', two);
                    $('div').data('tag-num-two', 0);
                    $("input[name='checkboxa']").not("input:checked").removeAttr('disabled');
                    $('#chat-history-tab').find('.history-bottom-tag-number span').html(1);
                }
                if (length == 1) {
                    $('div').data('tag-num-two', cb.val());
                    $("input[name='checkboxa']").not("input:checked").prop('disabled', 'disabled');
                    $('#chat-history-tab').find('.history-bottom-tag-number span').html(2);
                }
            });
        } else {
            $("input[name='checkboxa']").change(function () {
//                        alert('d');
//                        changeNumberColor($(this));
                var cb = $("input[name='checkboxa']:checked");
                var length = parseInt(cb.length);
                if (length == 0) {
                    $('div').data('tag-num-two', 0);
                    $("input[name='checkboxa']").not("input:checked").removeAttr('disabled');
                    $('#chat-history-tab').find('.history-bottom-tag-number span').html(1);
                }
                if (length == 1) {
                    $('div').data('tag-num-two', cb.val());
                    $("input[name='checkboxa']").not("input:checked").prop('disabled', 'disabled');
                    $('#chat-history-tab').find('.history-bottom-tag-number span').html(2);
                }
            });
        }
    }

    if (already_length == 1 && one != 0 && two == 0) {
        $("input[name='checkboxa']").change(function () {
//                    alert('e');
            changeNumberColor($(this));
            var cb = $("input[name='checkboxa']:checked");
            var length = parseInt(cb.length);
            if (length == 0) {
                $('div').data('tag-num-one', 0);
                $('div').data('tag-num-two', 0);
                $("input[name='checkboxa']").not("input:checked").removeAttr('disabled');
                $('#chat-history-tab').find('.history-bottom-tag-number span').html(0);
            }
            if (length == 1) {
                $('div').data('tag-num-one', cb.val());
                $('div').data('tag-num-two', 0);
                $("input[name='checkboxa']").not("input:checked").removeAttr('disabled');
                $('#chat-history-tab').find('.history-bottom-tag-number span').html(1);
            }
            if (length >= 2) {
                var str = cb.serialize();
                var one = str.substring(10, str.indexOf('&'));
                var two = str.substring(str.lastIndexOf('=') + 1, str.length);
                $('div').data('tag-num-one', one);
                $('div').data('tag-num-two', two);
                $("input[name='checkboxa']").not("input:checked").prop('disabled', 'disabled');
            }
        });
    }

    if (already_length == 1 && one == 0 && two != 0) {
        $("input[name='checkboxa']").change(function () {
//                    alert('f');
            changeNumberColor($(this));
            var cb = $("input[name='checkboxa']:checked");
            var length = parseInt(cb.length);
            if (length == 0) {
                $('div').data('tag-num-one', 0);
                $('div').data('tag-num-two', 0);
                $('#chat-history-tab').find('.history-bottom-tag-number span').html(0);
            }
            if (length == 1) {
                $('div').data('tag-num-one', cb.val());
                $('#chat-history-tab').find('.history-bottom-tag-number span').html(1);
            }
            if (length >= 2) {
                var str = cb.serialize();
                var one = str.substring(10, str.indexOf('&'));
                var two = str.substring(str.lastIndexOf('=') + 1, str.length);
                $('div').data('tag-num-one', one);
                $('div').data('tag-num-two', two);
                $("input[name='checkboxa']").not("input:checked").prop('disabled', 'disabled');
            }
        });
    }

    if (already_length == 2 && one != 0 && two != 0) {
        $("input[name='checkboxa']").change(function () {
//                    alert('g');
            changeNumberColor($(this));
            var cb = $("input[name='checkboxa']:checked");
            var length = parseInt(cb.length);
            if (length == 0) {
                $('div').data('tag-num-one', 0);
                $('div').data('tag-num-two', 0);
                $("input[name='checkboxa']").not("input:checked").removeAttr('disabled');
                $('#chat-history-tab').find('.history-bottom-tag-number span').html(0);
            }
            if (length == 1) {
                $('div').data('tag-num-one', cb.val());
                $('div').data('tag-num-two', 0);
                $("input[name='checkboxa']").not("input:checked").removeAttr('disabled');
                $('#chat-history-tab').find('.history-bottom-tag-number span').html(1);
            }
            if (length >= 2) {
                var str = cb.serialize();
                var one = str.substring(10, str.indexOf('&'));
                var two = str.substring(str.lastIndexOf('=') + 1, str.length);
                $('div').data('tag-num-one', one);
                $('div').data('tag-num-two', two);
                $("input[name='checkboxa']").not("input:checked").prop('disabled', 'disabled');
            }
        });
    }
}
/*
 * 传输被选中的聊天记录
 */
function tagHistory() {
    var group_id = $('div').data('group_id');
    $('#chat-history-tab').find('.history-export-button').unbind('click');
    $("#chat-history-tab").find('.history-export-button').on('click', function () {
        var one = $('div').data('tag-num-one');
        var two = $('div').data('tag-num-two');
        if (one == 0 && two == 0) {
            alert('请选择');
            return;
        }
        var checkboxa = '';
        if (two == 0) {
            checkboxa = 'checkboxa=' + one;
        }
        if (two != 0) {
            checkboxa = 'checkboxa=' + one + '&checkboxa=' + two;
        }
        var group_id = $('div').data('group_id');
        var t = new Date();
        var data = {
            group_id: group_id,
            checkbox: checkboxa,
            time: t.toLocaleString(),
            n: t.getTime()
        };
        $.post("/m/check-box-value ", data, function (res) {
            if (res != 'false') {
                $('#chat-history-tab').find('.history-bottom-tag-number span').html('0');
                $('div').data('tag-num-one', 0);
                $('div').data('tag-num-two', 0);
//                        $('.history-content .talk-sing-user').css('background-color','white');
//                        $("input[name='checkboxa']:checked").attr('checked',false);
//                        $("input[name='checkboxa']").not("input:checked").removeAttr('disabled');
                $('.chat-history.pull-left.active').removeClass('active');
                $('.chat-history.pull-left.active a').attr('aria-expanded', 'false');
                $('.export-chat-history.pull-left').addClass('active');
                $('.export-chat-history.pull-left').attr('aria-expanded', 'true');
                $('.work-history div .tab-content #chat-history-tab').removeClass('active');
                $('.work-history div .tab-content #export-chat-history-tab').addClass('active');

                //                            $('.export-history-content').html('');
                //                            loadExportHistory(group_id);
//                        returnToHistory();
                searchHistory();
            }
        }).error(function (data) {
            if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                alert('身份过期,点击自动刷新..');
                location.reload();
                return false;
            }
        });


    });
    $('#chat-history-tab').find('.history-reset-button').unbind('click');
    $('#chat-history-tab').find('.history-reset-button').on('click', function () {
        if ($('.search-count').html() == '') {
            searchHistory();
        } else {
            $("input[name='checkboxa']:checked").attr('checked', false);
            $('#chat-history-tab').find('.history-bottom-tag-number span').html('0');
            $('.history-content .talk-sing-user').css('background-color', 'white');
            $("input[name='checkboxa']").not("input:checked").removeAttr('disabled');
            $('div').data('tag-num-one', 0);
            $('div').data('tag-num-two', 0);
        }
    });
}
/*
 * 返回聊天记录
 */
function returnToHistory() {
    $('.history-content').html('');
    $('.search-count').html('');
    $('div').data('tag-num-one', 0);
    $('div').data('tag-num-two', 0);
    $('#chat-history-tab').find('.history-bottom-tag-number span').html('0');
    getHistory('.history-content');
    $('.fr.pull-left').hide();
}
/*
 * 搜索聊天记录
 */
function search_submit() {
    var search_word = $('#search_word').val();
    var group_id = $('div').data('group_id');
    $('div').data('tag-num-one', 0);
    $('div').data('tag-num-two', 0);
    $('#chat-history-tab').find('.history-bottom-tag-number span').html('0');
    if (search_word != '' && search_word != ' ') {
        $('.fr.pull-left').show();
        $('.history-content').html('');
        $('#search_word').val('');
        var data = {
            group_id: group_id,
            key_word: search_word,
            n: new Date().getTime()
        };
        $.post("/m/search-submit ", data, function (msg) {
            if (msg == '') {
                $('.search-count').html('搜索不到结果，点击返回。');
            } else {
                msg_len = msg.length;
                var elem = '.history-content';
                $(elem).html('');
                var count = msg.length;
                $('.search-count').html("搜索到" + count + "个结果");
                $.each(msg, function (i, item) {
                    if (item.type == 1) {
                        addRight(item.content, item.time, 0, item.msg_type, item.uname, '', elem, item.id);
                    }
                    if (item.type == 0) {
                        addLeft(item.content, item.photo, item.time, 0, item.msg_type, item.uname, '', elem, item.id);
                    }
                    scroll_to = 10000;
                    $(elem).slimScroll({
                        height: '410px',
                        size: '2px',
                        start: 'bottom',
                        scrollTo: scroll_to
                    });
                });
                changeHistoryNumber(0, 0);
//                        tagHistory()
            }
        }).error(function (data) {
            if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                alert('身份过期,点击自动刷新..');
                location.reload();
                return false;
            }
        });
    }
}


//加载已导出的历史
function loadExportHistory(group_id) {
    var data = {
        group_id: group_id,
        n: new Date().getTime()
    };
    if($('.check-history-content').css('display') == 'block'){
        $('.check-history-content').hide();
        $('.export-history-content').parent().show();
    }
    $.post("/m/load-export-history ", data, function (data) {
        $.each(data, function (i, item) {
            var string = "<div class=\"talk-sing-user\" style=\"height: 74px;\" data-id='" + item['id'] + "'><input type=\"checkbox\" class=\"checkbox pull-left\"  name=\"checkboxb\" id='checkboxb' value=\"" + item['id'] + "\" style=\"margin-top: 35px;margin-left: 10px;\"><div class=\"popover fade right in pull-left\" role=\"tooltip\" style=\"display: block;width:185px;margin-left: 20px;\"><div class=\"work-time\" data-id=\"" + item['start_message_id'] + "\" style=\"width: 185px;\">" + item['start_time'] + "</div><div class=\"popover-content nowarp\" style=\"width:178px;text-align: center;text-overflow: ellipsis;overflow: hidden;word-break: break-all;\"><span style=\"width:178px;text-align: center;\">" + item['start_content'] + "</span></div></div><div class=\"pull-left\" style=\"margin-top: 30px;\">--</div><div class=\"pull-right\" style=\"width:70px;height: 40px;margin-top: 20px;\"><div class=\"pull-left\" style=\"height: 32px;width: 35px;padding-top: 7px;\"><i class=\"fa fa-eye fa-lg\"></i></div><div class=\"pull-left\" style=\"height:32px;width: 35px;padding-top: 10px;\"><i class=\"fa fa-trash fa-lg pull-left\"></i></div></div><div class=\"popover fade right in pull-right\" role=\"tooltip\" style=\"display: block;width:185px;margin-right: 0px\"><div class=\"work-time\" data-id=\"" + item['end_message_id'] + "\" style=\"width: 185px;margin-right: 0px;\">" + item['end_time'] + "</div><div class=\"popover-content nowarp\" style=\"width:178px;text-align: center;text-overflow: ellipsis;overflow: hidden;word-break: break-all;\"><span style=\"width:178px;text-align: center;\">" + item['end_content'] + "</span></div></div></div>";
            $('.export-history-content').append(string);
        });

        $('.export-history-content .talk-sing-user .popover .popover-content').hover(
            function () {
                $(this).removeClass('nowarp');
            }, function () {
                $(this).addClass('nowarp');
            });
        exportHistory();
        $(".fa.fa-trash.fa-lg.pull-left").off('click');
        $(".fa.fa-trash.fa-lg.pull-left").on('click', function () {
            var id = $(this).parent().parent().parent().attr('data-id');
            var data = {
                id: id,
                n: new Date().getTime()
            };
            $.post("/m/delete-export-history ", data, function (res) {
                if (res == 'success') {
                    $('.export-history-content').html('');
                    $('#export-chat-history-tab').find('.history-bottom-tag-number span').html('0');
                    loadExportHistory(group_id);
                }
            }).error(function (data) {
                if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                    alert('身份过期,点击自动刷新..');
                    location.reload();
                    return false;
                }
            });
        });


        $('.export-history-content').slimScroll({
            height: '445px',
            size: '5px',
            start: 'bottom',
            scrollTo: scroll_to
        });

        $('.export-select-button').unbind('click');
        $('.export-select-button').on('click', function () {
            var cb = $("input[name='checkboxb']");
            var cbc = $("input[name='checkboxb']:checked");
            var cbn = $("input[name='checkboxb']").not("input:checked");
//                           alert(221);
//                           cb.each(function(){
            if (cbc.length != data.length) {
                cbn.prop('checked', 'checked');
                cbn.parent().css('background-color', 'antiquewhite');
                $('#export-chat-history-tab').find('.history-bottom-tag-number span').html(data.length);
            }
            else {
                cb.each(function () {
                    $(this).attr("checked", false);
                });
                cb.parent().css('background-color', 'white');
                $('#export-chat-history-tab').find('.history-bottom-tag-number span').html('0');
            }

        });

        $("input[name='checkboxb']").change(function () {
            var cb = $("input[name='checkboxb']:checked");
            $('#export-chat-history-tab').find('.history-bottom-tag-number span').html(cb.length);

            if ($(this).parent().css('background-color') != 'rgb(250, 235, 215)') {
                $(this).parent().css('background-color', 'antiquewhite');
            } else if ($(this).parent().css('background-color') == 'rgb(250, 235, 215)') {
                $(this).parent().css('background-color', 'white');
            }
        });

        $('.export-delete-button').unbind('click');
        $('.export-delete-button').on('click', function () {
            var checkboxb = $("input[name='checkboxb']:checked").serialize();
            if (checkboxb.length == 0) {
                alert('请选择');
                return;
            }
            var t = new Date();
            var data = {
                group_id: group_id,
                checkbox: checkboxb,
                time: t.toLocaleString(),
                n: t.getTime()
            };
            $.post("/m/delete-current-select-history ", data, function (res) {
                if (res == 'success') {
                    $('.export-history-content').html('');
                    $('#export-chat-history-tab').find('.history-bottom-tag-number span').html('0');
                    loadExportHistory(group_id);
                }
            }).error(function (data) {
                if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                    alert('身份过期,点击自动刷新..');
                    location.reload();
                    return false;
                }
            });

        });

        $('.history-merge-button').unbind('click');
        $('.history-merge-button').on('click', function () {
            var checkboxb = $("input[name='checkboxb']:checked").serialize();
            if (checkboxb.length == 0) {
                alert('请选择');
                return;
            }
            var t = new Date();
            var data = {
                group_id: group_id,
                checkbox: checkboxb,
                time: t.toLocaleString(),
                n: t.getTime()
            };
            $.post("/m/merge-history ", data, function (res) {
                $('.export-history-content').html('');
                $('#export-chat-history-tab').find('.history-bottom-tag-number span').html('0');
                loadExportHistory(group_id);
            }).error(function (data) {
                if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                    alert('身份过期,点击自动刷新..');
                    location.reload();
                    return false;
                }
            });
        })

//                 mergeHistory();
//                 exportHistory();
    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });

}
/*
 * 获取聊天记录的页数
 */
function historyPageMove(move, group_id, page) {
    var t = new Date();
    var elem = '.history-content';
    var page_data = {
        group_id: group_id,
        move: move,
        pages: page,
        n: t.getTime()
    };
    $.post("/m/history-page ", page_data, function (msg) {
        if (move == 'count') {
            //获取总页数
            $('.history-page-count').attr('data-id', msg);
        } else {
            msg_len = msg.length;
            $(elem).html('');
            $.each(msg, function (i, item) {
                if (item.type == 1) {
                    addRight(item.content, item.time, 0, item.msg_type, item.uname, '', elem, item.id);
                }
                if (item.type == 0) {
                    addLeft(item.content, item.photo, item.time, 0, item.msg_type, item.uname, '', elem, item.id);
                }

                scroll_to = 10000;
                $(elem).slimScroll({
                    height: '410px',
                    size: '5px',
                    start: 'bottom',
                    scrollTo: scroll_to
                });
            });
            var one = $('div').data('tag-num-one');
            var two = $('div').data('tag-num-two');
            changeHistoryNumber(one, two);
            tagHistory();
        }
    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
}
/*
 * 弹出聊天记录框
 */
function searchHistory() {
    var group_id = $('div').data('group_id');
    var talk_name = $('#talk_name_show').html();
    //             var str = "<div class='work-history pull-left'>" +
    //                         "<div class=\"work-talk-title\"><span id=\"history_name_show\">"+talk_name+"</span><i class=\"work-history-close fa fa-times pull-right\"></i></div>" +
    //                        "</div>";
    if ($('.work-history').css('display') == 'none') {
        //                 $('.work-user.pull-left').after();
        $('.work-history').show();
    }
    $('.history-content').html('');
//                $('.export-history-content').html('');
    $('#history-show-talk-name span').html(talk_name);
    $('.work-talk.pull-left').hide();
    getHistory('.history-content');
    //获取总页数
    historyPageMove('count', group_id, 1);
    $('#history-page-first').unbind('click');
    $('#history-page-first').on('click', function () {
        var first = parseInt($('.history-page-count').attr('data-id'));
        $('.history-page-data').attr('data-id', first);
        historyPageMove('', group_id, first);
        //                     alert(group_id);
    });
    $('#history-page-prev').unbind('click');
    $('#history-page-prev').on('click', function () {
        var page = parseInt($('.history-page-data').attr('data-id'));
        var count = parseInt($('.history-page-count').attr('data-id'));
        var prev = (page >= count) ? count : page + 1;
        $('.history-page-data').attr('data-id', prev);
        historyPageMove('', group_id, prev);
        //                     alert(group_id);
    });
    $('#history-page-next').unbind('click');
    $('#history-page-next').on('click', function () {
        var page = parseInt($('.history-page-data').attr('data-id'));
        var next = (page <= 1) ? 1 : page - 1;
        $('.history-page-data').attr('data-id', next);
        historyPageMove('', group_id, next);
        //                     alert(group_id);
    });
    $('#history-page-last').unbind('click');
    $('#history-page-last').on('click', function () {
        var page = 1;
        $('.history-page-data').attr('data-id', 1);
        historyPageMove('', group_id, page);
        //                     alert(group_id);
    });


    $('div').data('tag-num-one', 0);
    $('div').data('tag-num-two', 0);
//                changeHistoryNumber(-2,0,0);
    tagHistory();
    $('.export-history-content').html('');
    loadExportHistory(group_id);
    $('.work-history-close').on('click', function () {
        $('.history-page-data').attr('data-id', 1);
        $('.history-content').html('');
        $('.search-count').html('');
        $('#chat-history-tab').find('.history-bottom-tag-number span').html('0');
        $('#export-chat-history-tab').find('.history-bottom-tag-number span').html('0');
        $('div').data('tag-num-one', 0);
        $('div').data('tag-num-two', 0);
        $('.export-chat-history.pull-left.active').removeClass('active');
        $('.export-chat-history.pull-left.active a').attr('aria-expanded', 'false');
        $('.chat-history.pull-left').addClass('active');
        $('.chat-history.pull-left').attr('aria-expanded', 'true');
        $('.work-history div .tab-content #export-chat-history-tab').removeClass('active');
        $('.work-history div .tab-content #chat-history-tab').addClass('active');
        $('.work-history.pull-left').hide();
        $('.work-talk.pull-left').show();
    });

}

var ALL_COMPANY_HTML;//定义全局变量，保存公司的列表,删除了群聊的按钮
var ONLY_ALL_COMPANY_HTML;//定义全局变量，保存公司的列表,没删群聊的按钮
/*
 * 加载左侧所有的联系人和增加自定义人员的列表
 */
function getAllCompany() {
    $('.unreachable').remove();
    var t = new Date();
    var data = {
        n: t.getTime()
    };
    $.post("/m/all-company ", data, function (c_res) {
//                $('.messagess').html('');
        $('.messagess').append(c_res);
        $.im.tree('.messagess .talk-company-menu');
        getCurrentDepartmentMember();
        //在增加自定义人员的列表中默然加入公司列表，进行分组
        $('div.all-member-float').append(c_res).find('li.getgroupchat').remove().html();
        var $_div = $('<div>');
        $_div.html(c_res).find('li.getgroupchat').remove();
        ALL_COMPANY_HTML = $_div.html();//定义全局变量，保存公司的列表,删除了群聊的按钮
        ONLY_ALL_COMPANY_HTML = c_res;//定义全局变量，保存公司的列表,没删群聊的按钮
        $('.messagess').slimScroll({
            height: '510px',
            size: '2px'
        });


    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
}


function getCurrentDepartmentMember() {
    $('#messages').find('ul.talk-company-menu').off('click');
    $('#messages').find('ul.talk-company-menu').on('click', function () {
        var $this_span = $(this).children('li').children('a').find('.getgroupname');
        var department_id = $this_span.attr('data-id');
        var flag = $this_span.attr('data-flag');
        if (flag == 1) {
            var data = {
                department_id: department_id,
                n: new Date().getTime()
            };
            var $li_wait_parent = $(this).children('li').children('ul.treeview-menu');
            var li_wait_html = '<li class="text-center icon-wait no-position"><i class="fa fa-spinner "></i></li>';
            $li_wait_parent.prepend(li_wait_html);//添加请求时的转圈动画
            $.post("/m/get-current-department-member ", data, function (res) {
                $li_wait_parent.children('.icon-wait').remove();
                $('#messages').find('.getgroupchat[data-id=' + department_id + ']').after(res);
                $('#messages').find('.getgroupname[data-id=' + department_id + ']').attr('data-flag', 2);
                $('.messagess .talk-company-menu').find('.sing-user').off('click');
                $('.messagess .talk-company-menu').find('.sing-user').on('click', function (event) {
                    event.stopPropagation();
                    var $this = $(this);
                    getGroupId($this);
                });
                $('.messagess .talk-company-menu').find('.getgroupchat').off('click');
                $('.messagess .talk-company-menu').find('.getgroupchat').on('click', function (event) {
                    event.stopPropagation();
                    var $this = $(this);
                    getGroupChatId($this);
                })
            }).error(function (data) {
                if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                    alert('身份过期,点击自动刷新..');
                    location.reload();
                    return false;
                }
            });
        }
    });
}

$('div.all-member-float').on('click', 'ul.talk-company-menu', getCustomDepartmentMember);
/**
 * 点击自定义讨论组增加人员的窗口的列表时触发，显示该部门的人员
 * @return {[type]} [description]
 */
function getCustomDepartmentMember(event){
    event.stopPropagation();//阻止事件冒泡
    var type= $('div.right-contact-plus').find('.add-member').data('type');
    var $this = $(this);
    var $this_li = $this.children('li');
    var showed_li_len = $this_li.children('ul.treeview-menu').children('li.add-number-click').length;
    var _json = {
        group_id : $('div').data('group_id'),
        department_id : $this_li.children('a').find('.getgroupname').data('id')
    };
    var li_wait_html = '<li class="text-center icon-wait no-position"><i class="fa fa-spinner "></i></li>';
    if (!$this_li.hasClass('active')) {
        $this_li.children('a').find('i').attr('class', 'fa  fa-chevron-down');
        if (showed_li_len<=0 && type !='group') {
            $this_li.addClass('active opened').children('ul.treeview-menu').prepend(li_wait_html).show();
        }else{
            $this_li.addClass('active opened').children('ul.treeview-menu').show();
        }
    }else{
        $this_li.children('a').find('i').attr('class', 'fa  fa-chevron-right');
        $this_li.removeClass('active').children('ul.treeview-menu').hide().find('li.no-user').remove();
    }
    if (showed_li_len <=0 && $this_li.hasClass('opened') && type!='group') {
        $.ajax({
            url: '/m/get-contact-department-member',
            type: 'POST',
            dataType: 'json',
            data: _json,
            beforeSend: function(){
                $('div.all-member-float').off('click', 'ul.talk-company-menu', getCustomDepartmentMember);
            }
        })
        .done(function(data) {
            var user_html = '';
            for (var i = 0; i < data.length; i++) {
                user_html += "<li data-id='"+data[i].openid+"' class='add-number-click'><img class='photo' src='"+photo_server+"/upload/photo/s_"+data[i].photo+"'>"+data[i].fullName+"</li>";
            }
            $this_li.children('ul.treeview-menu').prepend(user_html);
            $('.add-number-content').find('.add-number-click').off('click');
            addCustomGroup(_json.group_id);
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
             $this_li.children('ul.treeview-menu').find('li.icon-wait').remove();
             $('div.all-member-float').on('click', 'ul.talk-company-menu', getCustomDepartmentMember);
        });
    }
}

/*
 * 关闭右侧增加联系人
 */
function closeRightContact(isAlways) {
    if (!$(this).hasClass('active') || isAlways) {
        $('div').data('group_id', '');
        $('.im.col-xs-4').css('cssText', ' width: 750px !important;');
        $('.right-contact-plus-hide').hide();
        $('#work-talk-show-content').html('');
        $('#talk_name_show').html('').removeClass('group_talk_name');
        $('#talking,#talk-group').find('.active').removeClass('active');
        $('li.treeview').find('.fa-close').hide();
        $('a.add-member').hide();
        if ($('.work-history').css('display') == 'block' || $('div.add-number-content').css('display')=='block') {
            $('.history-page-data').attr('data-id', 1);
            $('.history-content').html('');
            $('.search-count').html('');
            $('.work-history').hide();
            $('.work-talk').show();
            $('div.add-number-content').hide();
        }
    }
}
/*
 * 改变聊天备注
 */
function changeTalkTitle() {
    if ($(this).html() != '') {
        var t = new Date();
        var group_id = $('div').data('group_id');
        var orgin_name = $(this).html();
        var dt = {
            group_id: group_id,
            n: t.getTime()
        };
        $.post("/m/if-is-group ", dt, function (result) {
            if (result == "1") {
                $("#talk_name_show").hide();
                if (orgin_name.indexOf('(') === 0) {
                    $('.work-talk-title').append("<input type='text' class='insert-work-talk-title form-control'  value='" + orgin_name.substring(1, orgin_name.indexOf(")")) + "'/>");
                } else {
                    $('.work-talk-title').append("<input type='text' class='insert-work-talk-title form-control' value=''/>");
                }
                $('.insert-work-talk-title').focus();
                $('.insert-work-talk-title').blur(function () {
                    var title_name = $('.insert-work-talk-title').val();

                    var data = {
                        name: title_name,
                        group_id: group_id,
                        n: t.getTime()
                    };
                    if (title_name != orgin_name.substring(1, orgin_name.indexOf(")"))) {
                        $.post("/m/get-new-talk-title ", data, function (data) {
                            $('.insert-work-talk-title').remove();
                            $('#talk_name_show').html(data).attr('title', data).show();
                            $('.getgroupchat.active a span').html(data).attr('title', data);
                        }).error(function (data) {
                            if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                                alert('身份过期,点击自动刷新..');
                                location.reload();
                                return false;
                            }
                        });
                    } else if (title_name == orgin_name.substring(1, orgin_name.indexOf(")"))) {
                        $('.insert-work-talk-title').remove();
                        $('#talk_name_show').html(orgin_name).show();
                    }
                });
            }
        }).error(function (data) {
            if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                alert('身份过期,点击自动刷新..');
                location.reload();
                return false;
            }
        });
    }
}
/*
 * 加载群聊时右侧联系人名单
 */
function addRightContacts() {
    $('.im.col-xs-4').css('cssText', ' width: 950px !important;');
    $('.right-contact-plus-hide').css('display', 'block');
    var group_id = $('div').data('group_id');
    var t = new Date();
    var data = {
        group_id: group_id,
        n: t.getTime()
    };
    loadContactNumber();
    //生成右侧当前联系人名单
    $.post("/m/load-right-contact ", data, function (data) {
        var isDelete = '';
        if (data.flag==undefined) {data.flag='group'}
        $('#talk_name_show').attr('data-flag',data.flag);
        var str = "<div role=\"tabpanel\" class=\"tab-pane company-menu \" id=\"right_contract_roll\"><div class='right_roll_control'>";
        if(data['type'] == 'group'){
            getAllDepartmentMember();//在加载群聊时绑定的部门展开加载部门人员的点击事件
            if(data['arr'][data['arr'].length - 1]['event_name'] != ''){
                $.each(data['arr'], function (i, item) {
                    if(i != data['arr'].length -1) {
                        str += "<ul class=\"talk-company-menu-copy-" + item['departmentId'] + "\"><li class=\"treeview\"><a href=\"javascript:;\"><nobr><i class=\"fa fa-chevron-right\" style=\"color: #3a9ae0;\"></i> <span data-id='" + item['departmentId'] + "'title='" + item['departmentName'] + "'>" + item['departmentName'] + "</span></nobr></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"></ul></li></ul>";
                    }
                    if(i == data['arr'].length - 1){
                        str += "<ul class=\"talk-company-menu-copy-" + item['event_name'] + "\"><li class=\"treeview\"><a href=\"javascript:;\"><nobr><i class=\"fa fa-chevron-right\" style=\"color: #3a9ae0;\"></i> <span data-id='" + item['departmentId'] + "'title='" + item['event_name'] + "'>" + item['event_name'] + "</span></nobr></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"></ul></li></ul>"
                    }
                });
                str += "</div></div>";
            }else{
                $.each(data['arr'], function (i, item) {
                    if(i != data['arr'].length -1) {
                        str += "<ul class=\"talk-company-menu-copy-" + item['departmentId'] + "\"><li class=\"treeview\"><a href=\"javascript:;\"><nobr><i class=\"fa fa-chevron-right\" style=\"color: #3a9ae0;\"></i> <span data-id='" + item['departmentId'] + "'title='" + item['departmentName'] + "'>" + item['departmentName'] + "</span></nobr></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"></ul></li></ul>";
                    }
                });
                str += "</div></div>";
            }
        }
        if(data['type'] == 'custom'){
            //在加载讨论组时解绑因群聊加入而绑定的点击事件
            $('.right-contact-content-div').off('click');
            var icon_wait='<div class="icon-wait"><i class="fa fa-spinner"></i></div>';//等待图标
            str += '<ul class="ul-custom">';
            var ul_html = '';
            $.each(data['arr'], function (i, item) {
                if(item['openid'] == user_id){
                    isDelete = '';
                }else if (data.flag =='ok' ){
                    isDelete='<i class="fa fa-close" ></i>';
                }
                if (i==data['arr'].length-1) {
                    ul_html ='</ul>';
                }
                str += "<li class=\"treeview\" ><a href=\"javascript:;\"><nobr><img class='photo' src="+photo_server+"/upload/photo/s_"+item.photo+"> <span data-department_id='"+ item['departmentId'] +"' data-id='" + item['openid'] + "'title='" + item['event_name'] + "'>" + item['event_name'] + "</span></nobr></a>"+isDelete+icon_wait+"</li>"+ul_html;
            });
            str += "</div></div>";
        }

//                    alert($('div').hasClass('right_roll_control'));
        if ($('div').hasClass('right_roll_control')) {
            $('#right_contract_roll').remove();

        }
//                    alert($('div').hasClass('right-contact-plus-box'));
        if ($('div').hasClass('right-contact-plus-box')) {
            $('.right-contact-plus-box').remove();
        }

//                        if($('.right_contract_top').length != 0){
        $('.right-contact-content-div').append(str);
//                            alert($('.right-contact-content-div').length);
//                        }else{
//                            loadContactNumber();
//                            alert($('.right_contract_top').length);
//                            var refresh = "<div><a href='javascript://' class='refresh_right_content_list'>点击刷新</a></div>"
//                             $('.right-contact-content-div').append(refresh);
//                        }

//                    if($('#right_contract_roll').length == 0){
//                        var refresh = "<div><a href='javascript://' class='refresh_right_content_list'>点击刷新</a></div>"
////                        alert(refresh);
////                        alert($('body .right-contacts-link').find('.right_contract_top').length);
//                        $('.right-contact-plus-hide').append(refresh);
//                    }

        $('.right_roll_control').slimScroll({
            height: '480px',
            width: '200px',
            size: '5px'
        });
        //点击“+”增加联系人
        /*$('.right-contact-plus a').off('click');
        $('.right-contact-plus a').on('click', function () {
            //查询出所有的公司和部门
            //getAllDepartmentMember();
            var t = new Date();
            var d = {
                n: t.getTime()
            };
            //生成弹出所有联系人名单
            $.post("/m/get-all-company ", d, function (result) {
                if ($('div').hasClass('right-contact-plus-box')) {
                    $('.right-contact-plus-box').remove();
                }
                //打开增加联系人层
                $('.right-contact-number-div').after(result);
                //关闭增加联系人层
                if ($('div').hasClass('right-contact-plus-box-close')) {
                    $('.right-contact-plus-box-close a').off('click');
                    $('.right-contact-plus-box-close a').on('click', function () {
                        $('.right-contact-plus-box').remove()
                    });
                }
                //下拉菜单
                if ($('div').hasClass('right-contact-plus-box')) {
                    $.im.tree('.talk-company-menu-copyx');
                    $('#messagesss').slimScroll({
                        height: '372px',
                        size: '5px'
                    });

                }
                $('#messagesss').find('.getgroupchat').off('click');
                $('#messagesss').find('.getgroupchat').on('click', function () {
                    var did = $(this).attr('data-id');
                    getAddGroupChatId(group_id, did);
                });
            }).error(function (data) {
                if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                    alert('身份过期,点击自动刷新..');
                    location.reload();
                    return false;
                }
            });

        });*/
        for (var i = 0; i < data['arr'].length; i++) {
            $.im.tree('.talk-company-menu-copy-' + data['arr'][i]['departmentId']);
        }

    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
}


function loadContactNumber() {
    var group_id = $('div').data('group_id');
    var t = new Date();
    var data = {
        group_id: group_id,
        n: t.getTime()
    };
    //生成右侧联系人数目
    $.post("/m/load-contact-number ", data, function (data) {
        if(data['type'] == 'custom'){
            $('.right-contact-number-div').html("<div class='right_contract_top'><div class='right-contacts-numbers'>讨论组成员(<span>" + data['num'] + "</span>)</div><div class='right-contact-plus'><span class=\"add-member pull-right\" data-type='custom' style=\"margin-right: 20px;\"><i class=\"fa fa-cog\"></i></span></div></div>")
            AddNumber();
        }
        if(data['type'] == 'group'){
            //if ($('div').hasClass('right-contacts-numbers')) {
            //    $('.right-contacts-numbers').html("讨论组成员" + data['online_num'] + "/" + data['dept_num']);
            //
            //} else {
            $('.right-contact-number-div').html("<div class='right_contract_top'><div class='right-contacts-numbers'>讨论组成员(<span>" + data['online_num'] + "/" + data['dept_num'] + "</span>)</div><div class='right-contact-plus'><span class=\"add-member pull-right\" data-type='group' style=\"margin-right: 20px;\"><i class=\"fa fa-cog\"></i></span></div></div>")
            AddNumber();
            //}
        }
    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });

}

/*
 * 点击加载所有该部门的员工
 */
function getAllDepartmentMember() {
    $('.right-contact-content-div').off('click');
    $('.right-contact-content-div').on('click', '.company-menu  ul', function () {
        var dept_id = $(this).find('span').attr('data-id');
        var t = new Date();
        var dept_data = {
            dept_id: dept_id,
            n: t.getTime()
        };
        $.post("/m/get-all-department-member ", dept_data, function (dept_result) {
            if ($('.right-contact-content-div .tab-pane.company-menu   .talk-company-menu-copy-' + dept_id + ' .treeview ul li').length == 0)
                $.each(dept_result, function (i, item) {
                    $('.right-contact-content-div .tab-pane.company-menu   .talk-company-menu-copy-' + dept_id + ' .treeview ul').append("<li><span class=\"getuserid\"><a href=\"javascript:;\" class=\"sing-user\" data-id=\"" + item['openid'] + "\"><img src=\" "+photo_server+"/upload/photo/s_" + item['photo'] + "\" class=\"img-circle\"><span class=\"get_talk_name\">" + item['fullName'] + "</span></a></span></li>");

                });
            $('.right-contact-content-div .tab-pane.company-menu  .talk-company-menu-copy-' + dept_id + ' .treeview ul li a').unbind('click');
            $('.right-contact-content-div .tab-pane.company-menu  .talk-company-menu-copy-' + dept_id + ' .treeview ul li a').on('click', function (event) {
                event.stopPropagation();
//                      var user_id = $(this).attr('data-id');
                getGroupId($(this));
                $('.im').css('cssText', ' width: 750px !important;');
                $('.right-contact-number-div').html('');
                $('.right-contact-content-div').html('');
                $('.right-contact-plus-hide').hide();
            });
        }).error(function (data) {
            if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                alert('身份过期,点击自动刷新..');
                location.reload();
                return false;
            }
        });
    });
}

/*
 * 添加右侧联系人HTML片段
 */
function addLinkHtml() {
//            if(!$('div').hasClass('right-contacts-link')){
    //新增
    addRightContacts();
//            }else{
//                $('.right-contacts-link').remove();
//                addRightContacts();
//            }
}

function savepic() {
    if (document.all.a1 == null) {
        objIframe = document.createElement("IFRAME");
        document.body.insertBefore(objIframe);
        objIframe.outerHTML = "<iframe     name=a1     style='width:0;hieght:0'     src=" + dl.href + "></iframe>";
        re = setTimeout("savepic()", 1)
    }
    else {
        clearTimeout(re);
        pic = window.open(dl.href, "a1");
        pic.document.execCommand("SaveAs");
        document.all.a1.removeNode(true)
    }
}

/*
 *  上传文件
 */
function pluploadFile() {
    //var uploader = null;
    var uploader = new plupload.Uploader({
        browse_button: 'lofile',
        url: "/m/upload-file ",
        flash_swf_url: '/js/plupload/Moxie.swf',
        silverlight_xap_url: '/js/plupload/Moxie.xap',
        multipart_params: {
            '_token': '{{csrf_token()}}'
            //'group_id': gid
        },
        max_retries: 10,
        multi_selection: false
    });
    uploader.init();//初始化
    uploader.bind('FilesAdded', function (uploader, files) {
        filename = files[0].name;
//              $('#btnUpload').css('display','block');
//              $('#msg').val(filename + '(' + plupload.formatSize(files[0].size) + ')');
        var t = new Date();
        var time = t.toLocaleString();
        addRight(filename, time, 1, 2);

        $('#work-talk-show-content .talk-sing-user:last .pull-right .popover .popover-content a').attr('href', '###');
        uploader.start();
    });
    //$('#btnSend').on('click',function(){});
    var num = 0;
    uploader.bind('UploadProgress', function (up, file) {
//                console.log(file.percent);
        if (num == 0) {
            $('#work-talk-show-content .talk-sing-user:last .pull-right .popover.fade.left.in.pull-right.file').prepend("<div class='close'></div>");
        }
        if (file.percent != 0 && $.im.options.appent_file == true) {
            popover_content_widht = $('#work-talk-show-content .talk-sing-user:last .pull-right .popover .popover-content').width();
            $('#work-talk-show-content .talk-sing-user:last .pull-right .popover .popover-progress').width(file.percent * (popover_content_widht + 20) / 100);
//                    console.log(file.percent*(popover_content_widht+20)/100);
//                    percentShow(file)
        }
        $('#work-talk-show-content .talk-sing-user:last .pull-right .popover .popover-progress').unbind('click');
        $('#work-talk-show-content .talk-sing-user:last .pull-right .popover .popover-progress').on('click', function () {
            up.stop();
        });
        num++;
    });
    uploader.bind('UploadComplete', function (up, file) {
        $('#msg').val('');
    });
    uploader.bind('FileUploaded', function (uploader, file, responseObject) {
        num = 0;
        var pic = responseObject.response;
        $('#work-talk-show-content .talk-sing-user:last .pull-right .popover .popover-progress').remove();
        var href = pic.substr(0, pic.indexOf('|'));
        $('#work-talk-show-content .talk-sing-user:last .pull-right .popover .popover-content a').attr('href', href);
        $('#work-talk-show-content .talk-sing-user:last .pull-right .popover .popover-content').css('background', '#01ff70');
        $('#work-talk-show-content .talk-sing-user:last .pull-right .popover').removeClass('close');
        $('#work-talk-show-content .talk-sing-user:last .pull-right .popover').addClass('file');
        sendMsg($(this), 2, pic);
        $('#work-talk-show-content .talk-sing-user:last .pull-right .popover .popover-content a').attr('href', '###');
    });
    uploader.bind('Error', function (up, errObj) {
        alert(errObj.message);
    });

    uploader.destroy();
    uploader.unbindAll();
}
/*
 *封装删除群聊
 */
function deleteGroupChat($this, type) {
    if (type == 'single') {
        var group_id = $this.attr("data-id");
        var unread = $this.find('.warn-im-message.label-danger');
        if ($('.nav.nav-tabs.talk .talking .warn-im-message').html() != 0) {
            var num = $('.nav.nav-tabs.talk .talking .warn-im-message').html() - unread.html();
            if (num == 0) {
                $('.nav.nav-tabs.talk .talking .warn-im-message').html(0);
                $('.nav.nav-tabs.talk .talking .warn-im-message').hide();
            } else {
                $('.nav.nav-tabs.talk .talking .warn-im-message').html(num);
            }
        }

    } else {
        var group_id = $this.attr("data-id");
        var unread = $this.find('.warn-im-message.label-danger');
        if ($('.nav.nav-tabs.talk .talk-group .warn-im-message').html() != 0) {
            var num = $('.nav.nav-tabs.talk .talk-group .warn-im-message').html() - unread.html();
            if (num == 0) {
                $('.nav.nav-tabs.talk .talk-group .warn-im-message').html(0);
                $('.nav.nav-tabs.talk .talk-group .warn-im-message').hide();
            } else {
                $('.nav.nav-tabs.talk .talk-group .warn-im-message').html(num);
            }
        }

    }
    unread.html(0);
    unread.hide();
    $this.remove();
    $('#talk_name_show').html("");
    $('#work-talk-show-content').html('');
    $('div').data('group_id', '');
    $('.im.col-xs-4').css('cssText', ' width: 750px !important;');
    $('.right-contact-plus-hide').hide();
    var del_data = {
        group_id: group_id,
        type : type,
        n: new Date().getTime()
    };
    $.post('/m/delete-group-chat', del_data, function () {

    });
}
/*
 * 封装减少未读数目
 */
function reduceGroupUnread($this, type) {
    if (type == 'single') {
        var group_id = $this.attr("data-id");
        var unread = $this.find('.warn-im-message.label-danger');
        if ($('.nav.nav-tabs.talk .talking .warn-im-message').html() != 0) {
            var num = $('.nav.nav-tabs.talk .talking .warn-im-message').html() - unread.html();
            if (num == 0) {
                $('.nav.nav-tabs.talk .talking .warn-im-message').html(0);
                $('.nav.nav-tabs.talk .talking .warn-im-message').hide();
            } else {
                $('.nav.nav-tabs.talk .talking .warn-im-message').html(num);
            }

        }
    } else {
        var group_id = $this.attr("data-id");
        var unread = $this.find('.warn-im-message.label-danger');
        if ($('.nav.nav-tabs.talk .talk-group .warn-im-message').html() != 0) {
            var num = $('.nav.nav-tabs.talk .talk-group .warn-im-message').html() - unread.html();
            if (num == 0) {
                $('.nav.nav-tabs.talk .talk-group .warn-im-message').html(0);
                $('.nav.nav-tabs.talk .talk-group .warn-im-message').hide();
            } else {
                $('.nav.nav-tabs.talk .talk-group .warn-im-message').html(num);
            }

        }
    }
    unread.html(0);
    unread.hide();
    var read_data = {
        group_id: group_id,
        type : type,
        n: new Date().getTime()
    };
    $.post('/m/reduce-group-unread', read_data, function () {

    });
}
/*
 * 封装全部设为已读
 */
function reduceAllGroupUnread(type) {
    if (type == 'single') {
        $('#talk-user-form').find('.warn-im-message').html(0);
        $('#talk-user-form').find('.warn-im-message').hide();
        $('#talking_single_unread').html(0);
        $('#talking_single_unread').hide();
    } else {
        $('.talk-group-menu').find('.warn-im-message').html(0);
        $('.talk-group-menu').find('.warn-im-message').hide();
        $('#talking_group_unread').html(0);
        $('#talking_group_unread').hide();

    }
    var data = {
        type: type,
        n: new Date().getTime()
    }
    $.post('/m/reduce-all-group-unread', data, function () {

    });
}
/*
 *载入当前用户的会话历史
 */
function loadHistory() {
    var t = new Date();
    var data = {
        n: t.getTime()
    };
    $.post("/m/load-history", data, function (data) {
//                console.log(data);
        var singer_count=0;
        $.each(data, function (i, item) {
            if (item['type'] == 'single') {
                if(singer_count < 20 ){
                    singer_count++;
                    $.im.addCurrChat(item['object'], item['photo'], item['group_id']);
                    if (item['unread'] != 0) {
                        $('#talk-user-form div[data-id=' + parseInt(item['group_id']) + ']').find('.warn-im-message').html(item['unread']);
                        $('#talk-user-form div[data-id=' + parseInt(item['group_id']) + ']').find('.warn-im-message').show();
                    }
                }
            } else if (item['type'] == 'custom'){
                //$.im.addCurrChat(item['object'], item['photo'], item['group_id']);
                //if (item['unread'] != 0) {
                //    $('#talk-user-form div[data-id=' + parseInt(item['group_id']) + ']').find('.warn-im-message.label-danger').html(item['unread']);
                //    $('#talk-user-form div[data-id=' + parseInt(item['group_id']) + ']').find('.warn-im-message.label-danger').show();
                //}
                $.im.garupChat(item['object'], item['group_id'], 2,item['type']);
                if (item['unread'] != 0) {
                    $('.talk-group-menu li[data-id=' + item['group_id'] + ']').find('.warn-im-message').html(item['unread']);
                    $('.talk-group-menu li[data-id=' + item['group_id'] + ']').find('.warn-im-message').show();
                }
            }
            else if (item['type'] == 'group') {
                $.im.garupChat(item['object'], item['group_id'], 2,item['type']);
                if (item['unread'] != 0) {
                    $('.talk-group-menu li[data-id=' + item['group_id'] + ']').find('.warn-im-message').html(item['unread']);
                    $('.talk-group-menu li[data-id=' + item['group_id'] + ']').find('.warn-im-message').show();
                }
            }
        });
        loadUnreadMessage();
        /*$('.getgroupchat').mousedown(function(e){
         if(3 == e.which){
         var group_id = $(this).attr('data-id');

         }
         })*/
        var jsdata = [
            [{
                text: "移除当前会话",
                func: function () {
                    var $this = $(this);
                    deleteGroupChat($this, 'group');
                }
            }],
            [{
                text: "设为已读",
                func: function () {
                    var $this = $(this);
                    reduceGroupUnread($this, 'group');
                }
            }]/*,
            [{
                text: "设为全部已读",
                func: function () {
                    reduceAllGroupUnread('group');
                }
            }]*/
        ];

        //$(".getgroupchat").smartMenu(jsdata, {name:'group'});
        var singlejsdata = [
            [{
                text: "移除当前会话",
                func: function () {
                    var $this = $(this);
                    deleteGroupChat($this, 'single');
                }
            }],
            [{
                text: "设为已读",
                func: function () {
                    var $this = $(this);
                    reduceGroupUnread($this, 'single');
                }
            }],
            [{
                text: "设为全部已读2",
                func: function () {
                    reduceAllGroupUnread('single');
                }
            }]
        ];
        //$(".talk-sing-user.user_history").smartMenu(singlejsdata, {name:'single'});
    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
}

/*
 * 加载未读消息
 */
function loadUnreadMessage() {
    var t = new Date();
    var data = {
        n: t.getTime()
    };
    $.post("/m/load-unread-message ", data, function (data) {
        if (data['single_data'] != 0) {
            $('#talking_single_unread').html(data['single_data']);
            $('#talking_single_unread').css('display', 'block');
        }
        if (data['group_data'] != 0 || data['custom_data'] != 0) {
            $('#talking_group_unread').html(data['group_data']+data['custom_data']);
            $('#talking_group_unread').css('display', 'block');

        }
    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
}

/*
 * 删减未读消息的数目
 */
function reduceUnreadNumber(group_id, type) {
    if (type == 'single') {
        var unread = $('#talk-user-form div[data-id=' + parseInt(group_id) + '] .warn-im-message').html();
        //alert(unread);
        if ($('#talk-user-form div[data-id=' + parseInt(group_id) + '] .warn-im-message').length != 0) {
            //               var num = $('#talk-user-form div[data-id='+parseInt(data_id)+'] .warn-im-message').html();
            //var unread = $('#talk-user-form div[data-id=' + parseInt(group_id) + '] .warn-im-message').length;
            if ($('.nav.nav-tabs.talk .talking .warn-im-message').html() != 0) {
                //alert($('.nav.nav-tabs.talk .talking .warn-im-message').html());
                var num = $('.nav.nav-tabs.talk .talking .warn-im-message').html() - unread;
                if (num == 0) {
                    $('.nav.nav-tabs.talk .talking .warn-im-message').html(0);
                    $('.nav.nav-tabs.talk .talking .warn-im-message').hide();
                } else if (num >= 0) {
                    $('.nav.nav-tabs.talk .talking .warn-im-message').html(num);
                } else if (num < 0) {
                    $('.nav.nav-tabs.talk .talking .warn-im-message').hide();
                }
            }
            $('#talk-user-form div[data-id=' + parseInt(group_id) + '] .warn-im-message').html(0);
            $('#talk-user-form div[data-id=' + parseInt(group_id) + '] .warn-im-message').hide();
            var t = new Date();
            var data = {
                group_id: group_id,
                n: t.getTime()
            };
            $.post("/m/reduce-unread-number ", data, function (res) {

            }).error(function (data) {
                if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                    alert('身份过期,点击自动刷新..');
                    location.reload();
                    return false;
                }
            });
        }
    } else if (type == 'group') {
        if ($('.talk-group-menu li[data-id=' + group_id + ']').find('.warn-im-message').html() != 0) {
            var unread = $('.talk-group-menu li[data-id=' + group_id + ']').find('.warn-im-message').html();
            if ($('.nav.nav-tabs.talk .talk-group .warn-im-message').html() != 0) {
                var num = $('.nav.nav-tabs.talk .talk-group .warn-im-message').html() - unread;
                if (num == 0) {
                    $('.nav.nav-tabs.talk .talk-group .warn-im-message').html(0);
                    $('.nav.nav-tabs.talk .talk-group .warn-im-message').hide();
                } else if (num > 0) {
                    $('.nav.nav-tabs.talk .talk-group .warn-im-message').html(num);
                } else if (num < 0) {
                    $('.nav.nav-tabs.talk .talking .warn-im-message').hide();
                }
            }
            var t = new Date();
            var data = {
                group_id: group_id,
                n: t.getTime()
            };
            $.post("/m/reduce-unread-number ", data, function (res) {

            }).error(function (data) {
                if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                    alert('身份过期,点击自动刷新..');
                    location.reload();
                    return false;
                }
            });
        }
    }
}

function SetSessionForUpload(id) {
    var data = {
        group_id: id,
        n: new Date().getTime()
    }
    $.post('/m/set-session-for-upload', data, function () {
    });
}

//增加自定义成员
function AddNumber(){
    $('.add-member').off('click');
    //$('.all-member-float').html('');
    $('.add-member').on('click',function(){
        var type = $(this).data('type');
        $('.origin-member').html('');
        if ($(this).parent().hasClass('right-contact-plus')) {
            if (type=='custom') $('div.add-number-close').find('.btn').show();//讨论组编辑时才显示退出按钮
            $('li.treeview').find('.fa-close').css('display', 'inline-block');
        }else{
            $('div.add-number-close').find('.btn').hide();
        }
        //读取当前连天组的成员
        var group_id = $('div').data('group_id');

        var data = {
            group_id : group_id,
            n: new Date().getTime()
        };
/*        $.post('/m/get-origin-member',data,function(res){
            $.each(res,function(i,item){
                $('.origin-member').append(item['fullName']+"&nbsp;&nbsp;");
            });
            $('.origin-member').append("<a class='add-member-button'><i class='fa fa-plus'></i></a>");
            //$('.all-member-float').html('');
            getAllMember(group_id);

        });*/
        //$('.origin-member').append("<a class='add-member-button'><i class='fa fa-plus'></i></a>");
        if ($('div.add-number-content').css('display') == 'none' || $(this).parent().hasClass('work-talk-title') ) {
            $('.work-talk').hide();
            $('.add-number-content').show();
            getAllMember(group_id,type);
        }else{
            $('.work-talk').show();
            $('.add-number-content').hide();
            $('li.treeview').find('.fa-close').hide();
        }

    });

    $('.add-number-close .fa-times').on('click',function(){
        $('.work-talk').show();
        $('.add-number-content').hide();
        $('li.treeview').find('.fa-close').hide();
    });
}

//确定模态框显示时的操作,即显示对应的操作信息
$('#modal_delete').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var recipient = button.data('whatever');
  var modal = $(this);
  modal.find('.modal-body p').text('确定'+recipient+'讨论组吗?');
});

/**
 * [读取所有联系人]
 * @param  {[type]} group_id [讨论组id]
 * @param  {[type]} type     [讨论组类型 custom为自定义 group 为群聊]
 * @return {[type]}          [description]
 */
function getAllMember(group_id,type){
    var data = {
        group_id : group_id,
        n: new Date().getTime()
    };
    //$('.add-number-content').find('.add-member-button').on('click',function(){
    if (type=='custom') {
        $('div.all-member-float').html(ALL_COMPANY_HTML).show();
         //退出自定义聊天组
        $('#modal_enter').off('click');//总是解绑
        $('#modal_enter').on('click',function(){
            var $enter_btn = $(this);
            $enter_btn.attr('disabled', true);
            var data = {group_id: group_id};
            $('#modal_delete').find('.modal-body p').hide().next('.icon-wait').show();
            $.ajax({
                url: '/m/quit-custom-group',
                type: 'POST',
                dataType: 'json',
                data: data,
            })
            .done(function(res) {
                closeRightContact(true);
                $('ul.talk-group-menu').find('li[data-id='+res+']').remove();
                $('#modal_delete').modal('hide');
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                $enter_btn.attr('disabled', false);
                $('#modal_delete').find('.modal-body p').show().next('.icon-wait').hide();
                $('#modal_delete').modal('hide');
            });

        });
    }else if (type=='group') {
        $('div.all-member-float').html(ONLY_ALL_COMPANY_HTML).show();
        $('div.all-member-float').find('.getgroupchat').off('click');
        $('div.all-member-float').find('.getgroupchat').on('click', function (event) {
            event.stopPropagation();
            var did = $(this).attr('data-id');
            getAddGroupChatId(data.group_id, did);
        });
    }
        //$('.all-member-float').html('');
        /*$.post('/m/get-all-member',data,function(res){

            $.each(res,function(i,item){
                $('div.all-member-float').append("<li data-id='"+item['openid']+"' class='add-number-click'>"+item['fullName']+"</li>");

            });
            addCustomGroup(group_id);
        });*/
    //});
}
//增加自定义成员
function addCustomGroup(group_id){
    //点击增加联系人
    $('.add-number-content').find('.add-number-click').on('click.b',add_number_click_b);
    $('.add-number-content').find('.add-number-click').on('click',add_number_click);
    function add_number_click(evevt){
        event.stopPropagation();
    }
   function  add_number_click_b(evevt){
        var $this_li=$(this),
        user_id = $this_li.attr('data-id');
        $('.add-number-content').find('.add-number-click').off('click.b');
        $this_li.css('position', 'relative').append('<div class="icon-wait"><i class="fa fa-spinner"></i></div>');
        var data = {
            user_id : user_id,
            group_id : group_id,
            n : new Date().getTime()
        };
        $.post('/m/add-custom-group',data,function(res){
            $('.add-number-content').find('.add-number-click').on('click.b',add_number_click_b);
            if(res == 'already'){
                alert('已存在');
            }else{
                //if($('#talk-user-form .talk-sing-user.active[data-id='+res['group_id']+']')){
                if($('.right-contact-plus-hide').css('display') == 'none'){
                    //$('#talk-user-form .talk-sing-user.active[data-id='+res['group_id']+']').remove();
                    //$('.nav.nav-tabs.talk .takl-user.active').removeClass('active');
                    //$('.nav.nav-tabs.talk .talk-group').addClass('active');
                    $('div').data('group_id', res['group_id']);   //存储聊天组id
                    $('#talk_name_show').html(res.name).attr('title', res.name).addClass('group_talk_name');
                    addLinkHtml();
                    //pluploadFile(id);
                    //getUnread(id);
                    //addHistory();
                    $('#work-talk-show-content').html('');
                    getHistory();
                    $('#msg').focus();
                    $.im.garupChat(res.name, res['group_id'],undefined,'custom');
                    //$('.add-number-content').hide();
                    //$('.work-talk').show();
                    $('.add-number-content,a.add-member').hide();
                    $('.work-talk').show();

                }else{
                    //$('.add-number-content').hide();
                    //$('.work-talk').show();
                    $this_li.remove();
                    var user_num = $('div.right_roll_control').find('li.treeview').length+1;
                    //console.log(user_num);
                    if(res['flag'] == 1){
                        $('#talk_name_show').html(res.name).attr('title', res.name);
                        $('#talk-group').find('li.active a span').text(res.name).attr('title', res.name);
                    }
                    $('div.right-contacts-numbers').find('span').text(user_num);
                    var isDelete = '';
                    if ($('div.all-member-float').css('display') == 'block' && $('#talk_name_show').data('flag')=='ok') {
                        isDelete = '<i class="fa fa-close" style="display: inline-block;"></i>';
                    }
                    $('.right_roll_control').find('ul.ul-custom').append('<li class="treeview"><a href="javascipt:;"><nobr><img class="photo" src='+photo_server+'/upload/photo/s_'+res.photo+'> <span data-department_id="'+res.departmentId+'" data-id="'+res['openid']+'" title="'+res['username']+'">'+res['username']+'</span></nobr></a>'+isDelete+'<div class="icon-wait"><i class="fa fa-spinner"></i></div></li>');
                }
            }
        });
    }
}

function getGroupId($this) {
    $('.add-member').show();
    //pluploadFile()
    if ($('.work-history').css('display') == 'block' || $('.add-number-content').css('display') == 'block') {
        $('.history-page-data').attr('data-id', 1);
        $('.history-content').html('');
        $('.search-count').html('');
        $('.work-history').hide();
        $('.work-talk').show();
    }
    data_id = $this.parent().attr('data-id');
    talk_name = $this.find('.get_talk_name').html();
    if (data_id) {
        //alert(11);
        $('div').data('group_id', data_id);   //存储聊天组id
        SetSessionForUpload(data_id);
        var group_id = $('div').data('group_id');
        reduceUnreadNumber(group_id, 'single');

        getHistory();
        //getUnread(data_id);
//                 $.im.subTalkingWarnCount($(this).parent().find('.warn-im-message').html());

        //$(this).parent().find('.warn-im-message').html(0);
        //$(this).parent().find('.warn-im-message').hide();
        $.im.currChat($this, data_id);
        $('#talk_name_show').html(talk_name).attr('title',talk_name).removeClass('group_talk_name');
        //pluploadFile(group_id);

    } else {
        $('#work-talk-show-content').html('');
        send_to_id = $this.attr('data-id');//全局变量存储接收者id
        var data = {
            send_to_id: send_to_id,
            n: new Date().getTime()
        };
        $.post(" /m/getgroup ", data, function (id) {

            if(id == -9999){
                alert('不能选取自己，请重新选择！');
                return false;
            }
            $('div').data('group_id', id);   //存储聊天组id
            $('#talk_name_show').html(talk_name).attr('title',talk_name).removeClass('group_talk_name');
            $('#talk-user-form div[data-id=' + parseInt(data_id) + '] .warn-im-message').remove();
            //pluploadFile(id);
            SetSessionForUpload(id);
            getHistory('#work-talk-show-content');
            //getUnread(id);
            $('#msg').focus();
            $.im.currChat($this, id);
//                    $('#talk-user-form').unbind('click');
           /* $('#talk-user-form').on('click', '.talk-sing-user a', function () {
                var $this = $(this);
                getGroupId($this);
            });*/
        }, 'json').error(function (data) {
            if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                alert('身份过期,点击自动刷新..');
                location.reload();
                return false;
            }
        });
    }
    AddNumber();
}
/*
 * 增加群聊,得到新的group_id
 */
function getAddGroupChatId(old_group_id, new_group) {
    var data = {
        old: old_group_id,
        new: new_group,
        n: new Date().getTime()
    };
    $.post("/m/add-group-chat ", data, function (data) {
        if (data == 'already') {
            alert('已存在该公司');
        } else if (data == 'fail') {
            alert('新增失败');
        } else {
            //$('.right-contact-plus-box').remove();
            $('div.work-user').find('li.active a span').html(data['name']).attr('title', data['name']);
            $('.work-talk-title span').html(data['name']).attr('title', data['name']);
            //$('.right-contact-content-div .tab-pane.company-menu .slimScrollDiv .right_roll_control').append("<ul class=\"talk-company-menu-copy-" + data['id'] + "\"><li class=\"treeview\" style=\"overflow: hidden;text-overflow: ellipsis;\"><a href=\"javascript:;\"><nobr><i class=\"fa fa-home\" style=\"color: #3a9ae0;\"></i> <span data-id='" + data['id'] + "' title='"+data['new_add_name']+"'>" + data['new_add_name'] + "</span></nobr></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"></ul></li></ul>");
            $('div.right-contact-content-div').find('div.right_roll_control').append("<ul class=\"talk-company-menu-copy-" + data['id'] + "\"><li class=\"treeview\" style=\"overflow: hidden;text-overflow: ellipsis;\"><a href=\"javascript:;\"><nobr><i class=\"fa fa-chevron-right\" style=\"color: #3a9ae0;\"></i> <span data-id='" + data['id'] + "' title='"+data['new_add_name']+"'>" + data['new_add_name'] + "</span></nobr></a><ul class=\"treeview-menu menu-open\" style=\"display: none;\"></ul></li></ul>");
            $.im.tree('.talk-company-menu-copy-' + data['id']);
            loadContactNumber();
        }

    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
}
/* 得到群 */
function getGroupChatId($this) {
    $('.add-member').hide();
    //pluploadFile()
    if ($('.work-history').css('display') == 'block' || $('.add-number-content').css('display') == 'block') {
        $('.history-page-data').attr('data-id', 1);
        $('.history-content').html('');
        $('.search-count').html('');
        $('.work-history').hide();
        $('.add-number-content').hide();
        $('.work-talk').show();
    }
    $('#work-talk-show-content').html('');
    send_to_id = '';
    type = $this.attr('type');
    depts_id = $this.attr('data-id');
    if (type == 'group' || type=='custom') {
        $('div').data('group_id', depts_id);
        reduceUnreadNumber(depts_id, 'group');
        group_name = $this.find('a').find('#company_name_show_top').html();
        $('#talk_name_show').html(group_name).attr('title',group_name).addClass('group_talk_name');
        addRightContacts();
        //pluploadFile(depts_id);
        SetSessionForUpload(depts_id);
        getHistory('#work-talk-show-content');
        //getUnread(depts_id);
        $.im.garupChat('', depts_id,undefined, type);
        $.im.subTalkGroupWarnCount($this.find('.warn-im-message').html());
    } else {
        group_name = $this.parent().parent().find('.getgroupname').html();
        var data = {
            depts_id: depts_id,
            n: new Date().getTime()
        };
        $.post("/m/get-group-chat-id ", data, function (id) {
            $('div').data('group_id', id);   //存储群聊id
            $('#talk_name_show').html(group_name).attr('title',group_name).addClass('group_talk_name');
            addLinkHtml();
            //pluploadFile(id);
            SetSessionForUpload(id);
            getHistory('#work-talk-show-content');
            //getUnread(id);
            //addHistory();
            $('#msg').focus();
            $.im.garupChat(group_name, id,undefined,'group');
            $.im.subTalkGroupWarnCount($this.find('.warn-im-message').html());
        }, 'json').error(function (data) {
            if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                alert('身份过期,点击自动刷新..');
                location.reload();
                return false;
            }
        });
    }
}
function getRead(group_id){
    var data = {
        group_id: group_id,
        n : new Date().getTime()
    };
    $.post('/m/get-read',data,function(res){
        if(res == 'meiyou'){
            return false;
        }
        var arr = res.split(',');
        console.log(arr);
        if(arr == ''){
            return false;
        }
        $.each(arr, function (i, item) {
            //选择出已读的消息
            $('#work-talk-show-content').find('.work-time[data-id=' + item + ']').parent().find('.jindu').html('已读');

        });
    });
}
function getHistory(elem) {
    var group_id = $('div').data('group_id');
    var elem = arguments[0] ? arguments[0] : '#work-talk-show-content';
    var user_id = $('.login-work-user img').attr('data-id');
    var data = {
        group_id: group_id
    };
    $.im.index.talk_content_height = 0;
    $.post(" /m/get-history ", data, function (msg) {
        msg_len = msg.length;
        $(elem).html('');
        if(msg_len != 0){
            $.each(msg, function (i, item) {
                //if(item.uid == user_id) {
                //    if (item.type == 1) {
                //        addRight(item.content, item.time, 0, item.msg_type, item.uname, '', elem, item.id);
                //    }
                //}else{
                //    if (item.type == 1) {
                //        addLeft(item.content, item.photo, item.time, 0, item.msg_type, item.uname, '', elem, item.id);
                //    }
                //}

                if (item.type == 1) {
                    var group_type = msg[0]['group_type'];
                    addRight(item.content, item.time, 0, item.msg_type, item.uname, '', elem, item.id, group_type);
                }
                if (item.type == 0) {
                    addLeft(item.content, item.photo, item.time, 0, item.msg_type, item.uname, '', elem, item.id);
                }


                //                       console.log(i);
                scroll_to = 10000;
                if (elem == '#work-talk-show-content') {
                    $(elem).slimScroll({
                        height: 'auto',
                        size: '5px',
                        //start: 'bottom',
                        scrollTo: scroll_to
                    });
                } else {
                    $(elem).slimScroll({
                        height: '410px',
                        size: '5px',
                        //start: 'bottom',
                        scrollTo: scroll_to
                    });
                }

            });
            if (elem == '.history-content') {
                changeHistoryNumber(0, 0);
            }
            pendLoadMore();
            getRead(group_id);
        }
    }, 'json').error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
}
function scrollHeight() {
    var no_scrill = true;
    $('#work-talk-show-content .talk-sing-user .popover-content img').each(function () {
//                console.log('height:'+$(this).height());
        if ($(this).height() == 0) {
            no_scrill = false;
            setTimeout(function () {
                scrollHeight();
            }, 500)
        }
    });
    if (no_scrill == true) {
        scroll_to = msg_len * 70 + $.im.index.talk_content_height;
//                console.log('总高度:'+scroll_to);
        $.im.index.talk_content_height = 0;
        $('#work-talk-show-content').slimScroll({
            height: 'auto',
            size: '5px',
            start: 'bottom',
            scrollTo: scroll_to
        });
    }
}
function sendMsg(e, msg_type, msg) {
    var msg_type = msg_type ? msg_type : 0;
    var gid = $('div').data('group_id');
    var msg = arguments[2] ? arguments[2] : $('#msg').val();
    var t = new Date();
    var data = {
        msg: msg,
        group_id: gid,
        time: t.toLocaleString(),
        n: t.getTime(),
        msg_type: msg_type
    };
            //console.log(e);
//    alert(msg);
    /*
     $('#msg').val('');
     var t = new Date;
     var time = t.toLocaleString();
     if (msg_type == 2) {
     //                    alert(message);
     }
     if (msg_type != 2) {
     addRight(msg, time, 1, msg_type, '');
     }
     if (msg_type == 3) {
     $.im.shake();
     }
     $('#msg').focus();*/
    $.post("/m/getmsg ", data, function (data) {
        if(data == 'null'){
            return false;
        }

        $('#msg').val('');
        var t = new Date;
        var time = t.toLocaleString();
        if (msg_type == 0) {
            addRight(data.content, time, 1, msg_type, '', '', '#work-talk-show-content', data['message_id'],data['group_type']);
        }
        if (msg_type == 1) {

            addRight(msg, time, 1, msg_type, '', '', '#work-talk-show-content', data['message_id'],data['group_type']);
        }
        if (msg_type == 2) {
//                    alert(message);
            addRight(msg, time, 1, 2, '', '', '#work-talk-show-content', data['message_id'],data['group_type']);
        }
        if (msg_type == 3) {
            $.im.shake();
        }
        $('#msg').focus();
    }).error(function (data) {
        console.log(data);
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
}

/*得到表情*/
$('#emoji_i').emoji_popover();


function addLeft(msg, photo, time, mysent, msg_type, name, address, elem, msg_id) {
    var address = arguments[6] ? arguments[6] : '';
    var elem = arguments[7] ? arguments[7] : '#work-talk-show-content';
    msg = $.im.meojiChangeImg(msg);
    if (elem == '.history-content') {
        if (msg_type == 0) {
            var str = "<div class=\"talk-sing-user\"><input type=\"checkbox\" class=\"checkbox pull-left\" data-id='1' name=\"checkboxa\" value='" + msg_id + "' style=' margin-left: 3px;'><div class=\"sing-user pull-left\"><img src=' "+photo_server+"/upload/photo/s_" + photo + "' class=\"img-circle\" data-toggle=\"tooltip\" data-placement=\"top\"  data-original-title=\"" + name + "\"></div><div class=\"pull-right\" style=\"position: relative; width: 432px;\"><div class=\"work-time\" data-id='" + msg_id + "' >" + time + "</div><div class=\"popover fade right in\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\"><span>" + msg + "</span></div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 1) {
            //              var msg="<img src='/"+msg+"' style='width: 300px;'>";
            var msg = "<a class=\"example-image-link\" href=\"/" + msg + "\" data-lightbox=\"example-set\"><img class=\"example-image\" src=\"/" + msg + "\" style='width: 300px;padding-right:10px'\/><\/a>"
            var str = "<div class=\"talk-sing-user\"><input type=\"checkbox\" class=\"checkbox pull-left\" data-id='1' name=\"checkboxa\" value='" + msg_id + "' style='  margin-top: 10px;margin-left: 3px;'><div class=\"sing-user pull-left\"><img src=\" "+photo_server+"/upload/photo/s_" + photo + "\" class=\"img-circle\" data-toggle=\"tooltip\" data-placement=\"top\"  data-original-title=\"" + name + "\"></div><div class=\"pull-right\" style=\"position: relative; width: 432px;\"><div class=\"work-time\" data-id='" + msg_id + "'>" + time + "</div><div class=\"popover fade right in\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\"><span>" + msg + "</span></div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 2) {
            //var msg = "<a href='/" + msg.substr(0, msg.indexOf('|')) + "' onclick='savepic();return false;' id='dl'>" + msg.substr(msg.indexOf('|') + 1, msg.length) + "<\/a>";
            var msg = "<a  href='/" + msg.substr(0, msg.indexOf('|')) + "' target='_blank' download='" + msg.substr(msg.indexOf('|') + 1, msg.length) + "'>" + msg.substr(msg.indexOf('|') + 1, msg.length) + "<\/a>";
            //                var msg=   "<a href='/m/download/"+msg.substr(0,msg.indexOf('|'))+"/"+msg.substr(msg.indexOf('|')+1,msg.length)+"' target='_blank'>"+msg.substr(msg.indexOf('|')+1,msg.length)+"<\/a>";
            var str = "<div class=\"talk-sing-user\"><input type=\"checkbox\" class=\"checkbox pull-left\" data-id='1' name=\"checkboxa\" value='" + msg_id + "' style='  margin-top: 10px;margin-left: 3px;'><div class=\"sing-user pull-left\"><img src=\" "+photo_server+"/upload/photo/s_" + photo + "\" class=\"img-circle\" data-toggle=\"tooltip\" data-placement=\"top\"  data-original-title=\"" + name + "\"></div><div class=\"pull-right\" style=\"position: relative; width: 432px;\"><div class=\"work-time\" data-id='" + msg_id + "'>" + time + "</div><div class=\"popover fade right in file\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" ><span style='background: #66ccff'>" + msg + "</span'></div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 3) {
            var str = "<div class=\"talk-sing-user\"><input type=\"checkbox\" class=\"checkbox pull-left\" data-id='1' name=\"checkboxa\" value='" + msg_id + "' style='  margin-top: 10px;margin-left: 3px;'><div class=\"sing-user pull-left\"><img src=\" "+photo_server+"/upload/photo/s_" + photo + "\" class=\"img-circle\" data-toggle=\"tooltip\" data-placement=\"top\"  data-original-title=\"" + name + "\"></div><div class=\"pull-right\" style=\"position: relative; width: 432px;\"><div class=\"work-time\" data-id='" + msg_id + "'>" + time + "</div><div class=\"color-gray\"><i class=\"fa shake-logo right10\"></i>你收到一个窗口抖动</div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else {
                $(address).prepend(str);
            }
        }
    } else if(elem == '#work-talk-show-content'){
        if (msg_type == 0) {
            var str = "<div class=\"talk-sing-user\"><div class=\"sing-user pull-left\"><img src=\" "+photo_server+"/upload/photo/s_" + photo + "\" class=\"img-circle\" data-toggle=\"tooltip\" data-placement=\"top\"  data-original-title=\"" + name + "\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px;\"><div class=\"work-time\" data-id='" + msg_id + "' >" + name + "&nbsp;&nbsp;&nbsp;" + time + "</div><div class=\"popover fade right in\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\"><span>" + msg + "</span></div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 1) {
//              var msg="<img src='/"+msg+"' style='width: 300px;'>";
            var msg = "<a class=\"example-image-link\" href=\"/" + msg + "\" data-lightbox=\"example-set\"><img class=\"example-image\" src=\"/" + msg + "\" style='width: 300px;padding-right:10px'\/><\/a>"
            var str = "<div class=\"talk-sing-user\"><div class=\"sing-user pull-left\"><img src=\" "+photo_server+"/upload/photo/s_" + photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px;\"><div class=\"work-time\" data-id='" + msg_id + "'>" + name + "&nbsp;&nbsp;&nbsp;" + time + "</div><div class=\"popover fade right in\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\"><span>" + msg + "</span></div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 2) {
            //var msg = "<a href='/" + msg.substr(0, msg.indexOf('|')) + "' onclick='savepic();return false;' id='dl'>" + msg.substr(msg.indexOf('|') + 1, msg.length) + "<\/a>";
            var msg = "<a  href='/" + msg.substr(0, msg.indexOf('|')) + "' target='_blank' download='" + msg.substr(msg.indexOf('|') + 1, msg.length) + "'>" + msg.substr(msg.indexOf('|') + 1, msg.length) + "<\/a>";
//                var msg=   "<a href='/m/download/"+msg.substr(0,msg.indexOf('|'))+"/"+msg.substr(msg.indexOf('|')+1,msg.length)+"' target='_blank'>"+msg.substr(msg.indexOf('|')+1,msg.length)+"<\/a>";
            var str = "<div class=\"talk-sing-user\"><div class=\"sing-user pull-left\"><img src=\" "+photo_server+"/upload/photo/s_" + photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px;\"><div class=\"work-time\" data-id='" + msg_id + "'>" + name + "&nbsp;&nbsp;&nbsp;" + time + "</div><div class=\"popover fade right in file\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" ><span style='background: #66ccff'>" + msg + "</span'></div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 3) {
            var str = "<div class=\"talk-sing-user\"><div class=\"sing-user pull-left\"><img src=\" "+photo_server+"/upload/photo/s_" + photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px;\"><div class=\"work-time\" data-id='" + msg_id + "'>" + name + "&nbsp;&nbsp;&nbsp;" + time + "</div><div class=\"color-gray\"><i class=\"fa shake-logo right10\"></i>你收到一个窗口抖动</div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (address != '.loadMore') {
            if (msg_type == 1) {

                $(elem).find('.talk-sing-user:last .popover img').load(function () {
                    $(elem).slimScroll({
                        height: 'auto',
                        size: '5px',
                        //start: 'bottom',
                        scrollBy: '10000'
                    });
                });

            } else {
                $(elem).slimScroll({
                    height: 'auto',
                    size: '5px',
                    //start: 'bottom',
                    scrollBy: '10000'
                });
            }
        }
    }else{
        if (msg_type == 0) {
            var str = "<div class=\"talk-sing-user\"><div class=\"sing-user pull-left\"><img src=\" "+photo_server+"/upload/photo/s_" + photo + "\" class=\"img-circle\" data-toggle=\"tooltip\" data-placement=\"top\"  data-original-title=\"" + name + "\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px;\"><div class=\"work-time\" data-id='" + msg_id + "' >" + name + "&nbsp;&nbsp;&nbsp;" + time + "</div><div class=\"popover fade right in\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\"><span>" + msg + "</span></div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 1) {
//              var msg="<img src='/"+msg+"' style='width: 300px;'>";
            var msg = "<a class=\"example-image-link\" href=\"/" + msg + "\" data-lightbox=\"example-set\"><img class=\"example-image\" src=\"/" + msg + "\" style='width: 300px;padding-right:10px'\/><\/a>"
            var str = "<div class=\"talk-sing-user\"><div class=\"sing-user pull-left\"><img src=\" "+photo_server+"/upload/photo/s_" + photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px;\"><div class=\"work-time\" data-id='" + msg_id + "'>" + name + "&nbsp;&nbsp;&nbsp;" + time + "</div><div class=\"popover fade right in\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\"><span>" + msg + "</span></div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 2) {
            //var msg = "<a href='/" + msg.substr(0, msg.indexOf('|')) + "' onclick='savepic();return false;' id='dl'>" + msg.substr(msg.indexOf('|') + 1, msg.length) + "<\/a>";
            var msg = "<a  href='/" + msg.substr(0, msg.indexOf('|')) + "' target='_blank' download='" + msg.substr(msg.indexOf('|') + 1, msg.length) + "'>" + msg.substr(msg.indexOf('|') + 1, msg.length) + "<\/a>";
//                var msg=   "<a href='/m/download/"+msg.substr(0,msg.indexOf('|'))+"/"+msg.substr(msg.indexOf('|')+1,msg.length)+"' target='_blank'>"+msg.substr(msg.indexOf('|')+1,msg.length)+"<\/a>";
            var str = "<div class=\"talk-sing-user\"><div class=\"sing-user pull-left\"><img src=\" "+photo_server+"/upload/photo/s_" + photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px;\"><div class=\"work-time\" data-id='" + msg_id + "'>" + name + "&nbsp;&nbsp;&nbsp;" + time + "</div><div class=\"popover fade right in file\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" ><span style='background: #66ccff'>" + msg + "</span'></div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
    }
    /*    talk_sing_user_height_new = 70;
     if (msg_type != 1) {
     //msg_content_height = $(elem).find('.talk-sing-user:last').height();
     //talk_sing_user_height_new = parseInt(msg_content_height);
     //console.log(talk_sing_user_height_new);
     //$(elem).find('.talk-sing-user:last').height(talk_sing_user_height_new + 'px');
     if (mysent == 1) {
     $(elem).slimScroll({
     height: 'auto',
     size: '5px',
     //start: 'bottom',
     scrollBy: '10000'
     });
     }
     //else {
     //    $.im.index.talk_content_height += parseInt(talk_sing_user_height_new - 60);
     //}
     } else {

     $(elem).find('.talk-sing-user:last .popover img').load(function () {
     //            msg_content_height = $(elem).find('.talk-sing-user:last').height();
     //            talk_sing_user_height_new = parseInt(msg_content_height);
     ////                console.log(talk_sing_user_height_new);
     //            $(elem).find('.talk-sing-user:last').height(talk_sing_user_height_new + 'px');

     if (mysent == 1) {
     $(elem).slimScroll({
     height: 'auto',
     size: '2px',
     //start: 'bottom',
     scrollBy: '10000'
     });
     }
     //else {
     //    $.im.index.talk_content_height += parseInt(talk_sing_user_height_new);
     //}
     });
     }*/


}

function addRight(msg, time, mysent, msg_type, name, address, elem, msg_id,group_type) {
    //msg, time, mysent, msg_type, name, address, elem, msg_id
    /*    var msg = array['msg'];
     var time = array['time'];
     var mysent = array['mysent'];
     var msg_type = array['msg_type'];
     var name = array['name'];
     var address = array['address'];
     var elem = array['elem'];
     var msg_id = array['msg_id'];*/
    var address = arguments[5] ? arguments[5] : '';
    var elem = arguments[6] ? arguments[6] : '#work-talk-show-content';
    var msg_id = arguments[7] ? arguments[7] : '#work-talk-show-content';
    var group_type = arguments[8] ? arguments[8] : 'single';
    var user_photo = $('.login-work-user img').attr('src');
    msg = $.im.meojiChangeImg(msg);
    if (elem == '.history-content') {
        if (msg_type == 0) {
            var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><input type=\"checkbox\" class=\"checkbox pull-left\" data-id='2' name=\"checkboxa\"  value='" + msg_id + "' ><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"popover fade left in pull-right\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id=''>" + msg + "</div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            }
            else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 1) {
            var msg = "<a class=\"example-image-link\" href=\"/" + msg + "\" data-lightbox=\"example-set\"><img class=\"example-image\" src=\"/" + msg + "\" style='width: 300px;padding-right:15px'\/><\/a>";
            var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><input type=\"checkbox\" class=\"checkbox pull-left\" data-id='2' name=\"checkboxa\" value='" + msg_id + "'  style='margin-top : 12px'><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"popover fade left in pull-right\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id=''>" + msg + "</div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 2) {
            var msg = "<a  href='/" + msg.substr(0, msg.indexOf('|')) + "' target='_blank' download='" + msg.substr(msg.indexOf('|') + 1, msg.length) + "'>" + msg.substr(msg.indexOf('|') + 1, msg.length) + "<\/a>";
            //                var msg=   "<a href='/m/download/"+msg.substr(0,msg.indexOf('|'))+"/"+msg.substr(msg.indexOf('|')+1,msg.length)+"' target='_blank'>"+msg.substr(msg.indexOf('|')+1,msg.length)+"<\/a>";
            var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><input type=\"checkbox\" class=\"checkbox pull-left\" data-id='2' name=\"checkboxa\" value='" + msg_id + "'  style='margin-top : 12px'><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"popover fade left in pull-right file\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id='' style='background: #66ccff'>" + msg + "</div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 3) {
            var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><input type=\"checkbox\" class=\"checkbox pull-left\" data-id='2' name=\"checkboxa\" value='" + msg_id + "' style='margin-top : 12px'><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"color-gray\"><i class=\"fa shake-logo right10\"></i>你发送了一个窗口抖动</div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else {
                $(address).prepend(str);
            }
        }
    } else if(elem == '#work-talk-show-content'){
        if (msg_type == 0) {
            if(group_type == 'single') {
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div style='position: relative; text-align: right;padding-left:50px;' class='pull-right'><div style='position: absolute;color: rgba(132, 132, 132, 0.94);padding-top: 15px;font-size: small;left: 0;' class='jindu' >未读</div><div class=\"popover fade left in pull-right\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id=''>" + msg + "</div></div></div></div></div>";
            }else{
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"popover fade left in pull-right\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id=''>" + msg + "</div></div></div></div>";
            }
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 1) {
            var msg = "<a class=\"example-image-link\" href=\"/" + msg + "\" data-lightbox=\"example-set\"><img class=\"example-image\" src=\"/" + msg + "\" style='width: 300px;padding-right:15px'\/><\/a>";
            if(group_type == 'single') {
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div style='position: relative; text-align: right;padding-left:50px;' class='pull-right'><div style='position: absolute;color: rgba(132, 132, 132, 0.94);padding-top: 15px;font-size: small;left: 0;' class='jindu'>未读</div><div class=\"popover fade left in pull-right\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id=''>" + msg + "</div></div></div></div></div>";
            }else{
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"popover fade left in pull-right\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id=''>" + msg + "</div></div></div></div>";
            }
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 2) {
            var msg = "<a  href='/" + msg.substr(0, msg.indexOf('|')) + "' target='_blank' download='" + msg.substr(msg.indexOf('|') + 1, msg.length) + "'>" + msg.substr(msg.indexOf('|') + 1, msg.length) + "<\/a>";
            //                var msg=   "<a href='/m/download/"+msg.substr(0,msg.indexOf('|'))+"/"+msg.substr(msg.indexOf('|')+1,msg.length)+"' target='_blank'>"+msg.substr(msg.indexOf('|')+1,msg.length)+"<\/a>";
            if(group_type == 'single') {
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div style='position: relative; text-align: right;padding-left:50px;' class='pull-right'><div style='position: absolute;color: rgba(132, 132, 132, 0.94);padding-top: 15px;font-size: small;left: 0;' class='jindu'>未读</div><div class=\"popover fade left in pull-right file\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id='' style='background: #66ccff'>" + msg + "</div></div></div></div></div>";
            }else{
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"popover fade left in pull-right file\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id='' style='background: #66ccff'>" + msg + "</div></div></div></div>";
            }
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 3) {
            if(group_type == 'single') {
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div style='position: relative; text-align: right;padding-left:50px;' class='pull-right'><div style='position: absolute;color: rgba(132, 132, 132, 0.94);padding-top: 15px;font-size: small;left: 0;' class='jindu'>未读</div><div class=\"color-gray\"><i class=\"fa shake-logo right10\"></i>你发送了一个窗口抖动</div></div></div></div>";
            }else{
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"color-gray\"><i class=\"fa shake-logo right10\"></i>你发送了一个窗口抖动</div></div></div>";
            }
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (address != '.loadMore') {
            if (msg_type == 1) {

                $(elem).find('.talk-sing-user:last .popover img').load(function () {
                    //msg_content_height = $(elem).find('.talk-sing-user:last').height();
                    //talk_sing_user_height_new = parseInt(msg_content_height);
                    //console.log(talk_sing_user_height_new);
                    //$(elem).find('.talk-sing-user:last').height(talk_sing_user_height_new + 'px');
                    //if (mysent == 1) {
                    $(elem).slimScroll({
                        height: 'auto',
                        size: '5px',
                        //start: 'bottom',
                        scrollBy: '10000'
                    });
                    //} else {
                    //    $.im.index.talk_content_height += parseInt(talk_sing_user_height_new);
                    //}
                });

            } else {
                //msg_content_height = $(elem).find('.talk-sing-user:last').height();
                //talk_sing_user_height_new = parseInt(msg_content_height);
                //$(elem).find('.talk-sing-user:last').height(talk_sing_user_height_new + 'px');

                //if (mysent == 1) {
                $(elem).slimScroll({
                    height: 'auto',
                    size: '5px',
                    //start: 'bottom',
                    scrollBy: '10000'
                });
                //} else {
                //    $.im.index.talk_content_height += parseInt(talk_sing_user_height_new - 60);
                //}
            }
        }
    }else {
        if (msg_type == 0) {
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"popover fade left in pull-right\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id=''>" + msg + "</div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 1) {
            var msg = "<a class=\"example-image-link\" href=\"/" + msg + "\" data-lightbox=\"example-set\"><img class=\"example-image\" src=\"/" + msg + "\" style='width: 300px;padding-right:15px'\/><\/a>";
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"popover fade left in pull-right\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id=''>" + msg + "</div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 2) {
            var msg = "<a  href='/" + msg.substr(0, msg.indexOf('|')) + "' target='_blank' download='" + msg.substr(msg.indexOf('|') + 1, msg.length) + "'>" + msg.substr(msg.indexOf('|') + 1, msg.length) + "<\/a>";
                var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"popover fade left in pull-right file\" role=\"tooltip\" style=\"display: block;\"><div class=\"arrow\" style=\"top: 10px;\"></div><div class=\"popover-content\" id=\"talk_user_right_content\" data-id='' style='background: #66ccff'>" + msg + "</div></div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
        if (msg_type == 3) {
            var str = "<div class=\"talk-sing-user\" ><div class=\"sing-user pull-right\"><img src=\"" + user_photo + "\" class=\"img-circle\"></div><div class=\"pull-right\" style=\"position: relative; width: 445px; text-align: right;\"><div class=\"work-time\" data-id='" + msg_id + "' id=\"talk_user_right_time\">" + time + "</div><div class=\"color-gray\"><i class=\"fa shake-logo right10\"></i>你发送了一个窗口抖动</div></div></div>";
            if (address == '') {
                $(elem).append(str);
            } else if (address == '.loadMore') {
                $(address).after(str);
            } else {
                $(address).prepend(str);
            }
        }
    }


    /*    if (msg_type == 1 && mysent == 1) {
     $.im.options.appent_file = true;
     t = $(elem).find('.talk-sing-user:last .pull-right .popover .popover-content').position().top;
     l = $(elem).find('.talk-sing-user:last .pull-right .popover .popover-content').position().left;
     w = $(elem).find('.talk-sing-user:last .pull-right .popover .popover-content').width();
     h = $(elem).find('.talk-sing-user:last .pull-right .popover .popover-content').height();
     progress = '<div class="popover-progress" style="left: ' + l + 'px;top:' + t + 'px;width:0px;height:' + parseInt(12 + h) + 'px;position:absolute;BACKGROUND: #66ccff;opacity:.4;"></div>';
     $(elem).find('.talk-sing-user:last .pull-right .popover .popover-content').prepend(progress);
     }*/
    //talk_sing_user_height_new = 70;
    //
    //msg_content_height = $(elem).find('.talk-sing-user:last').height();
//            console.log(msg_type);
    // 图片

}

function upload_image(msg) {
    sendMsg($(this), 1, msg);
}

function delChatHistory(event) {
    event.stopPropagation();
    $this = $(this);
    var group_id = $(this).parent().attr('data-id');
    var data = {
        group_id: group_id,
        n: new Date().getTime()
    };
    if ($('.work-talk.pull-left').css('display') == 'none') {
        $('.history-content').html('');
        $('.search-count').html('');
        $('.work-history.pull-left').hide();
        $('.work-talk.pull-left').show();

    }
    if ($('.nav.nav-tabs.talk .talking .warn-im-message').html() != 0) {

        var res = $('#talk-user-form div[data-id=' + parseInt(group_id) + '] .warn-im-message').html();
        if (res != undefined) {
            var num = $('.nav.nav-tabs.talk .talking .warn-im-message').html() - res;
            if (num == 0) {
                $('.nav.nav-tabs.talk .talking .warn-im-message').html(0);
                $('.nav.nav-tabs.talk .talking .warn-im-message').hide();
            } else {
                $('.nav.nav-tabs.talk .talking .warn-im-message').html(num);
            }
        }
    }
    $this.parent().remove();
    $('#talk_name_show').html('');
    $('#work-talk-show-content').html('');
    $('div').data('group_id', '');


    $.post("/m/delete-chat-history ", data, function (group_id) {


    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
}

/*
 *显示加载更多文字
 */
function pendLoadMore(page, flag) {
    var page = arguments[0] ? arguments[0] : 2;
    if (!$('div').hasClass('loadMore')) {
        $('#work-talk-show-content .talk-sing-user:first').parent().prepend("<div class='loadMore' data-id='" + page + "'><a href='javascript://'>加载更多<a/></div>");
    }
        $('.loadMore a').off('click');
        $('.loadMore a').on('click', loadPages);

}
/*
 *AJAX传递分页页数到后台
 */
function loadPages() {
    var group_id = $('div').data('group_id');
    var page = $('.loadMore').attr('data-id');
    var user_id = $('.login-work-user img').attr('data-id');
    $('.loadMore').html("<a href='javascript://'>加载中...<a/>");
    var data = {
        group_id: group_id,
        pages: page
    };
    $.post(" /m/get-history ", data, function (msg) {
        if (msg.length == 0) {
            //$('#work-talk-show-content .talk-sing-user:first').parent().prepend("<div class='loadMore' data-id='" + page + "'>没有更多了</div>");
            $('.loadMore').html('没有更多了');
        } else {
            page++;
            $('.loadMore').attr('data-id', page);
            //$('.loadMore').css('display', 'none');
            var address = '.loadMore';
            $.each(msg, function (i, item) {
                if (item.type == 1) {
                    var group_type = msg[0]['group_type'];
                    addRight(item.content, item.time, 1, item.msg_type, item.uname, address, '', item.id,group_type);
                }
                if (item.type == 0) {
                    addLeft(item.content, item.photo, item.time, 0, item.msg_type, item.uname, address);
                }
            });
            $('.loadMore').html("<a href='javascript://'>加载更多<a/>");
            pendLoadMore(page);
            getRead(group_id);
        }

    }).error(function (data) {
        if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
            alert('身份过期,点击自动刷新..');
            location.reload();
            return false;
        }
    });
}

$(document).ready(function () {
    show_msg = function (data) {
        var group_id = $('div').data('group_id');
        console.log(data);
        if (data.msg_type == 99) {
            //修改群聊备注名
            var elem = $('#talk-group').find('.talk-group-menu li[data-id=' + data.message_id + ']');
            if (elem.find('#company_name_show_top').length != 0) {
                elem.find('#company_name_show_top').html(data.content);
                if ($('div').data('group_id') == data.message_id) {
                    $('#talk_name_show').html(data.content);
                }
            }
        } else if (data.msg_type == 98) {
            //增加群聊
            var elem = $('#talk-group').find('.talk-group-menu li[data-id=' + data.message_id + ']');
            if (elem.find('#company_name_show_top').length != 0) {
                elem.find('#company_name_show_top').html(data.content);
                elem.find('#company_name_show_top').attr('title',data.content);
                if (group_id == data.message_id) {
                    $('#talk_name_show').html(data.content);
                    $('#talk_name_show').attr('title',data.content);
                    addRightContacts();
                }
            }/*else{
                var li_html='<li class="getgroupchat" type="custom" data-id="'+data.message_id+'">'
                +'<span class="warn-im-message label-danger" style="display:block">1</span>'
                +'<a href="#"><i class="fa fa-bars" style="color: #3a9ae0;"></i> '
                +'<span id="company_name_show_top" title="'+data.content+'">'
                +data.content+'</span></a></li>'
                $('#tan').append(li_html);
            }*/
        } else if (data.msg_type == 97) {
            //判断为已读
            //var obj = eval('(' + data.content + ')');
            var arr = data.content.split(',');
            if(arr.length == 0){
                return false;
            }
            $.each(arr, function (i, item) {
                //$('#work-talk-show-content').find('.work-time[data-id=' + item + ']').html(item);
                $('#work-talk-show-content').find('.work-time[data-id=' + item + ']').parent().find('.jindu').html('已读');
            });
        } else if (data.msg_type == 96){
            //删除自定义的成员
            var content_str = data.content;
            var group_name = content_str.substring(0, content_str.lastIndexOf('|'));
            var delete_user_id = content_str.substring(content_str.lastIndexOf('|') + 1, content_str.length);
            var $change_li = $('#tan').find('li[data-id='+data.message_id+']');
            if(user_id == delete_user_id){
                //被删除的人
                $.im.subTalkGroupWarnCount($change_li.find('.warn-im-message').html());
                $change_li.remove();
                if ($change_li.hasClass('active')) {
                    $('div.right-contact-plus-hide').hide();
                    $('#talk_name_show').html('').attr('title', '').removeClass('group_talk_name');
                    $('#work-talk-show-content').html('');
                    $('section.im').css('width', '750px');
                }
            }else{
                //和被删除的人在同一讨论组的人
                $change_li.html(group_name).attr('title', group_name);
                if ($change_li.hasClass('active')) {
                    $('div.work-talk-title').html(group_name).attr('title', group_name);
                    $('div.right_roll_control').find('span[data-id='+delete_user_id+']').parents('li.treeview').parent().remove();
                }
            }
        }else if(data.msg_type == 95){
            //退出自定义聊天组
            var content_str = data.content;
            var group_name = content_str.substring(0, content_str.lastIndexOf('|'));
            var delete_user_id = content_str.substring(content_str.lastIndexOf('|') + 1, content_str.length);
            alert(group_name);
            alert(delete_user_id);


        }else {
            var t = new Date;
            var time = t.toLocaleString();

            var chat = {
                group_id: group_id,
                message_id: data.message_id,
                n: t.getTime()
            };
            $.post(" /m/chat-message ", chat, function (d) {
                console.log(d);
                if (d['msg_type'] == 3) {
                    $.im.shake();
                }
                if (d['type'] == 'single') {
                    if(d['msg_type'] == 0){
                        notify(d['name'],data.content,d['photo']);
                    }
                    //1. 当前打开的界面
                    if (d['group_id'] == $('div').data('group_id')) {
                        addLeft(data.content, d['photo'], time, 1, d['msg_type'], d['name']);
                        //发送消息未读
                        /*                        $.post('/m/message-check',chat,function(){

                         });*/
                    } else {
                        $.im.addCurrChat(d['name'], d['photo'], d['group_id'], 1);
                    }
                } else if (d['type'] == 'group' || d['type'] =='custom') {
                    var content_str = data.content;
                    var content = content_str.substring(0, content_str.lastIndexOf('|'));
                    var photo = content_str.substring(content_str.lastIndexOf('|') + 1, content_str.length);
                    if(d['msg_type'] == 0){
                        notify(d['group_name'],content,photo);
                    }
                    if (d['group_id'] == $('div').data('group_id')) {
                        addLeft(content, photo, time, 1, d['msg_type'], d['name']);
                    } else {
                        $.im.garupChat(d['group_name'], d['group_id'], 1,d['type']);
                    }
                }
            }).error(function (data) {
                if (data['statusText'] == 'Unauthorized' && data['status'] == 401) {
                    alert('身份过期,点击自动刷新..');
                    location.reload();
                    return false;
                }
            });
        }
    };

    /**
     * 删除讨论组成员
     */
    function delete_custom_user(){
        var $this = $(this),
            $user = $this.prev().find('span'),
            user = {
                id : $user.data('id'),
                name : $user.text(),
                photo : $user.prev().attr('src'),
                department_id: $user.data('department_id')
            },
            group_id = $('div').data('group_id');
        var old_title_name = $('#talk_name_show').text();
        var reg = '/'+ user.name + '[、]{1}|[、]{1}'+ user.name + '/';
        var new_title_name = old_title_name.replace(eval(reg),'');
        $this.next('.icon-wait').show();
        $.ajax({
            url: '/m/delete-custom-group',
            type: 'POST',
            dataType: 'text',
            data: {group_id: group_id,user_id:user.id},
        })
        .done(function(data) {
            if (data == 'ok') {
                $this.parent().remove();
                var $that_custom = $('div.all-member-float').find('span.getgroupname[data-id="'+user.department_id+'"]').parents('a');
                if ($that_custom.parent().hasClass('opened')) {
                    var add_user_html='<li data-id="'+user.id+'" class="add-number-click"><img class="photo" src="'+user.photo+'">'+user.name+'</li>';
                    $that_custom.next('ul').prepend(add_user_html);
                }
                var user_num = $('div.right_roll_control').find('li.treeview').length;
                $('div.right-contacts-numbers').find('span').text(user_num);
                $('#talk_name_show').html(new_title_name).attr('title', new_title_name);
                $('#talk-group').find('li.active a span').text(new_title_name).attr('title', new_title_name);
                $('.add-number-content').find('.add-number-click').off('click');
                addCustomGroup(group_id);
            }else{
                alert('删除失败');
            }
        })
        .fail(function(data) {
            console.log("error");
        })
        .always(function() {
            $this.next('.icon-wait').hide();
        });
    }

    $('div.right-contact-plus-hide').on('click', 'i.fa-close', delete_custom_user);
});
