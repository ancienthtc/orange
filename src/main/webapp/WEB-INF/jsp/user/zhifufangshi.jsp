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
    <%--<form action="" method="post">--%>
        <div class="xzfs">
            <div>
                <img src="<%=basePath%>fontpage/img/weixin_zf.png" alt=""/>
                <span class="wx">微信支付</span>
                <br/>
                <span class="wx_1">推荐有微信账号的使用</span>
                <span class="xuanzhong">
                    <input id="item1" type="radio" name="item" value="0" class="ra">
                    <label class="lab" for="item1"></label>
                </span>
            </div>
            <div>
                <img src="<%=basePath%>fontpage/img/zhifubao_zf.png" alt=""/>
                <span class="wx">支付宝</span>
                <br/>
                <span class="wx_1">推荐已安装支付宝的使用（支付宝暂未开放）</span>
                <span class="xuanzhong">
                    <input id="item2" type="radio" name="item" value="1" class="ra">
                    <label class="lab" for="item2"></label>
                </span>
            </div>
            <input id="sub" type="button" value="确认" class="submit_ys"/>

        </div>
    <%--</form>--%>
</body>

<script>

    $(".lab").click(function () {
        console.log( $(this).prev().attr("id")  );
       var item = $(this).prev().attr("id");
       if( item=="item1" )
       {
           $("#item1").attr("checked",true);
           $("#item2").attr("checked",false);
       }
       else if( item=="item2" )
       {
           $("#item2").attr("checked",true);
           $("#item1").attr("checked",false);
       }


    });


    $("#sub").click(function () {
        //console.log( $("input[name='item']:checked").val() )
        var s = $("input[name='item']:checked").val() ;
        if( s == 0 )    //微信
        {
            window.location.href = "<%=basePath%>order/toWxPay?sequence=${sequence}";
        }
        else            //支付宝
        {
            alert("支付宝支付暂未开放!");
            return;
        }
    });


</script>

</html>
