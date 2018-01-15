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
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/cart_check.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/animate.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main1.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css">
    <script src="<%=basePath%>fontpage/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <style>
        .action {
            border-bottom: 2px solid #ee4b02;
            color: #ee4b02 !important;
        }
    </style>
</head>
<body>
<div class="header" style="display: block;">
    <a href="javascript:history.back(-1)">
        <img src="<%=basePath%>fontpage/images/zuojiantou.png">
    </a>
    <div>
        分类
    </div>
</div>
<div class="step_Tab border-1px">
    <div class="s-item">
        <div class="sitem-l action">
            待付款
        </div>
        <span class="line"></span>
        <div class="sitem-l">
            审核中
        </div>
        <span class="line"></span>
        <div class="sitem-l">
            待收货
        </div>
        <span class="line"></span>
        <div class="sitem-l">
            已完成
        </div>
    </div>
</div>


<div class="tab1">
    <!-- 选项卡1 -->
    <div class="nav_coupon_none">
        <div>
            <div class="ddbh">
                <ul>
                    <li class="li1">
                        订单编号：201712201034339b9da1
                    </li>
                    <li class="li2">
                        <a href="#">
                            <span> 待付款 </span>
                        </a>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
            <div class="zfdd">
                <ul>
                    <li class="li3">
                        <a href="chanpin_xqy.php">
                            <img src="<%=basePath%>fontpage/img/g_1705310953385201177.jpg">
                        </a>
                    </li>
                    <li class="li4">
                        <span>×1.00</span>
                        <span class="z_fudong">苏北稻花香大米</span>
                        <br>
                        <span class="jiage_3">￥48.00</span>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
            <div class="ddfk">
                <ul>
                    <li class="li5">
                        金额：￥48.00
                    </li>
                    <li class="li6">
                        <a href="javascript:;">
                            2017/12/20 10:34:33
                        </a>
                    </li>
                </ul>
                <div style="clear: both;"></div>
            </div>
        </div>
        <div>
            <div class="ddbh">
                <ul>
                    <li class="li1">
                        订单编号：201712201034339b9da1
                    </li>
                    <li class="li2">
                        <a href="#">
                            <span> 待付款 </span>
                        </a>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
            <div class="zfdd">
                <ul>
                    <li class="li3">
                        <a href="chanpin_xqy.php">
                            <img src="<%=basePath%>fontpage/img/g_1705310953385201177.jpg">
                        </a>
                    </li>
                    <li class="li4">
                        <span>×1.00</span>
                        <span>苏北稻花香大米</span>
                        <br>
                        <span class="jiage_3">￥48.00</span>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
            <div class="ddfk">
                <ul>
                    <li class="li5">
                        金额：￥48.00
                    </li>
                    <li class="li6">
                        <a href="javascript:;">
                            2017/12/20 10:34:33
                        </a>
                    </li>
                </ul>
                <div style="clear: both;"></div>
            </div>
        </div>
    </div>

    <div class="nav_coupon_none">
    </div>
    <!-- 选项卡2 -->
    <div class="nav_coupon_none" style="text-align: center; line-height: 20px;display: none;">
        <div>
            <div class="ddbh">
                <ul>
                    <li class="li1">
                        订单编号：201712201034339b9da1
                    </li>
                    <li class="li2">
                        <a href="#">
                            <span> 待付款 </span>
                        </a>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
            <div class="zfdd">
                <ul>
                    <li class="li3">
                        <a href="chanpin_xqy.php">
                            <img src="<%=basePath%>fontpage/img/g_1705310953385201177.jpg">
                        </a>
                    </li>
                    <li class="li4">
                        <span>×1.00</span>
                        <span class="z_fudong">苏北稻花香大米</span>
                        <br>
                        <span class="jiage_3">￥48.00</span>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
            <div class="ddfk">
                <ul>
                    <li class="li5">
                        金额：￥48.00
                    </li>
                    <li class="li6">
                        <a href="javascript:;">
                            2017/12/20 10:34:33
                        </a>
                    </li>
                </ul>
                <div style="clear: both;"></div>
            </div>
        </div>
    </div>
    <div class="nav_coupon_none">
    </div>
    <!-- 选项卡3 -->
    <div class="nav_coupon_none" style="text-align: center; line-height: 20px;display: none;">
        <div>
            <div class="ddbh">
                <ul>
                    <li class="li1">
                        订单编号：201712201034339b9da1
                    </li>
                    <li class="li2">
                        <a href="#">
                            <span> 待付款 </span>
                        </a>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
            <div class="zfdd">
                <ul>
                    <li class="li3">
                        <a href="chanpin_xqy.php">
                            <img src="<%=basePath%>fontpage/img/g_1705310953385201177.jpg">
                        </a>
                    </li>
                    <li class="li4">
                        <span>×1.00</span>
                        <span class="z_fudong">苏北稻花香大米</span>
                        <br>
                        <span class="jiage_3">￥48.00</span>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
            <div class="ddfk">
                <ul>
                    <li class="li5">
                        金额：￥48.00
                    </li>
                    <li class="li6">
                        <a href="javascript:;">
                            2017/12/20 10:34:33
                        </a>
                    </li>
                </ul>
                <div style="clear: both;"></div>
            </div>
        </div>
    </div>
    <div class="nav_coupon_none">
    </div>
    <!-- 选项卡4 -->
    <div class="nav_coupon_none" style="text-align: center; line-height: 20px;display: none;">
        <div>
            <div class="ddbh">
                <ul>
                    <li class="li1">
                        订单编号：201712201034339b9da1
                    </li>
                    <li class="li2">
                        <a href="#">
                            <span> 待付款 </span>
                        </a>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
            <div class="zfdd">
                <ul>
                    <li class="li3">
                        <a href="chanpin_xqy.php">
                            <img src="<%=basePath%>fontpage/img/g_1705310953385201177.jpg">
                        </a>
                    </li>
                    <li class="li4">
                        <span>×1.00</span>
                        <span class="z_fudong">苏北稻花香大米</span>
                        <br>
                        <span class="jiage_3">￥48.00</span>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
            <div class="ddfk">
                <ul>
                    <li class="li5">
                        金额：￥48.00
                    </li>
                    <li class="li6">
                        <a href="javascript:;">
                            2017/12/20 10:34:33
                        </a>
                    </li>
                </ul>
                <div style="clear: both;"></div>
            </div>
        </div>
    </div>
