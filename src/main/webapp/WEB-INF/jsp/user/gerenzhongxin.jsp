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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="author" content="www.34580.com">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable">

    <meta name="viewport"
          content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">
    <title>橘子屋</title>
    <link rel="icon" type="image/x-icon" href="<%=basePath%>favicon.ico">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/cart_check.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <script src="<%=basePath%>fontpage/js/hm.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>fontpage/js/jquery.cookie.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-impromptu.min.js"></script>

    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "js/hm.js";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

    <!--<script type="text/javascript" async="async" charset="utf-8" src="https://dl.ntalker.com/js/xn6/zh_cn.js?siteid=kf_9300&amp;v=nt6.8.6&amp;t=2017.03.28_032203" data-requiremodule="lang"></script>
    <script type="text/javascript" async="async" charset="utf-8" src="https://dl.ntalker.com/js/xn6/chat.in.js?siteid=kf_9300&amp;v=nt6.8.6&amp;t=2017.03.28_032203" data-requiremodule="chatManage"></script>
    <script type="text/javascript" async="async" charset="utf-8" src="https://dl.ntalker.com/js/xn6/mqtt31.js?siteid=kf_9300&amp;v=nt6.8.6&amp;t=2017.03.28_032203" data-requiremodule="MQTT"></script>
    <script type="text/javascript" async="async" charset="utf-8" src="https://dl.ntalker.com/js/xn6/mqtt.chat.js?siteid=kf_9300&amp;v=nt6.8.6&amp;t=2017.03.28_032203" data-requiremodule="Connection"></script>-->
</head>
<body>
<div id="nTalk_post_hiddenElement"
     style="left: -10px; top: -10px; visibility: hidden; display: none; width: 1px; height: 1px;"></div>

