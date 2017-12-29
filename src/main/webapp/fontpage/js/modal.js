/*! 
* modal.js 
* © 2015-2016 by shihangshengxian http://www.34580.com/
* v1.0 2015-10-28
* $.modal({ title: '删除地址', content: '你确定要删除这条地址吗？', top: '20%', bottom: [{ name: '取消', click: '$.close()', classs: 'btn-ios-cancel' }, { name: '确定', click: '$.close()', classs: 'btn-ios-confirm' }] });
*/

(function ($) {
    $.extend({
        modal: function (options) {
            options = $.extend({
                title: "",              //标题
                content: "",            //内容
                width: "92%",           //宽度
                left: "4%",             //距离左边的距离
                top: "10%",             //距离上面的距离
                animated: "zoomIn",     //动画效果 zoomIn|zoomOut bounceInUp|bounceOutDown
                jinzhi: 1,              //是否锁定屏幕 1：否 0：是
                bottom: [],             //自定义按钮样式和事件
                url: "",                //异步加载url                
                scroll: false           //是否开启滚动插件 需要页面引用iscroll.js
            }, options);
            //定义背景
            var mask = '<div class="modalsBg"></div>';
            //定义弹出框
            var boxcontain = '<div class="modal">' +
		                        '<div class="modal-dialog">' +
			                        '<div class="modal-title"></div>' +
//			                        '<span class="close">×</span>' +
				                    '<div class="modal-body"></div>' +
					                '<div class="modal-footer"></div>' +
			                    '</div>' +
		                     '</div>';
            //定义弹出框样式
            var cssCode = '.modalsBg{display:none;position:fixed;height:100%;width:100%;background:rgba(0,0,0,0.78);top:0;left:0;z-index:2;}' +
              '.modal{position:fixed;width:85%;left:7.5%;top:10000px;z-index:3;text-align:center;display: block;}' +
              '.modal-dialog{width:100%;height:100%;background:#fff;position:relative;border-radius:10px;margin:0;}' +
              '.modal-dialog .close{position:absolute;top:0;right:10px;font-size:36px;color:#ccc;font-family:Arial;font-weight:100;}.modal-dialog .close:hover{color:#000;}' +
              '.modal-title{text-align:center;font-size:18px;color:#000;padding-top:30px;font-weight: 600;padding-bottom:10px;margin:0 4%;width:92%;box-sizing:border-box;white-space:nowrap;overflow:hidden;}' +
              '.modal-body{width:90%;z-index:1;margin:0 5%;padding-bottom: 10px;overflow:hidden;color:#000;font-size:15px;line-height:24px;}.modal-body .red{color:#ff3b2f;}' +
              '.modal-body input{width:90%;margin:10px 5%;height:2.4rem;font-size:1rem;padding-left:10px;border:1px solid #d4d4d4;outline:0;-webkit-appearance:none;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box;z-index:9999;border-radius:0px;}' +
              '.modal-footer{overflow:hidden;width:100%;padding:10px 0;border-top:0;padding-bottom: 0;}.modal-footer a{text-decoration:none;}' +
              '.btn-default{width:50%;height:3rem;float:right;background:#e4eaec;font-size:1.1rem;color:#000;line-height:2.6rem;text-align:center;border-bottom-right-radius: 10px;}' +
              '.btn-confirm{width:50%;height:3rem;float:left;background:#f6514b;font-size:1.1rem;color:#fff;line-height:2.6rem;text-align:center;border-bottom-left-radius: 10px;}' +
              '.btn-primary{width:90%;height:3rem;float:right;background:#093;border-radius:3px;font-size:1.1rem;color:#fff;line-height:2.6rem;margin-left:5%;}' +
              '.btn-ios-default{width:100%;height:50px;float:right;font-size:1.1rem;color:#0099FF;line-height:50px;border-top:1px solid#ccc}' +
              '.btn-ios-cancel{width:50%;height:50px;float:right;font-size:1.1rem;color:#0099FF;line-height:50px;border-top:1px solid#ccc;border-left:1px solid#ccc}' +
              '.btn-ios-confirm{width:50%;height:50px;float:right;font-size:1.1rem;color:#0099FF;line-height:50px;border-top:1px solid#ccc}' +
              '.spinner{width:40px;height:40px;margin:0 auto;background-color:#093;border-radius:100%;-webkit-animation:scaleout 1.0s infinite ease-in-out;animation:scaleout 1.0s infinite ease-in-out;}' +
              '@-webkit-keyframes scaleout{0%{-webkit-transform:scale(0.0);}100%{-webkit-transform:scale(1.0);opacity:0;}}@keyframes scaleout{0%{transform:scale(0.0);-webkit-transform:scale(0.0);}100%{transform:scale(1.0);-webkit-transform:scale(1.0);opacity:0;}}';
            //定义弹出框动画
            var cssAnimate = '.animated{-webkit-animation-duration:1s;animation-duration:1s;-webkit-animation-fill-mode:both;animation-fill-mode:both;}.animated-500{-webkit-animation-duration:500ms;animation-duration:500ms;-webkit-animation-fill-mode:both;animation-fill-mode:both;}' +
                '@-webkit-keyframes zoomIn{from{opacity:0;-webkit-transform:scale3d(.3,.3,.3);transform:scale3d(.3,.3,.3);}50%{opacity:1;}}@keyframes zoomIn{from{opacity:0;-webkit-transform:scale3d(.3,.3,.3);transform:scale3d(.3,.3,.3);}50%{opacity:1;}}.zoomIn{-webkit-animation-name:zoomIn;-webkit-animation-duration:.3s;animation-name:zoomIn;animation-duration:.3s;}' +
                '@-webkit-keyframes zoomOut{from{opacity:1;}50%{opacity:0;-webkit-transform:scale3d(.3,.3,.3);transform:scale3d(.3,.3,.3);}to{opacity:0;}}@keyframes zoomOut{from{opacity:1;}50%{opacity:0;-webkit-transform:scale3d(.3,.3,.3);transform:scale3d(.3,.3,.3);}to{opacity:0;}}.zoomOut{-webkit-animation-name:zoomOut;-webkit-animation-duration:.3s;animation-name:zoomOut;animation-duration:.3s;}' +
                '@-webkit-keyframes bounceInUp{from,60%,75%,90%,to{-webkit-animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000);animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000);}from{opacity:0;-webkit-transform:translate3d(0,3000px,0);transform:translate3d(0,3000px,0);}60%{opacity:1;-webkit-transform:translate3d(0,-20px,0);transform:translate3d(0,-20px,0);}75%{-webkit-transform:translate3d(0,10px,0);transform:translate3d(0,10px,0);}90%{-webkit-transform:translate3d(0,-5px,0);transform:translate3d(0,-5px,0);}to{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0);}}@keyframes bounceInUp{from,60%,75%,90%,to{-webkit-animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000);animation-timing-function:cubic-bezier(0.215,0.610,0.355,1.000);}from{opacity:0;-webkit-transform:translate3d(0,3000px,0);transform:translate3d(0,3000px,0);}60%{opacity:1;-webkit-transform:translate3d(0,-20px,0);transform:translate3d(0,-20px,0);}75%{-webkit-transform:translate3d(0,10px,0);transform:translate3d(0,10px,0);}90%{-webkit-transform:translate3d(0,-5px,0);transform:translate3d(0,-5px,0);}to{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0);}}.bounceInUp{-webkit-animation-name:bounceInUp;animation-name:bounceInUp;}' +
                '@-webkit-keyframes bounceOutDown{20%{-webkit-transform:translate3d(0,10px,0);transform:translate3d(0,10px,0);}40%,45%{opacity:1;-webkit-transform:translate3d(0,-20px,0);transform:translate3d(0,-20px,0);}to{opacity:0;-webkit-transform:translate3d(0,2000px,0);transform:translate3d(0,2000px,0);}}@keyframes bounceOutDown{20%{-webkit-transform:translate3d(0,10px,0);transform:translate3d(0,10px,0);}40%,45%{opacity:1;-webkit-transform:translate3d(0,-20px,0);transform:translate3d(0,-20px,0);}to{opacity:0;-webkit-transform:translate3d(0,2000px,0);transform:translate3d(0,2000px,0);}}.bounceOutDown{-webkit-animation-name:bounceOutDown;animation-name:bounceOutDown;}';
            if ($(".modalsBg").length == 0) {
                $("body").append(mask + boxcontain);
                $("head").append("<style type='text/css'>" + cssCode + cssAnimate + "</style>"); //cssCode
            }
            else {
                $(".modal").remove();
                $("body").append(boxcontain);
            }
            if (options.top != "" && options.top != 'undefined') {
                $(".modal").css("top", options.top);
            }

            if ($(window).width() > parseInt(options.width)) {
                $(".modal").css("width", options.width);
                $(".modal").css("left", options.left);
            }
            else {
                $(".modal").css("width", $(window).width() - 40 + "px");
                $(".modal").css("left", "20px");
            }
            var height = $(".modal").height();
            var width = $(".modal").width();
            $(".modalsBg").css("height", $("body").height() > $(window).height() ? $("body").height() : $(window).height() + "px");
            $(".modalsBg").css("display", "block");
            if (options.animated == "zoomIn") {
                $(".modal").removeClass("zoomOut animated");
                $(".modal").addClass("zoomIn animated");
            }
            else if (options.animated == "bounceInUp") {
                $(".modal").removeClass("bounceOutDown animated");
                $(".modal").addClass("bounceInUp animated");
            }
            isOpenScroll(options.jinzhi);
            if (options.url != "" && options.url != 'undefined') {
                loadEvents();
            }
            else {
                if (options.title != "") {
                    $(".modal-title").html(options.title);
                }
                if (options.content != "" && options.content != 'undefined') {
                    $(".modal-body").html(options.content);
                    if (options.scroll)
                        var myScroll = new IScroll('#scroll-wrapper', { mouseWheel: true, click: true, useTransform: false });
                }
                if (options.bottom != "" && options.bottom != 'undefined') {
                    var fhtml = "";
                    for (var i = 0; i < options.bottom.length; i++) {
                        fhtml += '<a class="' + options.bottom[i].classs + '" href="javascript:' + options.bottom[i].click + ';">' + options.bottom[i].name + '</a>'
                    }
                    $(".modal-footer").html(fhtml);
                }
            }
            //关闭事件
//            $(".modalsBg,.close").click(function () {
                $(".close").click(function () {
                if (options.animated == "zoomIn") {
                    $(".modal").removeClass("zoomIn animated");
                    $(".modal").addClass("zoomOut animated");
                }
                else if (options.animated == "bounceInUp") {
                    $(".modal").removeClass("bounceInUp animated");
                    $(".modal").addClass("bounceOutDown animated");
                }
                setTimeout(function () {
                    $(".modal").css("top", "10000px");
                    $(".modalsBg").css("display", "none");
                    $(".modal").removeClass("zoomOut animated");
                    $(".modal").removeClass("bounceOutDown animated");
                }, 300);
                isOpenScroll(1);
            })
            //异步加载事件
            function loadEvents() {
                $(".modal-body").html("<div class='spinner'></div><br /><span>正在加载中...</span>");
                $.ajax({
                    url: options.url,
                    async: true,
                    success: function (result) {
                        if (options.title != "") {
                            $(".modal-title").html(options.title);
                        }
                        $(".modal-body").html(result);
                        var myScroll = new IScroll('#scroll-wrapper', { mouseWheel: true, click: true });
                        if (options.bottom != "" && options.bottom != 'undefined') {
                            var fhtml = "";
                            for (var i = 0; i < options.bottom.length; i++) {
                                fhtml += '<a class="' + options.bottom[i].classs + '" href="javascript:' + options.bottom[i].click + ';">' + options.bottom[i].name + '</a>'
                            }
                            $(".modal-footer").html(fhtml);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $(".modal-body").html(textStatus);
                        if (options.scroll)
                            var myScroll = new IScroll('#scroll-wrapper', { mouseWheel: true, click: true });
                    }
                });
            }
        },
        //关闭事件调用
        close: function (options) {
            options = $.extend({
                callback: null,
                animated: "zoomIn"
            }, options);
            if (options.animated == "zoomIn") {
                $(".modal").removeClass("zoomIn animated");
                $(".modal").addClass("zoomOut animated");
            }
            else if (options.animated == "bounceInUp") {
                $(".modal").removeClass("bounceInUp animated");
                $(".modal").addClass("bounceOutDown animated");
            }
            setTimeout(function () {
                $(".modal").css("top", "10000px");
                $(".modalsBg").css("display", "none");
                $(".modal").removeClass("zoomOut animated");
                $(".modal").removeClass("bounceOutDown animated");
            }, 300);
            isOpenScroll(1);
            if (options.callback != null) {
                options.callback();
            }
        }
    });
    //页面是否可以滚动
    function isOpenScroll(jz) {
        //0 不可以滚动 1可以滚动
        document.addEventListener("touchmove", function (e) {
            if (jz == 0) {
                e.preventDefault();
                e.stopPropagation();
            }
        }, false);
    }
})(jQuery);