</div>
<div class="fenye">
    <a href="#">
        <div class="sx_ys">
            上一页
        </div>
    </a>

    <div class="zj_xl">
        <select name="">
            <option value="">第1页</option>
            <option value="">第2页</option>
            <option value="">第3页</option>
            <option value="">第4页</option>
        </select>
    </div>
    <a href="#">
        <div class="sx_ys">
            上一页
        </div>
    </a>

</div>
<!-- END 选项卡1 -->

<!--<script type="text/javascript">
//初始加载
$(function () {
$("#tab1").addClass("hover");
orderLoad(1);
})
//待付款
$("#tab1").click(function () {

$("#tab1").addClass("step_Tab_b hover");
$("#tab2").removeClass("hover");
$("#tab3").removeClass("hover");
$("#tab4").removeClass("hover");
orderLoad(1);
})
//待确认
$("#tab2").click(function () {

$("#tab2").addClass("step_Tab_b hover");
$("#tab1").removeClass("hover");
$("#tab3").removeClass("hover");
$("#tab4").removeClass("hover");
orderLoad(2);
})
//待收货
$("#tab3").click(function () {
//$("#newOrder").addClass("step_Tab_b hover");
//$("#oldOrder").removeClass("hover");
$("#tab3").addClass("step_Tab_b hover");
$("#tab1").removeClass("hover");
$("#tab2").removeClass("hover");
$("#tab4").removeClass("hover");
orderLoad(3);
})
//已完成
$("#tab4").click(function () {
$("#tab4").addClass("step_Tab_b hover");
$("#tab1").removeClass("hover");
$("#tab2").removeClass("hover");
$("#tab3").removeClass("hover");
orderLoad(4);
})
function orderLoad(type) {
$.post("/My/OrderData/", { Type: type }, function (data) {
$("#main").html(data);
})
}
function OpenPay(orderId) {
debugger
var LoginID = '15962724154'
//var url = "http://pay.0512iis.com/Pay.aspx?OrderID=" + orderId + "&LoginID=" +LoginID +"";
//window.location.href = url;//"/My/Pay/" + orderId;
var url = "/WxPay/PayIndex/?OrderID=" + orderId + "&LoginID=" + LoginID + "";
window.location.href = url;//"/My/Pay/" + orderId;
//POST数据到支付页面
//$.post("/WxPay/PayIndex/", { OrderID: orderId, LoginID: LoginID }, function (data) { });

//$.post("http://pay.0512iis.com/Pay.aspx", { OrderID: orderId, LoginID: LoginID }, function (data) {
//$("#main").html(data);
//})
}
//订单收货
function OrderReceive(orderId) {
debugger
if (orderId == "" || orderId == null || orderId == "undefind") {
$.prompt("订单编号不能为空", {
buttons: { "确定": true }
});
return;
}
$.ajax({
url: "/Order/ReceiveOrder/",
type: 'post',
data: { OrderID: orderId },
dataType: 'json',
success: function (data) {
if (data.Statu == 1) {
$.prompt(data.Msg, {
buttons: { "确定": true }
});
setTimeout(function () {
window.location.reload();;
}, 1500);
} else {
$.prompt(data.Msg, {
buttons: { "确定": true }
});
}
},
error: function () {
$.prompt("服务器繁忙..请稍后重试！", {
buttons: { "确定": true }
});
}
});
}
</script>-->
</body>

<script>


    function send_post(url, info) {
        $.post(url, info, function (result) {

        }, "json");
    }


</script>

</html>
<script type="text/javascript">$(".sitem-l").click(function () {
        $(this).addClass("action").siblings().removeClass("action");
        var index = $(this).index();
        $(".nav_coupon_none").eq(index).show().siblings().hide();
    }
);</script>