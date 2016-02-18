$.im = {};
$(function(){
    _init();
    $.im.tree('.talk-company-menu');
    $.im.emoji();
});
function _init() {
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

                //Open the target menu and add the menu-open class
                checkElement.slideDown('normal', function () {
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
    /*加上表情*/
    $.im.emoji = function(){
        $('body').on('click','.emoji_img',function(){
            work_talk_content_val = $('.work-talk-content').val();
            $('.work-talk-content').val(work_talk_content_val+'[表情]');
        });

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
         $('#emoji_popover').remove();
        html = '<div class="popover top" role="tooltip" id="emoji_popover" style="width:375px;display: none;">';
        html +=  '<div class="arrow" style="left: 20px;"></div> <div class="popover-content emoji"> <img class="emoji_img" src="images/emoji/emoji_1.png"> <img class="emoji_img" src="images/emoji/emoji_2.png"> <img class="emoji_img" src="images/emoji/emoji_3.png"> <img class="emoji_img" src="images/emoji/emoji_4.png"><img class="emoji_img" src="images/emoji/emoji_5.png"><img class="emoji_img" src="images/emoji/emoji_6.png"><img class="emoji_img" src="images/emoji/emoji_7.png"><img class="emoji_img" src="images/emoji/emoji_8.png"><img class="emoji_img" src="images/emoji/emoji_9.png"><img class="emoji_img" src="images/emoji/emoji_10.png"><img class="emoji_img" src="images/emoji/emoji_11.png"><img class="emoji_img" src="images/emoji/emoji_12.png"><img class="emoji_img" src="images/emoji/emoji_13.png"><img class="emoji_img" src="images/emoji/emoji_14.png"><img class="emoji_img" src="images/emoji/emoji_15.png"><img class="emoji_img" src="images/emoji/emoji_16.png"><img class="emoji_img" src="images/emoji/emoji_17.png"><img class="emoji_img" src="images/emoji/emoji_18.png"><img class="emoji_img" src="images/emoji/emoji_19.png"><img class="emoji_img" src="images/emoji/emoji_20.png"><img class="emoji_img" src="images/emoji/emoji_21.png"><img class="emoji_img" src="images/emoji/emoji_22.png"><img class="emoji_img" src="images/emoji/emoji_23.png"><img class="emoji_img" src="images/emoji/emoji_24.png"><img class="emoji_img" src="images/emoji/emoji_25.png"><img class="emoji_img" src="images/emoji/emoji_26.png"></div></div>';
        $this.before(html);
        ph = $('#emoji_popover').height();
        $('#emoji_popover').css({'top':parseInt(t-ph-30)+'px','left':l+'px'});
        $('#emoji_popover').show();
         event.stopPropagation();
     });
}
$('body').on('click',function(){
    $('#emoji_popover').remove();
});

$.fn.emoji_popover = emoji_popover;