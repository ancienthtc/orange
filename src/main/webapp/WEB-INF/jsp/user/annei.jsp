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
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-wap-web-app-capable" content="yes">
    <meta name="apple-wap-web-app-status-bar-style" content="black-translucent">
    <title>案内</title>
    <link rel="icon" type="image/x-icon" href="<%=basePath%>favicon.ico">
    <link href="<%=basePath%>fontpage/css/ionic.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css"/>
    <script src="<%=basePath%>fontpage/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        table {
            width: 95%;
            height: 360px;
            border: 1px solid #ddd;
            margin: auto;
        }
        .ps_bt {
            width: 100%;
            height: 30px;
            line-height: 30px;
            margin: auto;
            text-align: center;
            background: #fff3dc;
            color: burlywood;
            font-size: 16px;
        }
        tr {
            width: 100%;
        }
        td {
            width: 25%;
            text-align: center;
        }
        table tr:nth-child(1) {
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="header">
    <a href="javascript:history.back(-1)">
        <img src="<%=basePath%>fontpage/images/zuojiantou.png">
    </a>
    <div>
        案内
    </div>
</div>
<table border="1" cellspacing="0" cellpadding="0">
    <div class="ps_bt">
        配送地区、配送時間
    </div>
    <tr>
        <td>配送場所</td>
        <td>配送時間</td>
        <td>免费配送额</td>
        <td>下单截止时间</td>
    </tr>
    <tr>
        <td>高新区</td>
        <td>毎日10：00～21：00</td>
        <td>50元以上</td>
        <td>18：00前</td>
    </tr>
    <tr>
        <td>市区</td>
        <td>毎日14：00～16：00</td>
        <td>100元以上</td>
        <td>12：00前</td>
    </tr>
    <tr>
        <td>工业园区</td>
        <td>毎日14：00～16：00</td>
        <td>100元以上</td>
        <td>12：00前</td>
    </tr>
    <tr>
        <td>昆山市</td>
        <td>毎周日15:00～17:00</td>
        <td>300元以上</td>
        <td>周六17：00前</td>
    </tr>
    <tr>
        <td>常熟市</td>
        <td>毎月第一个周一和第三个周六14:00～16:00</td>
        <td>300元以上</td>
        <td>配送日前一天下午17:00前</td>
    </tr>
    <tr>
        <td>张家港市</td>
        <td>每月第二个周日15:00-17:00</td>
        <td>300元以上</td>
        <td>配送日前一天下午17:00前</td>
    </tr>
</table>
<div class="ps_bt" style="color: #f23030;font-size: 13px;">
    如订单金额达不到上记的配送金额时，另收20元作为配送费
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<script type="text/javascript">
    $(function () {
        if (true) {
            $("#f3").html('<img src="<%=basePath%>fontpage/images/zhinan1.png">');
            $("#t3").css("color", "#ee4b02");
        }
    });
</script>