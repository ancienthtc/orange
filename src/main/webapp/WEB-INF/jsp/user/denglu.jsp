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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="www.34580.com" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="format-detection" content="telephone=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <link href="/Content/assets/images/favicon.ico" rel="shortcut icon">
    <title>登录</title>
    <link rel="icon" type="image/x-icon" href="<%=basePath%>favicon.ico">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link href="<%=basePath%>fontpage/css/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css" />
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css" />
    <script src="<%=basePath%>fontpage/js/jquery-1.10.1.min.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-impromptu.min.js"></script>
</head>
<body>
    <div class="container" id="container">
        <div class="wrapper">
            <div id="minHeight" class="minHeight">
                <div class="wrapper">
                   <div class="header">
			<a href="javascript:history.back(-1)">
				<img src="<%=basePath%>fontpage/images/zuojiantou.png">
			</a>
			<div>
			登录
			</div>
		</div>
                    <div class="main_body">
                        <div class="login">
                            <div id="login" name="login">
                                <div class="control-group">
                                    <input type="text" name="name" id="name" class="input-style1" placeholder="用户名/手机号" value="" />
                                </div>
                                <div class="control-group">
                                    <input type="password" name="pwd" id="pwd" class="input-style1" placeholder="请输入密码" />
                                </div>
                                <div class="control-group">
                                    <a is_click="0" id="submit" style="background:#ee4b02" onclick="go_login($(this))"  class="btn-style1">加载中..</a>
                               <!--onclick="go_login($(this))"-->
                                </div>
                            </div>
                            <div class="clearfix" style="padding:12px;">
                                <span class="fl"><a href="<%=basePath%>user/toForgetPass" class="freereg">找回登录密码</a></span>
                                <a href="<%=basePath%>login/toRegister" class="fr forget">免费注册</a>
                            </div>
                        </div>
                    </div>
                </div>
                <link href="<%=basePath%>fontpage/css/select_city.3.3.4.css" rel="stylesheet" />
                <script type="text/javascript">
                    var confirm = 0;
                    var isSending = 1;
                    function go_login(that) {

                        if (that.attr("is_click") == 0) {
                            return;
                        }

                        if (isSending > 1) /*防止重复点击*/ {
                            return false;
                        }
                        var _self = that;
                        var name = $.trim($("#name").val());
                        var pwd = $.trim($("#pwd").val());
                        //var bind = $.trim($("#bind:checked").val());
                        if (name != '' && pwd != '') {
                            if (pwd.length < 6 || pwd.length > 16) {
                                $.prompt("密码长度为6-16位", {
                                    buttons: { "确定": true }
                                });
                            }
                            else {
                                _self.html('正在登录中..');
                                isSending++;
                                $.ajax({
                                    url: "../login/UserLogin",
                                    type: 'post',
                                    data: { name: name, password: pwd },
                                    dataType: 'text',
                                    success: function (data) {
                                        debugger;
                                        if (data == "true" ) {
                                            window.location.href = "<%=basePath%>user/toCenter";
                                        } else {
                                            $.prompt("登录失败", {
                                                buttons: { "确定": true }
                                            });
                                            _self.html('登录');
                                            isSending = 1;
                                        }
                                    },
                                    error: function () {

                                    }
                                });
                            }
                        } else {
                            $.prompt("请将用户名和密码填写完整!", {
                                buttons: { "确定": true }
                            });
                        }
                    }
                    $(window).on('load', function () {
                        setTimeout(function () {
                            $("#submit").attr("is_click", "1");
                            $("#submit").css({ 'background': '#ee4b02' });
                            $("#submit").html("登录");
                        }, 100);
                    })
                </script>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        $(function () {

            $(".returntop").click(function () {
                $('body,html').animate({ scrollTop: 0 }, 1000);
            });
            var height = document.getElementById("container").offsetHeight;
            if (height >= 568) {
                $("#minHeight").removeClass('minHeight');
                $(".returntop").show();
            }
        });
    </script>
</body>
</html>
