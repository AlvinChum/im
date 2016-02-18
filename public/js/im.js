


$(function(){
    $.im = {};
    $.im.options = {
        im_show:[],
        shake_time:500,
        im_show_margin_left:0,
        has_emoji_cache: false,
        emoji_cache:[]
    }
    _init();
    //console.log($.options);
    $.im.tree('.talk-company-menu');
    $.im.hover_show();
    $.im.im_show = $('.wrapper .im');
    $.im.options.im_show_margin_left = $.im.im_show.css('margin-left').replace('px','');
    $.im.emojiSelect();
    $.im.setEmojiCache();
    $.im.meojiChangeImg('spdofsdp');
    $.im.emojiBlur();

});
function _init() {
    /*读取表情*/
    $.im.setEmojiCache = function(){
        $.im.ajax('/m/emoji','','GET','emoji_cache');
    }
    $.im.meojiChangeImg = function(msg){
        //console.log($.im.options.emoji_cache);
        if($.im.options.has_emoji_cache == false){
            setTimeout(function(){
                $.im.meojiChangeImg(msg);
            },1000);
        } else {
            // var   re =/(\[(.*)\])+/;
            var   re =/\[(.+?)\]/g;
            s = msg.match(re);
            //console.log(s);
            if(s){
                $.each(s,function(i,n){
                    img_html = '<img src="/images/emoji/'+$.im.options.emoji_cache[n]+'" style="width:30px; height:30px;margin-left:5px;">';
                    msg = msg.replace(n,img_html);
                });
            }
            return msg;
        }
    }
    $.im.hover_show = function(){
        $('body #talk-user-form').on('mouseover','.talk-sing-user',function(){
            $(this).find('.close').show();
        }).on('mouseout',function(){
            $(this).find('.close').hide();
        })
    }
    $.im.layout = {
        fix: function () {
            //Get window height and the wrapper height
            var neg = $('.main-header').outerHeight() + $('.main-footer').outerHeight();
            var window_height = $(window).height();
            var sidebar_height = $(".sidebar").height();
            //Set the min-height of the content and sidebar based on the
            //the height of the document.
            if ($("body").hasClass("fixed")) {
                $(".content-wrapper, .right-side").css('min-height', window_height - $('.main-footer').outerHeight());
            } else {
                var postSetWidth;
                if (window_height >= sidebar_height) {
                    $(".content-wrapper, .right-side").css('min-height', window_height - neg);
                    postSetWidth = window_height - neg;
                } else {
                    $(".content-wrapper, .right-side").css('min-height', sidebar_height);
                    postSetWidth = sidebar_height;
                }
            }
        }
    }
    $.im.tree = function (menu) {
        var _this = this;

        $("li a", $(menu)).on('click', function (e) {
            //Get the clicked link and the next element
            var $this = $(this);
            var checkElement = $this.next();

            //Check if the next element is a menu and is visible
            if ((checkElement.is('.treeview-menu')) && (checkElement.is(':visible'))) {
                //Close the menu
                checkElement.slideUp('normal', function () {
                    checkElement.removeClass('menu-open');
                    //Fix the layout in case the sidebar stretches over the height of the window
                    //_this.layout.fix();
                });
                $this.find('i').attr('class', 'fa  fa-chevron-right');
                checkElement.parent("li").removeClass("active");
            }
            //If the menu is not visible
            else if ((checkElement.is('.treeview-menu')) && (!checkElement.is(':visible'))) {
                //Get the parent menu
                var parent = $this.parents('ul').first();
                //Close all open menus within the parent
                var ul = parent.find('ul:visible').slideUp('normal');
                //Remove the menu-open class from the parent
                ul.removeClass('menu-open');
                //Get the parent li
                var parent_li = $this.parent("li");
                $this.find('i').attr('class', 'fa  fa-chevron-down');
                //Open the target menu and add the menu-open class
                checkElement.slideDown('fast', function () {
                    //Add the class active to the parent li
                    checkElement.addClass('menu-open');
                    parent.find('li.active').removeClass('active');
                    parent_li.addClass('active');
                    //Fix the layout in case the sidebar stretches over the height of the window
                    _this.layout.fix();
                });
            }
            //if this isn't a link, prevent the page from being redirected
            if (checkElement.is('.treeview-menu')) {
                e.preventDefault();
            }
        });
    };
    /*当前聊天*/
    $.im.currChat = function(elem,id){
        $('#talk-user-form').find('div.talk-sing-user').removeClass('active');
        $('ul.talk').find('li').removeClass('active');
        $('ul.talk').find('li.talking').addClass('active');
        $('.work-user div.tab-content>div[role=tabpanel]').removeClass('active');
        $('#talking').addClass('active');
       // talking_html = '<div class="talk-sing-user">'+elem.clone()+'</div>';
        //alert(elem.clone()
        var singer_user_len = $('#talk-user-form').find('div.talk-sing-user').length;//当前聊天的个数
        if($('#talk-user-form div[data-id='+id+']').length == 0 ){
            //默认最大的聊天数为20
            if (singer_user_len>=20) {
                $('#talk-user-form').find('div.talk-sing-user:last').remove();
            }
            $('#talk-user-form').prepend('<div class="talk-sing-user active" data-id="'+id+'"></div>');
            var $new_user_elem = $('#talk-user-form div[data-id='+id+']');
            $new_user_elem.prepend(elem.clone());
            $new_user_elem.append('<span class="warn-im-message label-danger"  style="display:none">0</span>');

            $new_user_elem.append('<div class="pull-right close"></div>');
        } else {
            user_elem = $('#talk-user-form div[data-id='+id+']');
            user_elem.addClass('active');
            /*user_elem_clone = user_elem.clone();
            user_elem.remove();
            $('.work-user div.tab-content #talking #talk-user-form').prepend(user_elem_clone);*/
        }
    }
    /*群组*/
    $.im.garupChat = function(group_name,id,new_message,type){
        var groups_icon;//群组的图标
        if(new_message != 1) {
            $('ul.talk>li').removeClass('active');
            $('ul.talk>li.talk-group').addClass('active');
            $('div.tab-content>div[role=tabpanel]').removeClass('active');
            $('div.tab-content #talk-group').addClass('active');
        }
        var $group_unread=$('#talking_group_unread');
        //console.log(parseInt($group_unread.text()));
        group_elem = $('#tan li[data-id='+id+']');
        if(group_elem.length == 0){
            //$group_unread.text(parseInt($group_unread.text())+1).show();//未读消息+1
            if (type == 'custom') {
                groups_icon ='<i class="fa fa-bars" style="color: #3a9ae0;"></i>';
            }else{
                groups_icon ='<i class="fa fa-group" style="color: #3a9ae0;"></i>';
            }
            group_html = '<li class="getgroupchat" type="'+type+'" data-id="'+id+'">';
            group_html += '<span class="warn-im-message label-danger" style="display:none">0</span><a href="#">'+groups_icon+' <span id="company_name_show_top" title="'+group_name+'">'+group_name+'</span></a></li>';
            $('#talk-group .slimScrollDiv .talk-group-menu').prepend(group_html);
            if(new_message != 1 && new_message != 2){
                $('#talk-group .talk-group-menu li').removeClass('active');
                $('#talk-group .talk-group-menu li[data-id='+id+']').addClass('active');
            }
            group_elem = $('#talk-group .talk-group-menu li[data-id='+id+']');
        } else {
            if(new_message != 1){
                //$.im.subTalkGroupWarnCount(group_elem.find('.warn-im-message').html());
                $('#talk-group .talk-group-menu li').removeClass('active');
                group_elem.addClass('active');
            }
        }
        if(new_message == 1){
            $.im.addTalkGroupWarnCount();
            curr_group_count = group_elem.find('.warn-im-message').html();
            group_elem.find('.warn-im-message').html(parseInt(curr_group_count) + 1);
            group_elem.find('.warn-im-message').show();
        } else {
            group_elem.find('.warn-im-message').html(0);
            group_elem.find('.warn-im-message').hide();
        }
        var jsdata = [
            [{
                text: "移除当前会话",
                func: function() {
                    var $this = $(this);
                    deleteGroupChat($this,'group');
                }
            }],
            [{
                text: "设为已读",
                func: function() {
                    var $this = $(this);
                    reduceGroupUnread($this,'group');
                }
            }],
            [{
                text: "设为全部已读",
                func: function() {
                    reduceAllGroupUnread('group');
                }
            }]
        ];

        //$(".getgroupchat").smartMenu(jsdata, {name:'group'});
    }
    $.im.addCurrChat = function(name,photo,data_id,new_message){
        if($('#talk-user-form div[data-id='+parseInt(data_id)+']').length == 0){
            $('#talk-user-form div.talk-sing-user').removeClass('active');
            curr_chat_html = '<div class="talk-sing-user user_history" data-id="'+parseInt(data_id)+'"><span class="warn-im-message label-danger" style="display: none;">0</span><a href="javascript:void(0);" class="sing-user" data-id="'+parseInt(data_id)+'"><img src="http://work.icom2work.com/upload/photo/'+photo+'" class="img-circle"><span class="get_talk_name">'+name+'</span></a><div class="pull-right close"></div></div>';
            $('#talk-user-form').prepend(curr_chat_html);
            if(new_message == 1){
                $('#talk-user-form div[data-id='+parseInt(data_id)+']').find('.warn-im-message').show();
                $.im.addTalkingWarnCount(data_id);

            }

        } else {
            warn_im_count = $('#talk-user-form div[data-id='+parseInt(data_id)+'] .warn-im-message');
            if(new_message == 1){
                if(warn_im_count.length !=0) {
                    $.im.addTalkingWarnCount(data_id);
                }else if(warn_im_count.length == 0){
                    //$('#talk-user-form div[data-id='+parseInt(data_id)+']').prepend('<span class="warn-im-message label-danger">0</span>');
                    $('#talk-user-form div[data-id='+parseInt(data_id)+']').find('.warn-im-message.label-danger').show();
                    $.im.addTalkingWarnCount(data_id);
                }
            }
            //warn_im_count.html(parseInt(warn_im_count.html()) + 1);
            //warn_im_count.show();
        }
        var singlejsdata = [
            [{
                text: "移除当前会话",
                func: function() {
                    var $this = $(this);
                    deleteGroupChat($this,'single');
                }
            }],
            [{
                text: "设为已读",
                func: function() {
                    var $this = $(this);
                    reduceGroupUnread($this,'single');
                }
            }],
            [{
                text: "设为全部已读",
                func: function() {
                    reduceAllGroupUnread('single');
                }
            }]
        ];
        //$(".talk-sing-user.user_history").smartMenu(singlejsdata, {name:'single'});
    }
    /*个人对个人聊天的数量*/
    $.im.addTalkingWarnCount = function(data_id){
        all_warn_im_count = $('#talk-user-form div[data-id='+parseInt(data_id)+'] .warn-im-message');
        top_all_warn_im_count = $('.nav.nav-tabs.talk .talking .warn-im-message');
        all_warn_im_count.html(parseInt(all_warn_im_count.html()) + 1);
        top_all_warn_im_count.html(parseInt(top_all_warn_im_count.html()) + 1);
        all_warn_im_count.show();
        top_all_warn_im_count.show();
    }
    /*个人对个人聊天的数量(总数量)*/
    $.im.subTalkingWarnCount = function(sub_count){
        if(sub_count == undefined){
            sub_count = 0;
        }
        sub_count = parseInt(sub_count);
        all_warn_im_count = $('.nav.nav-tabs.talk .talking .warn-im-message');
        all_warn_im_curr_count = parseInt(all_warn_im_count.html());
        all_warn_im_curr_gap = parseInt(all_warn_im_curr_count - sub_count);
        if(all_warn_im_curr_gap <= 0) {
            all_warn_im_count.html(0);
            all_warn_im_count.hide();
        } else {
            all_warn_im_count.html(all_warn_im_curr_gap);
            all_warn_im_count.show();
        }
    }
    /*群组聊天的数量*/
    $.im.addTalkGroupWarnCount = function(){
        all_warn_im_count = $('li.talk-group .warn-im-message');
        all_warn_im_count.html(parseInt(all_warn_im_count.html()) + 1);
        all_warn_im_count.show();
    }
    /*群组聊天的数量(总数量)*/
    $.im.subTalkGroupWarnCount = function(sub_count){
        if(sub_count == undefined) sub_count = 0;
        sub_count = parseInt(sub_count);
        all_warn_im_count = $('li.talk-group .warn-im-message');
        all_warn_im_curr_count = parseInt(all_warn_im_count.html());
        all_warn_im_curr_gap = parseInt(all_warn_im_curr_count - sub_count);
        if(all_warn_im_curr_gap <= 0) {
            all_warn_im_count.html(0);
            all_warn_im_count.hide();
        } else {
            all_warn_im_count.html(all_warn_im_curr_gap);
            all_warn_im_count.show();
        }
    }
    /*抖屏*/
    $.im.shake = function(){
        //抖动的宽度
        shake_width = Math.floor($.im.options.shake_time/100)*3;
        $.im.options.shake_time = $.im.options.shake_time-100;

        im_show_left = -(parseInt(shake_width) + Math.abs($.im.options.im_show_margin_left));
        im_show_right = -(Math.abs($.im.options.im_show_margin_left) - parseInt(shake_width));
        $.im.im_show.animate({marginLeft:im_show_left+'px'}, 25);
        setTimeout(function(){
            $.im.im_show.animate({marginLeft:im_show_right+'px'}, 25);
        },25);
        setTimeout(function(){
            $.im.im_show.animate({marginLeft:$.im.options.im_show_margin_left+'px'}, 50);
        },50);
        if($.im.options.shake_time > 100) {
            setTimeout(function(){
                $.im.shake();
            },75);
        } else {
            $.im.options.shake_time = 500;
        }
    }
    /*ajax集中处理*/
    $.im.ajax = function(url,data,method,type){
        method = method?method:'GET';
        $.ajax({
            url: url,
            type: method,
            dataType: 'json',
            data: data,
        })
        .done(function(data) {
            switch(type){
                case 'emoji':
                    /*保存表情*/
                    $.im.emojiHtml(data);
                break;
                case 'emoji_cache':
                //console.log(data);
                    /*解释表情*/
                    $.each(data,function(i,n){
                        $.im.options.emoji_cache['['+n.emoji_name+']'] = n.emoji_url;
                        $.im.options.has_emoji_cache = true;
                    });
                break;
            }
        })
        .fail(function() {
            //console.log("error");
        })
        .always(function() {
            //console.log("complete");
        });

    }
    $.im.emojiHtml = function(data){
        //console.log(data);
        $('#emoji_popover').remove();
        html = '<div class="popover top" role="tooltip" id="emoji_popover" style="width:375px;display: none;">';
        html +=  '<div class="arrow" style="left: 20px;"></div> <div class="popover-content emoji">';
        $.each(data,function(i,n){
            html +=  '<img class="emoji_img" src="/images/emoji/'+n.emoji_url+'" title="'+n.emoji_name+'">';
        });
        html +=  '</div></div>';
        $('#emoji_i').before(html);
        ph = $('#emoji_popover').height();console.log(ph);
        //$('#emoji_popover').css({'top':parseInt(t-ph-30)+'px','left':l+'px'});
        //$('#emoji_popover').css({'top':-ph+'px','left':'23px'}).show();
        $('#emoji_popover').css({'top':'-195px','left':'-1px'}).show();
        //$('#emoji_popover').show();
         event.stopPropagation();
    }
    $.im.emojiSelect = function(){
        $('body').on('click','#emoji_popover .emoji img',function(){
            title = $(this).attr('title');
            talk_val = $('textarea.work-talk-content').val();
            talk_val = talk_val+'['+title+']';
            $('textarea.work-talk-content').val(talk_val);
            $('#emoji_popover').remove();

        })
    }

    /**
     * 当点击页面的其他地方时，删除表情框
     * @return {[type]} [description]
     */
    $.im.emojiBlur = function(){
        $('body').on('click',function(){
            $('#emoji_popover').remove();
        })
    }

}
/* 弹出框表情
 * option 配置属性
 * */
 function emoji_popover(option){
     $this = $(this);
     t = $this.position().top;
     l = $this.position().left;
     w = $this.width();
     h = $this.height();
     $this.on('click',function(){
        $.im.ajax('/m/emoji','','GET','emoji');

     });
}
$.fn.emoji_popover = emoji_popover;