<div class="container" id="container">
    <div class="wrapper">
        <div id="minHeight">
            <style>
                .step6 .s-item .user-vip .vip-speed div.right {
                    -moz-border-radius-topright: 10px;
                    -moz-border-radius-bottomright: 10px;
                    -webkit-border-bottom-right-radius: 10px;
                    -webkit-border-top-right-radius: 10px;
                    border-bottom-right-radius: 10px;
                    border-top-right-radius: 10px;
                }
            </style>
            <div class="container" id="container">
                <div class="wrapper">
                    <div id="minHeight">
                        <div class="header">
                            <a href="javascript:history.back(-1)">
                                <img src="<%=basePath%>fontpage/images/zuojiantou.png">
                            </a>
                            <div>
                                我的
                            </div>
                        </div>
                        <div class="common-wrapper">
                            <!-- 头部 -->
                            <div class="step6 border-1px step3-more">
                                <a href="<%=basePath%>user/toInfo" class="gxqm">
                                    <div class="s-item">
                                        <div class="sitem-t">
                                            <div class="user-header">
                                                <img src="<%=basePath%>fontpage/img/yonghutouxiang.png" height="50" width="50"
                                                     style="margin: 3px 0 0 5px;">
                                            </div>
                                            <div class="user-list">
                                                <p>${sessionScope.user.nickname}</p>
                                                <%--<p>个性签名:这个家伙很懒 没有留下什么!</p>--%>
                                            </div>
                                            <!--<div class="user-vip">
                                                <div class="vip-speed">
                                                    <div style="width:7%; margin-top:-1px;">
                                                        <span style="width: 100px;display: block;font-size:7px;">VIP1:0%</span>
                                                    </div>
                                                </div>
                                            </div>-->

                                            <span class="s-point"></span>

                                        </div>
                                    </div>
                                </a>
                                <div class="sitem-b">
                                    <ul>
                                        <li>
                                            <a href="<%=basePath%>order/toMyOrder">
                                                <p class="txt_figure">
                                                    <c:if test="${not empty count.get('o1')}">
                                                        ${count.get("o1")}
                                                    </c:if>
                                                    <c:if test="${empty count.get('o1')}">
                                                        0
                                                    </c:if>
                                                </p>
                                                <p class="txt_explain">
                                                    待付款
                                                </p>
                                            </a>
                                            <div class="ybk"></div>
                                        </li>

                                        <li>
                                            <a href="<%=basePath%>order/toMyOrder">
                                                <p class="txt_figure">
                                                    <c:if test="${not empty count.get('o0')}">
                                                        ${count.get("o0")}
                                                    </c:if>
                                                    <c:if test="${empty count.get('o0')}">
                                                        0
                                                    </c:if>
                                                </p>
                                                <p class="txt_explain">
                                                    待审核
                                                </p>
                                            </a>
                                            <div class="ybk"></div>
                                        </li>
                                        <li>
                                            <a href="<%=basePath%>order/toMyOrder">
                                                <p class="txt_figure">
                                                    <c:if test="${not empty count.get('o3')}">
                                                        ${count.get("o3")}
                                                    </c:if>
                                                    <c:if test="${empty count.get('o3')}">
                                                        0
                                                    </c:if>
                                                </p>
                                                <p class="txt_explain">
                                                    待收货
                                                </p>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- END 头部 -->
                            <!-- 我的订单 -->
                            <div class="step7 border-1px">
                                <a href="<%=basePath%>order/toMyOrder" class="s-href">
                                    <div class="s-item bdb-1px">
                                        <div class="sitem-l">
                                            <i class="sitem-icon">
                                                <img src="<%=basePath%>fontpage/img/cell_order.png" width="44" height="44">
                                            </i>
                                            <span>我的订单</span>
                                        </div>
                                        <div class="sitem-r">
                                            查看全部订单
                                        </div>
                                        <span class="s-point" style="top: 25%;"></span>
                                    </div>
                                </a>
                            </div>
                            <div class="step7 border-1px">
                                <a href="<%=basePath%>user/toInfo" class="s-href">
                                    <div class="s-item bdb-1px">
                                        <div class="sitem-l">
                                            <i class="sitem-icon">
                                                <img src="<%=basePath%>fontpage/img/cell_set.png" width="44" height="44">
                                            </i>
                                            <span>个人资料</span>
                                        </div>
                                        <div class="sitem-r">
                                            个人资料修改
                                        </div>
                                        <span class="s-point" style="top: 25%;"></span>
                                    </div>
                                </a>
                            </div>
                            <div class="step7 border-1px">
                                <a href="<%=basePath%>user/toAddress" class="s-href">
                                    <div class="s-item bdb-1px">
                                        <div class="sitem-l">
                                            <i class="sitem-icon">
                                                <img src="<%=basePath%>fontpage/img/cell_adress.png" width="44" height="44">
                                            </i>
                                            <span>收货地址</span>
                                        </div>
                                        <div class="sitem-r">
                                            收货地址管理
                                        </div>
                                        <span class="s-point" style="top: 25%;"></span>
                                    </div>
                                </a>
                            </div>
                            <div class="step7 border-1px">
                                <a class="s-href" href="<%=basePath%>user/toAlterPass">
                                    <div class="s-item bdb-1px">
                                        <div class="sitem-l">
                                            <i class="sitem-icon">
                                                <img src="<%=basePath%>fontpage/img/xougaimima.png" width="30px" height="30px"
                                                     style="margin: 7px;">
                                            </i>
                                            <span>修改密码</span>
                                        </div>
                                        <div class="sitem-r">
                                            修改账号密码
                                        </div>
                                        <span class="s-point" style="top: 25%;"></span>
                                    </div>
                                </a>
                            </div>
                            <div class="step7 border-1px">
                                <a class="s-href" href="<%=basePath%>user/toContact">
                                    <div class="s-item bdb-1px">
                                        <div class="sitem-l">
                                            <i class="sitem-icon">
                                                <img src="<%=basePath%>fontpage/img/cell_service.png" width="44px" height="44px">
                                            </i>
                                            <span>关于我们</span>
                                        </div>
                                        <div class="sitem-r">
                                            关于橘子屋
                                        </div>
                                        <span class="s-point" style="top: 25%;"></span>
                                    </div>
                                </a>
                            </div>
                            <div class="step7 border-1px">
                                <a href="<%=basePath%>login/UserSignOut" class="s-href">
                                    <div class="s-item bdb-1px">
                                        <div class="sitem-l">
                                            <i class="sitem-icon">
                                                <img src="<%=basePath%>fontpage/img/cell_info.png" width="44px" height="44px">
                                            </i>
                                            <span>退出账号</span>
                                        </div>
                                        <div class="sitem-r">
                                            退出切换账号
                                        </div>
                                        <span class="s-point" style="top: 25%;"></span>
                                    </div>
                                </a>
                            </div>
                            <div style="width: 100%;height: 40px;margin-top:20px;"></div>

                        </div>
                    </div>
                </div>
            </div>

            <script>
                $(function () {
                    if (true) {
                        $("#f5").html('<img src="<%=basePath%>fontpage/images/user1.png">');
                        $("#t5").css("color", "#ee4b02");
                    }

                    //sgListInit();//水果类加载
                });
                $(function () {
                    var num = 0;
                    try {
                        var city = JSON.parse(localStorage.getItem("good_info0"))
                        var now_city = '苏州市';
                        if (city['city'] != now_city) {/*当前城市 不等于所存储的城市信息.清空localStorage*/
                            localStorage.clear();
                        }

                        if (localStorage.num == undefined) {
                            num = 0;
                        }
                        else {
                            num = parseInt(localStorage.num);
                            num = parseInt(num) + parseInt(1);
                        }
                        $("#local_num").html(num);

                    }
                    catch (e) {
                        $("#local_num").html('');
                        //alert("您处于无痕浏览，无法为您保存浏览记录");
                    }

                });
            </script>

        </div>
    </div>
</div>
<!--    <div class="index_foot_fg"> </div>-->

<jsp:include page="footer.jsp"></jsp:include>

<!--<script>
    $(function () {
        if (!is_login()) {

            $.prompt("请先登录", {
                buttons: { "确定": true },
                submit: function (e, v, m, f) {
                    if (v == true) {
                        window.location.href = '/User/Login/';
                        return;
                    }
                }
            });
        } else {
            $.ajax({
                url: "/Cart/GoodsCout/",
                type: 'post',
                dataType: 'json',
                data: {},
                success: function (data) {
                    if (data.Statu == 1) {
                        $("#f5").html('<img src="img/tabbar_user_o.png" width="30" height="30">');
                    }
                },
            });

            if (true) {

                $("#f5").html('<img src="img/tabbar_user_o.png" width="30" height="30">');
                $("#t5").css("color", "#009900");
            }
        }
    });
    //判断当前是否登录
    function is_login() {
        var login = 'False';
        if (login == "False") {
            return false;
        } else {
            return true;
        }
    }

</script>-->
</body>
</html>
