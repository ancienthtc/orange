<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="author" content="www.34580.com"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="format-detection" content="telephone=no"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta name="viewport"
          content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height"/>
    <title>橘子屋</title>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css"/>

    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css"/>
    <script src="<%=basePath%>fontpage/js/jquery-1.7.1.min.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-impromptu.min.js"></script>
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?9009849caed7e6fee87308f63a777730";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
    <script type="text/javascript" src="<%=basePath%>fontpage/js/jquery.cookie.js"></script>
</head>
<body>
<div class="sy_header">
    <a href="<%=basePath%>user/toShopIndex">
        <img src="<%=basePath%>fontpage/img/juziwu.png" class="logo">
    </a>
    <input type="text" name="" id="search-key" value="" placeholder="搜索商品"/>
    <a id="search"><img src="<%=basePath%>fontpage/img/sousuo.png" class="suosou"/></a>
</div>
<div class="container" id="container">
    <div class="wrapper">
        <div id="minHeight">
            <link href="<%=basePath%>fontpage/css/swiper.min.css" rel="stylesheet"/>
            <script src="<%=basePath%>fontpage/js/swiper.jquery.min.js"></script><!-- 轮播图JS-->
            <!--<div class="banner_logo" style="background:white;">
                <div class="index_logo" style=" width: 96%">
                    <a class="index_head_a1">
                        <img style=" margin-top: 8px;" src="img/juziwu.png" width="130" height="45" />
                    </a>
                    <a href="/Goods/Index/" class="index_head_a2">
                        <img src="img/navbar_search2x.png" width="25" />
                    </a>
                </div>
            </div>-->
            <div class="index_max_width" style="max-width: 640px; min-width: 320px;">
                <div class="slider main_visual">
                    <!-- star 轮播图 -->
                    <div class="swiper-container">
                        <div class="swiper-wrapper">

                            <c:if test="${figure!=null}">
                                <c:forEach var="i" items="${figure}">
                                    <div class="swiper-slide">
                                        <a href="javascript:;"><img src="<%=basePath%>image/show?pic=${i.filename}"></a>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${figure ==null}">
                                <div class="swiper-slide">
                                    <a href="javascript:;"><img src="<%=basePath%>fontpage/img/rixi1.jpg"></a>
                                </div>

                                <div class="swiper-slide">
                                    <a href="javascript:;"><img src="<%=basePath%>fontpage/img/rixi2.jpg"></a>
                                </div>
                                <div class="swiper-slide">
                                    <a href="javascript:;"><img src="<%=basePath%>fontpage/img/rixi5.jpg"></a>
                                </div>

                                <div class="swiper-slide">
                                    <a href="javascript:;"><img src="<%=basePath%>fontpage/img/banner06.jpg"></a>
                                </div>
                            </c:if>

                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                    <!-- end 轮播图 -->
                </div>
                <!--index-main-->
                <div>
                    <!--limit time top 10 in main-->
                    <script src="<%=basePath%>fontpage/js/limittime.js"></script>


                    <script type="text/javascript">


                        $(function () {
                            var endTime = Date.parse($("#limitTime").val()) / 1000;

                            count_time(endTime);   // 限时抢购倒计时
                        });

                    </script>
                </div>


                <div class="index_user_center" style="display:block;">

                    <c:if test="${not empty parts}">
                        <c:forEach var="i" varStatus="s" items="${parts}">

                            <div class="index_u">
                                <a href="<%=basePath%>goods/toGoodsListPage?pid=${i.id}">
                                    <div style="background:#FE5400;">
                                        <img src="<%=basePath%>fontpage/images/qita.png">
                                    </div>
                                    <span>${i.name}</span>
                                </a>
                            </div>

                        </c:forEach>
                    </c:if>



                    <!-- -->
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#FE5400;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/mianbao.png">--%>
                            <%--</div>--%>

                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#1ccfa4;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/shengxian.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#F22451;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/danbaizhi.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#992ad4;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/yiban.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u_t1">面包</div>--%>
                    <%--<div class="index_u_t1">生鲜</div>--%>
                    <%--<div class="index_u_t1">常用</div>--%>
                    <%--<div class="index_u_t1">一般</div>--%>

                    <!-- -->
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#59da3f;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/lengdong.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#23b658;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/xxian.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#ffc526;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/yinliao.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#00adee;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/jiushui.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u_t1"> 冷冻</div>--%>
                    <%--<div class="index_u_t1">休闲</div>--%>
                    <%--<div class="index_u_t1">饮料</div>--%>
                    <%--<div class="index_u_t1">酒类</div>--%>

                    <!-- -->
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#ee4b02;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/zhahuo.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#f26d5f;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/yinger.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#ea9518;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/xuexiao.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u">--%>
                        <%--<a href="feilei.php">--%>
                            <%--<div style="background:#ff395c;">--%>
                                <%--<img src="<%=basePath%>fontpage/images/qita.png">--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</div>--%>
                    <%--<div class="index_u_t1">杂货</div>--%>
                    <%--<div class="index_u_t1">婴儿</div>--%>
                    <%--<div class="index_u_t1">学校</div>--%>
                    <%--<div class="index_u_t1">其他</div>--%>

                </div>

                <!--V3.3.1-->
                <%--<div class="index_user_center" style="display:block;">--%>

                <%--</div>--%>
                <%--<div class="index_user_center" style="display:block;">--%>

                <%--</div>--%>

                <div class="index_floor_list" style="display:none;">
                    <ul>

                        <li style="width: 100%;  border: none; position:relative;margin-top: 10px;">

                            <a href="/Content/good/lists/258">
                                <div><img src="<%=basePath%>fontpage/img/wkgkuljl6wsax8ataad0bivd-by768.jpg" width="100%" img_r="2.67"
                                          style=" margin-bottom: -6px;" class="img_r"></div>

                            </a>
                        </li>


                    </ul>
                </div>

                <!---蔬菜列表开始-->
                <!--<div class="index_floor_list">
                    <ul>
                        <li style="width: 100%;  border: none; position:relative;margin-top: 10px;">
                            <a href="#ganhuo">
                                <div><img src="img/蔬菜.jpg" width="100%" img_r="2.67" style="margin-bottom: -6px; height: 239.7px;" class="img_r"> </div>
                            </a>
                        </li>
                    </ul>
                </div>-->

                <div class="index_sale">
                    <div class="index_sale_z1" id="ganhuo">热销产品</div>
                    <div class="new">New</div>
                    <a href="chanpinliebiao.php">
                        <%--<div class="more">More</div>--%>
                    </a>
                </div>
                <div class="index_floor_list">
                    <ul id="ghList">

                        <c:forEach var="i" items="${hot}">
                            <a href="<%=basePath%>goods/toGoodsDetailPage?gid=${i.id}">
                                <li style="width: 33%; height: 120px;">
                                    <div class="index_floor_bk2">
                                        <div class="index_floor_list_d3">
                                            <img src="<%=basePath%>image/goods?pic=${i.pic1.substring( i.pic1.lastIndexOf("\\") + 1 )}" style="width:90px;height:90px;">
                                        </div>
                                        <div class="index_floor_list_d4" style="display:block;">
                                            <p class="index_floor_list_pa">${i.name}</p>
                                            <span class="index_floor_list_pb">￥${i.price}</span>
                                        </div>
                                    </div>
                                </li>
                            </a>
                        </c:forEach>
                    </ul>
                </div>
                <!---蔬菜类 商品列表结束-->

                <!---干活类 商品列表开始-->
                <!--<div class="index_floor_list">
                    <ul>
                        <li style="width: 100%;  border: none; position:relative;margin-top: 10px;">
                            <a href="#ganhuo">
                                <div><img src="img/干货.jpg" width="100%" img_r="2.67" style="margin-bottom: -6px; height: 239.7px;" class="img_r"> </div>
                            </a>
                        </li>
                    </ul>
                </div>-->

                <div class="index_sale">
                    <div class="index_sale_z1" id="ganhuo">推荐产品</div>
                    <div class="new">New</div>
                    <a href="chanpinliebiao.php">
                        <%--<div class="more">More</div>--%>
                    </a>
                </div>
                <div class="index_floor_list">
                    <ul id="ghList">
                        <c:forEach var="i" items="${recommend}">
                            <a href="<%=basePath%>goods/toGoodsDetailPage?gid=${i.id}">
                                <li style="width: 33%; height: 120px;">
                                    <div class="index_floor_bk2">
                                        <div class="index_floor_list_d3">
                                            <img src="<%=basePath%>image/goods?pic=${i.pic1.substring( i.pic1.lastIndexOf("\\") + 1 )}" style="width:90px;height:90px;">
                                        </div>
                                        <div class="index_floor_list_d4" style="display:block;">
                                            <p class="index_floor_list_pa">${i.name}</p>
                                            <span class="index_floor_list_pb">￥${i.price}</span>
                                        </div>
                                    </div>
                                </li>
                            </a>
                        </c:forEach>

                    </ul>
                </div>
                <!---干活类 商品列表结束-->
                <!---水果类 商品列表开始-->
                <div class="index_sale">
                    <div class="index_sale_z1" id="ganhuo">最新产品</div>
                    <div class="new">New</div>
                    <a href="chanpinliebiao.php">
                        <%--<div class="more">More</div>--%>
                    </a>
                </div>
                <div class="index_floor_list">
                    <ul id="ghList">

                        <c:forEach var="i" items="${newGoods}">
                            <a href="<%=basePath%>goods/toGoodsDetailPage?gid=${i.id}">
                                <li style="width: 33%; height: 120px;">
                                    <div class="index_floor_bk2">
                                        <div class="index_floor_list_d3">
                                            <img src="<%=basePath%>image/goods?pic=${i.pic1.substring( i.pic1.lastIndexOf("\\") + 1 )}" style="width:90px;height:90px;">
                                        </div>
                                        <div class="index_floor_list_d4" style="display:block;">
                                            <p class="index_floor_list_pa">${i.name}</p>
                                            <span class="index_floor_list_pb">￥${i.price}</span>
                                        </div>
                                    </div>
                                </li>
                            </a>
                        </c:forEach>
                    </ul>
                </div>
                <!---水产类 商品列表开始-->
                <div class="go_top" onclick="go_top()">
                    <img src="img/totop.png" width="50" height="50"/>
                </div>

            </div>

            <style>
                .time_bg_k {
                    position: absolute;
                    top: 0px;
                }

                .time_bg_title {
                    float: left;
                    font-size: 8px;
                    margin-top: 5px;
                    margin-left: 5px;
                    color: #99CC33;
                    display: block;
                    width: 16px;
                    line-height: 8px;
                }

                .time_bg {
                    float: left;
                    font-size: 14px;
                    display: block;
                    line-height: 18px;
                    font-weight: bold;
                    margin: 4px 0px 0px 0px;
                    border-radius: 5px;
                    width: 20px;
                    height: 18px;
                    background-color: #99CC33;
                    color: #fff;
                }

                .time_bg_dian {
                    margin-top: 5px;
                    text-align: center;
                    float: left;
                    font-size: 14px;
                    display: block;
                    line-height: 18px;
                    font-weight: bold;
                    width: 5px;
                    height: 18px;
                    color: #99CC33;
                }

                .time_bg_start {
                    background-color: #999;
                }

                .color_start {
                    color: #999;
                }

                .go_top {
                    position: fixed;
                    z-index: 10000;
                    bottom: 50px;
                    right: 20px;
                    display: none;
                }

                .index_time_list_waiceng {
                    position: relative;
                    z-index: 1;
                    top: 0px;
                    bottom: 48px;
                    left: 0;
                }
            </style>
            <script src="<%=basePath%>fontpage/js/iscroll.js"></script>
            <script type="text/javascript">

                var myScroll;

                function loaded() {
                    myScroll = new iScroll('wrapper', {adeScrollbars: false, vScroll: false, hScrollbar: false});
                }

                document.addEventListener('DOMContentLoaded', loaded, true);


                function each_time_bg() {

                    $(".time_bg_k").each(function () {

                        var statime = $(this).attr('statime');
                        var endtime = $(this).attr('endtime');

                        time_bg_k(statime, endtime, $(this));
                    });

                }


                function time_bg_k(statime, endtime, that) {   //首页活动倒计时 2016 08 25 zchuang

                    var time_overdue = 0;
                    var type = '';

                    if (statime <= 0) { //已经开始

                        time_overdue = endtime;
                        type = 'end';
                    } else {          //未开始

                        time_overdue = statime; //距离开始时间
                        type = 'start';
                    }

                    var timeout_run = setInterval(function () {


                        if (time_overdue > 0) {

                            var day = Math.floor(time_overdue / (3600 * 24));
                            var hour = Math.floor((time_overdue - day * 3600 * 24) / 3600);
                            var minute = Math.floor((time_overdue - day * 3600 * 24 - hour * 3600) / 60);
                            var second = Math.floor((time_overdue - day * 3600 * 24 - hour * 3600) - minute * 60);

                            time_overdue--;

                            if (day > 99) {
                                day = 99;
                            }
                            if (day <= 0) {
                                that.children('.D').hide();
                            } else {
                                that.children('.D').html(charLeftAll(day));
                            }

                            that.children('.H').html(charLeftAll(hour));
                            that.children('.I').html(charLeftAll(minute));
                            that.children('.S').html(charLeftAll(second));

                        } else {
                            if (type == 'start') {

                                time_overdue = endtime;
                                that.children('.time_bg').removeClass('time_bg_start');
                                that.children('.time_bg_title').removeClass('color_start');
                                that.children('.time_bg_title').removeClass('time_bg_dian');
                                that.children('.time_bg_title').html('距离结束');

                            } else {

                                clearInterval(timeout_run);
                                that.html('<span class="time_bg_title color_start">活动结束</span>');

                            }
                        }

                    }, 1000);


                }

                function open() {
                    $(".ad_modal").css("display", "block");
                    $(".ad-bg").css("display", "block");
                    $(".ad_modal").addClass("fadeIn");
                }

                function close_ad() {
                    $(".ad_modal").removeClass("fadeIn");
                    $(".ad-bg").css("display", "none");
                    $(".ad_modal").css("display", "none");
                }


                var mySwiper = new Swiper('.swiper-container', {
                    direction: 'horizontal',
                    autoplay: 5000, //可选选项，自动滑动
                    pagination: '.swiper-pagination', //分页器
                    loop: true,
                    setWrapperSize: true
                })


                var is = 0;

                function is_login(type, is_need_login) {

                    var is_login = false;

                    var c_url = '';
                    switch (type) {

                        case '1':
                            c_url = '/Content/my/order';
                            break;
                        case '2':
                            c_url = '/Content/my/qingsongtui';
                            break;
                        case '4':
                            c_url = '/Content/my/topUp';
                            break;
                        case '5':
                            c_url = 'http://sz.34580.com/Activities/songli/index.html?v=1.03';
                            break;
                        case '6':
                            c_url = '/Content/transfer/index?siteid=1';
                            break;
                        case '7':
                            c_url = '/Content/dachu/index?siteid=1';
                            break;
                        case '8':
                            var now_city = '苏州市';
                            if (now_city == '北京市') {
                                c_url = '/Content/my/red';
                            } else {
                                c_url = 'http://wechat-1.34580.com/reports';
                            }
                            break;
                        default:
                            c_url = '';
                    }

                    if (is_need_login) {

                        if (is == 1) {
                            return;
                        }
                        is = 1;
                        if (!is_login) {
                            $.prompt('请先登录', {
                                buttons: {"确定": true},
                                submit: function (e, v, m, f) {
                                    if (v == true) {
                                        go_login(c_url);
                                    }
                                }
                            });
                        } else {

                            if (c_url != '') {
                                window.location.href = c_url;
                            }
                        }

                    } else {

                        if (c_url != '') {
                            window.location.href = c_url;
                        }
                    }


                }


                $(function () {

                    each_time_bg(); //活动图片倒计时
                    //count_time();   // 限时抢购倒计时
                    img_ratio();


                    //$(".list_bg").click(function () {
                    //    $(".city_list,.list_bg").hide();
                    //});

                    //$('#appClose').click(function () {
                    //    $('.download-tips').hide();
                    //    $.cookie("downloadTip", 1, { expires: 1000000, path: '/' });
                    //});

                    //search
                    $("#searchBtn").click(function () {
                        var keyword = $("#searchcon").val();
                        window.location.href = "/Goods/Index?keyword=" + keyword;
                    });


                    //var isq = 0;
                    //$("#checkIn").click(function () {
                    //    window.location.href = "/Content/signin/index/index";
                    //});

                });


                //function count_time() {
                //    var StartTime = 1491701400;
                //    var endTime = 1491753599;

                //    window.setInterval(function () {

                //        var now_time = Date.parse(new Date()) / 1000;
                //        var time = endTime - now_time;

                //        if (now_time < StartTime) { //活动未开始
                //            $('.index_time_p2').html('09:30即将开始');
                //        } else if (now_time >= StartTime) {
                //            $('.index_time_p2').html('剩余 <input type="button" class="index_time_bu1" value="00" id="hour">:<input type="button" class="index_time_bu1" value="00" id="minute">:<input type="button" class="index_time_bu1" value="00" id="second">');
                //        } else if (now_time >= endTime) {
                //            $('.index_time_p2').html('活动已结束');
                //        }

                //        ShowCountDown(time--);

                //    }, 1000);

                //}

                //function ShowCountDown(data) {

                //    var time = data;
                //    var leftsecond = parseInt(time);
                //    var day1 = Math.floor(leftsecond / (60 * 60 * 24));
                //    var hour = Math.floor((leftsecond - day1 * 24 * 60 * 60) / 3600);
                //    var minute = Math.floor((leftsecond - day1 * 24 * 60 * 60 - hour * 3600) / 60);
                //    var second = Math.floor(leftsecond - day1 * 24 * 60 * 60 - hour * 3600 - minute * 60);
                //    $("#hour").val(charLeftAll(hour));
                //    $("#minute").val(charLeftAll(minute));
                //    $("#second").val(charLeftAll(second));

                //}
                //function charLeftAll(n) {
                //    if (n < 10)
                //        return "0" + n;
                //    else
                //        return n;
                //}

                function go_login(redirect_url) {
                    $.cookie("ret_url", redirect_url, {expires: 1, path: '/'});
                    window.location.href = '/User/Login/';

                }

                function img_ratio() {

                    var sw = $(window).width();
                    if (sw > 640) {
                        sw = 640;
                    }

                    $('.img_r').each(function () {
                        var imgr = $(this).attr('img_r');

                        if (imgr != 0 && imgr != '' && imgr != undefined) {
                            $(this).css({'height': sw / imgr});
                        }

                    });
                }

                function go_top() {

                    $('body,html').animate({scrollTop: 0}, 1000);
                }

                var t_top = 0;
                window.onscroll = function () {

                    t_top = document.body.scrollTop;
                    if (t_top > 800) {
                        $('.go_top').show();
                    } else {
                        $('.go_top').hide();
                    }

                }
            </script>

        </div>
    </div>
