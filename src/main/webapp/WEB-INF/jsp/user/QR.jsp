<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/24
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>二维码</title>
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <!-- 移动设备支持 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link href="<%=basePath%>fontpage/css/mall.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=basePath%>fontpage/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>fontpage/js/jquery.Spinner.js"></script>
    <style>
        body {
            background: rgb(247, 247, 247);
        }

        .ewm {
            width: 95%;
            height: auto;
            margin: auto;
            display: table;
        }

        .ewm_1 {
            width: 100%;
            font-size: 16px;
            float: left;
        }

        .ewm_1 span {
            width: 100%;
            display: block;
            float: left;
            height: 30px;
            line-height: 32px;
            background: white;
        }

        .ewm_1 span:nth-child(1) {
            margin: 5% 0 3% 0;
        }

        .ewm_1 span:nth-child(2) {
        }

        .ewm_2 {
            width: 100%;
            height: 50px;
            float: left;
            background: white;
            margin: 10px 0 10px 0;
            font-family: "Microsoft Yahei", "微软雅黑", Arial, "宋体", "sans-serif"
        }

        .ewm_2 span {
            display: block;
            float: left;
            height: 50px;
            line-height: 50px;
            color: #f23030;
            font-size: 25px;
        }

        .ewm_2 span:nth-child(1) {
            font-size: 20px;
            text-align: right;
            width: 40%
        }

        .ewm_2 span:nth-child(2) {
            text-align: left;
            width: 60%;
            line-height: 54px;
        }

        .ewm_3 {
            width: 100%;
            float: left;
        }

        .ewm_3 img {
            width: 300px;
            height: 300px;
            margin: auto;
            display: block;
        }

        .ewm_3 span {
            width: 100%;
            height: 30px;
            line-height: 30px;
            text-align: center;
            display: block;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>
<div class="header">
    <a href="javascript:history.back(-1)">
        <img src="<%=basePath%>fontpage/images/zuojiantou.png">
    </a>
    <div>
        二维码
    </div>
</div>
<div class="ewm">

    <c:if test="${QR_URL != null}">
        <div class="ewm_1">
            <span>&nbsp;订单号:</span>
            <span>${oid}</span>
        </div>

        <div class="ewm_2">
            <span>付款:</span>
            <span>${price}元</span>
        </div>

        <div class="ewm_3">
            <img src="<%=basePath%>WxPay/QRcode?code_url=${QR_URL}" alt="">
            <span>扫一扫付款</span>
            <a href="<%=basePath%>order/toMyOrder">返回</a>
        </div>
    </c:if>

    <c:if test="${QR_URL == null}">
        <div class="ewm_1">
            <span>&nbsp;错误:</span>
            <span>${error}</span>
        </div>

        <div class="ewm_3">
            <img src="<%=basePath%>image/show?pic=" alt="">
            <span>扫一扫付款</span>
            <a href="<%=basePath%>order/toMyOrder">返回</a>
        </div>

    </c:if>
    <div class="ewm_3">

    </div>

</div>
</body>
</html>
