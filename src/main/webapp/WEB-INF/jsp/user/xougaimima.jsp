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
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">
    <title>橘子屋</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/cart_check.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/animate.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css">
    <script src="<%=basePath%>fontpage/js/iscroll.js"></script>
    <script src="<%=basePath%>fontpage/js/small.function.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-1.10.1.min.js"></script>
    <script src="<%=basePath%>fontpage/js/modal.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-impromptu.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css">
    <script type="text/javascript">
        $(function () {
            $(".returntop").click(function () {
                $('body,html').animate({ scrollTop: 0 }, 1000);
            });
            var height = document.getElementById("container").offsetHeight;
            if (height <= 568) {
                $("#minHeight").addClass('minHeight');
                $(".returntop").hide();
            }
        });
    </script>
</head>
<body>
    <div class="container" id="container">
        <div class="wrapper">
            <div id="minHeight" class="minHeight">
                <div class="header">
			<a href="javascript:history.back(-1)">
				<img src="<%=basePath%>fontpage/images/zuojiantou.png">
			</a>
			<div>
			修改密码
			</div>
		</div>
		<form action="" method="post">
                <div class="common-wrapper mbNone">
                    <div class="common-body">
                        <div class="step4 border-1px">
                            <div class="s-item bdb-1px">
                                <div class="sitem-r">
                                    <input type="password" class="w8" id="oPwd" placeholder="旧密码">
                                </div>
                            </div>
                            <div class="s-item bdb-1px">
                                <div class="sitem-r">
                                    <input type="password" class="w8" id="pwd" placeholder="新密码">
                                </div>
                            </div>
                            <div class="s-item">
                                <div class="sitem-r">
                                    <input type="password" class="w8" id="repwd" placeholder="确认新密码">
                                </div>
                            </div>
                        </div>
                        <div class="f_btn" style="margin-top:20px;">
                            修改密码
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {

            function checkPwd(pwd, repwd) {
                if (pwd == repwd) {
                    return true;
                } else {
                    return false;
                }
            }
            var click = 0
            $(".f_btn").click(function () {

                if (click == 1) {
                    return;
                }
                click = 1;
                var oPwd = $.trim($("#oPwd").val());
                var pwd = $.trim($("#pwd").val());
                var repwd = $.trim($("#repwd").val());
                if (oPwd != '' && pwd != '' && checkPwd(pwd, repwd)) {
                    if (oPwd.length < 6 || oPwd.length > 16) {
                        $.modal({ title: '提示信息', content: "密码长度为6-16位", top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
                        click = 0;
                    }
                    else if (pwd.length < 6 || pwd.length > 16) {
                        $.modal({ title: '提示信息', content: "密码长度为6-16位", top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
                        click = 0;
                    }
                    else {
                        $.ajax({
                            url: '../user/alterPass',
                            type: 'post',
                            data: {
                                oldPass: oPwd,
                                newPass: pwd
                            },
                            dataType: 'json',
                            success: function (data) {
                                if (data.status == 0) {
                                    //$.modal({ title: '提示信息', content: data.msg, top: '20%', bottom: [{ name: '确定', click: 'go_index()', classs: 'btn-ios-default' }] });
                                    $.prompt(data.msg, {
                                        buttons: { "确定": true }
                                    });
                                    window.location.href = "<%=basePath%>user/toCenter";
                                } else {
                                    //$.modal({ title: '提示信息', content: data.msg, top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
                                    $.prompt(data.Msg, {
                                        buttons: { "确定": true }
                                    });
                                    click = 0;
                                }
                            }
                        });
                    }
                } else {
                    if (oPwd == '') {
                        $.modal({ title: '提示信息', content: '旧密码不能为空', top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
                    } else if (pwd == '' || repwd == '') {
                        $.modal({ title: '提示信息', content: '请将信息填写完整', top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
                    } else if (!checkPwd(pwd, repwd)) {
                        $.modal({ title: '提示信息', content: '密码不一致', top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
                    }
                    click = 0;
                }
            })
        })
        function go_index() {
            window.location.href = '<%=basePath%>user/toCenter';
        }
    </script>
</body>
</html>