</div>


<div class="index_foot_fg"></div>

<jsp:include page="footer.jsp"></jsp:include>

<script>

    $("#search").click(function () {
        var key = $("#search-key").val();
        window.location.href = "<%=basePath%>goods/toGoodsListPage?type=5&&keys="+key;
    });

</script>

<script>
    $(function () {
        //$.post('/Content/welcome/cart_num',
        //{}, function (data) {
        //    if (data.cart_count == 1) {

        //        $("#f4").html('<img src="img/tabbar_cart_n_f.png" width="30" height="30">');
        //    }
        //}, 'json');

        if (true) {

            $("#f1").html('<img src="<%=basePath%>fontpage/img/shouye1.png" width="30" height="30">');
            $("#t1").css("color", "#ee4b02");
        }

        //sgListInit();//水果类加载
    });

    //干货类加载
    function ghListInit() {
        $.ajax({
            url: "/Cart/GoodsCout/",
            type: "GET",
            data: {},
            dataType: "json",
            success: function (data) {
                debugger
                if (data.Statu == 1) {
                    $("#cart_sum").show();
                    //$("#cart_sum").html(data.Msg);
                } else {
                    $.prompt(data.Msg, {
                        buttons: {"确定": true}
                    });
                    _self.html('登录');
                }
            },
            error: function () {

            }
        });
    }

    //水果类加载
    function sgListInit() {
        $.post("/Goods/SGListLoad/", {type: "2"}, function (data) {
            jQuery("#sgList").html(data);

        });
    }
</script>

</body>
</html>
