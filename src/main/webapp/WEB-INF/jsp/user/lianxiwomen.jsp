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
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css">
    <script src="<%=basePath%>fontpage/js/jquery-1.10.1.min.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-impromptu.min.js"></script>
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
			联系我们
			</div>
		</div>
                <div class="main_body">
                    <div class="contact">
                        <div class="index-logo">
                            <!--<img src="img/logo.png" alt="" class="logo" style="display:none;">
                            <p>让新鲜触手可及</p>-->
                        </div>
                        <div style="text-align: center;padding:0 10px;" class="clearfix">
                            <div class="fl1">
                                <img src="<%=basePath%>fontpage/img/wx_servise.jpg" width="135" height="135">
                               <!-- <p>微信服务号</p>-->
                            </div>
                            <div class="fr" style="display:none;">
                                <img src="<%=basePath%>fontpage/img/wx_dingyue.jpg" width="135" height="135">
                                <p>&nbsp;</p>
                            </div>

                        </div>

                        <div class="box">
                            <ul>

                                <li class="list">
                                    服务时间：08：00--20：00
                                </li>
                                <li class="list">
                                    联系邮箱：<span style="font-size: 13px">642734212@qq.com</span>
                                </li>
                                <li class="list telbg">
                                    客服中心：152 9566 4746
                                </li>
                                <li class="list list-last" style="height:auto;line-height:20px;padding:10px">
                                    联系地址：苏州极鼎网络科技有限公司
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
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
