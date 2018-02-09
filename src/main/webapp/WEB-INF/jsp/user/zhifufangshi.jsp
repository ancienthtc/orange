<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>支付方式</title>
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <!-- 移动设备支持 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="icon" type="image/x-icon" href="<%=basePath%>favicon.ico">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link href="<%=basePath%>fontpage/css/mall.css" rel="stylesheet" type="text/css">
    <script src="<%=basePath%>fontpage/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="header">
    <a href="javascript:history.back(-1)">
        <img src="<%=basePath%>fontpage/images/zuojiantou.png"/>
    </a>
    <div>
        支付方式
    </div>
</div>
<form action="" method="post">
    <div class="xzfs">
        <div>
            <img src="<%=basePath%>fontpage/img/wx.jpg" alt=""/>
            <span class="wx">微信支付</span>
            <br/><span class="wx_1">推荐有微信账号的使用</span>
            <span class="xuanzhong">
                <input id="item1" type="radio" name="test" value="0" checked>
                <label for="item1"></label>
            </span>
        </div>

        <div>
            <img src="<%=basePath%>fontpage/img/wx.jpg" alt=""/>
            <span class="wx">微信扫码</span>
            <br/><span class="wx_1">找人扫一扫代付</span>
            <span class="xuanzhong">
                <input id="item3" type="radio" name="test" value="1">
                <label for="item3"></label>
            </span>
        </div>

        <div>
            <img src="<%=basePath%>fontpage/img/alipay.jpg" alt=""/>
            <span class="wx">支付宝</span>
            <br/><span class="wx_1">推荐已安装支付宝的使用</span>
            <span class="xuanzhong">
                <input id="item2" type="radio" name="test" value="2">
                <label for="item2"></label>
            </span>
        </div>

        <input type="button" value="确认" class="submit_ys" name="xxx"/>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $(".submit_ys").click(function () {
          //  alert("你是" + $("input[name='test']:checked").val());
            // return false;

            //console.log(0);
            if( $("input[name='test']:checked").val() == 0 )        //直接付(微信)
            {
                //alert(0);
                var appid;
                var appsectet;
                appid = "${AppId}";
                appsectet = "${AppSecret}";
                //静默授权
                var redirect = "http://orangestore.com.cn/mp/direct/result/${sequence}";  //回调
                var url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appid
                    +"&redirect_uri="+redirect+"&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
                window.location.href = url;
                //console.log(1);
            }
            else if ( $("input[name='test']:checked").val() == 1 )  //扫码付(微信)
            {
                //console.log(2);
                var url = "<%=basePath%>order/toWxScanPay?sequence=${sequence}";
                //console.log(url);
                //alert(1);
                window.location.href = url;
            }
            else if ( $("input[name='test']:checked").val() == 2 )
            {
                //console.log(3);
                alert("支付宝尚未支持");
            }

        });
    });


    <%--$("#sub").click(function () {--%>
        <%--//console.log( $("input[name='item']:checked").val() )--%>
        <%--var s = $("input[name='item']:checked").val();--%>
        <%--if (s == 0)    //微信--%>
        <%--{--%>
            <%--window.location.href = "<%=basePath%>order/toWxPay?sequence=${sequence}";--%>
        <%--}--%>
        <%--else            //支付宝--%>
        <%--{--%>
            <%--alert("支付宝支付暂未开放!");--%>
            <%--return;--%>
        <%--}--%>
    <%--});--%>


</script>