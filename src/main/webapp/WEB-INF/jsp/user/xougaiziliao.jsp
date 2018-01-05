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
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>橘子屋</title>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/font_1459473269_4751618.css">
    <link href="<%=basePath%>fontpage/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>fontpage/css/xougaiziliao.css" rel="stylesheet">
    <script src="<%=basePath%>fontpage/js/jquery.min.js"></script>
    <script src="<%=basePath%>fontpage/js/bootstrap.min.js"></script>
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/menu_elastic.css"/>
    <script src="<%=basePath%>fontpage/js/snap.svg-min.js"></script>
    <script src="<%=basePath%>fontpage/js/common.js"></script>
    <script src="<%=basePath%>fontpage/js/Popt.js"></script>
    <script src="<%=basePath%>fontpage/js/cityJson.js"></script>
    <script src="<%=basePath%>fontpage/js/citySet.js"></script>
    <!--[if IE]>
    <script src="<%=basePath%>fontpage/js/html5.js"></script>
    <![endif]-->
</head>
<body class="huibg">
<div class="header">
    <a href="javascript:history.back(-1)">
        <img src="<%=basePath%>fontpage/images/zuojiantou.png">
    </a>
    <div>
        个人资料
    </div>
</div>
<!--<div class="menu-wrap">
<nav class="menu">
<div class="icon-list">
<a href="index.html"><i class="iconfont icon-home"></i><span>首页</span></a>
<a href="personalcenter.html"><i class="iconfont icon-yonghux"></i><span>个人中心</span></a>
<a href="ddcenter.html"><i class="iconfont icon-liebiao"></i><span>订单中心</span></a>
<a href="userinfo.html"><i class="iconfont icon-xitongmingpian"></i><span>个人信息</span></a>
<a href="dizhi.html"><i class="iconfont icon-dizhi"></i><span>地址信息</span></a>
</div>
</nav>
<button class="close-button" id="close-button">Close Menu</button>
<div class="morph-shape" id="morph-shape" data-morph-open="M-1,0h101c0,0,0-1,0,395c0,404,0,405,0,405H-1V0z">
<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 100 800" preserveAspectRatio="none">
<path d="M-1,0h101c0,0-97.833,153.603-97.833,396.167C2.167,627.579,100,800,100,800H-1V0z"/>
</svg>
</div>
</div>
<nav class="navbar text-center">
<button class="topleft" onclick ="javascript:history.go(-1);"><span class="iconfont icon-fanhui"></span></button>
<a class="navbar-tit center-block">个人信息</a>
<button class="topnav" id="open-button"><span class="iconfont icon-1"></span></button>
</nav>-->

<div class="usercenter  accdv">

    <div class="row">
        <div class="col-md-2">
            昵称：
        </div>
        <div class="col-md-10">
            <input type="text" name="" id="" class="form-control" placeholder="请输入昵称">
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            性别：
        </div>
        <div class="col-md-10">
            <label class="checkbox-inline">
                <input type="radio" name="optionsRadiosinline" id="optionsRadios3"
                       value="option1" checked>
                男 </label>
            <label class="checkbox-inline">
                <input type="radio" name="optionsRadiosinline" id="optionsRadios4"
                       value="option2">
                女 </label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            手机号：
        </div>
        <div class="col-md-10">
            <input type="text" class="form-control" placeholder="请输入11位手机号码">
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            邮箱：
        </div>
        <div class="col-md-10">
            <input type="text" class="form-control" placeholder="请输入邮箱">
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            所在地：
        </div>
        <div class="col-md-10">
            <div data-role="page" id="test">
                <div class="ui-content">
                    <ul data-role="listview">
                        <li id="city">
                            <span style="color:#555;">请选择所在地区</span>
                        </li>
                    </ul>
                </div>
                <script type="text/javascript">
                    $("#city").click(function (e) {
                        SelCity(this, e);
                        console.log(this);
                    });
                </script>
            </div>
            <div class="form-group m-r-10">
                <input type="text" name="" id="" class="form-control" placeholder="例如:九华镇景秀花苑8幢406室">
            </div>
        </div>
    </div>
    <!--<div class="row">
        <div class="col-md-2">
            生日：
        </div>
        <div class="col-md-10">
            <input type="text" name="" id="" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            个人描述
        </div>
        <div class="col-md-10">
            <textarea class="form-control" rows="3"></textarea>
</div>			</div>-->
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-10">
            <button type="button" class="btn btn-danger btn-block btn-lg">
                确 定
            </button>
        </div>
    </div>
</div>

<script src="<%=basePath%>fontpage/js/classie.js"></script>
<script src="<%=basePath%>fontpage/js/main3.js"></script>
</body>
</html>