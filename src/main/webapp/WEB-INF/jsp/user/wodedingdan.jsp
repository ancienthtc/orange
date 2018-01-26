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
    <script src="<%=basePath%>backpage/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/layer/extend/layer.ext.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/laydate/laydate.js" type="text/javascript"></script>

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
        <div class="sitem-l action ">
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
    <div class="nav_coupon_none" id="pay">


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
                    下一页
                </div>
            </a>
        </div>

    </div>

    <div class="nav_coupon_none">
    </div>
    <!-- 选项卡2 -->
    <div class="nav_coupon_none" style="text-align: center; line-height: 20px;display: none;" id="sure">


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
                    下一页
                </div>
            </a>
        </div>
    </div>
    <div class="nav_coupon_none">
    </div>
    <!-- 选项卡3 -->
    <div class="nav_coupon_none" style="text-align: center; line-height: 20px;display: none;" id="receive">


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
                    下一页
                </div>
            </a>
        </div>
    </div>
    <div class="nav_coupon_none">
    </div>
    <!-- 选项卡4 -->
    <div class="nav_coupon_none" style="text-align: center; line-height: 20px;display: none;" id="finish">


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
                    下一页
                </div>
            </a>
        </div>
    </div>
</div>

<!-- END 选项卡1 -->
<%--<jsp:include page="footer.jsp"></jsp:include>--%>

<script>

    $(function(){
        var info = {pageNo:1};
        var url0 = "<%=basePath%>order/getUserNoPay";
        var url1 = "<%=basePath%>order/getUserNoSure";
        var url2 = "<%=basePath%>order/getUserNoReceive";
        var url3 = "<%=basePath%>order/getUserFinish";
        send_post0(url0,info);
        send_post1(url1,info);
        send_post2(url2,info);
        send_post3(url3,info);
    })


    function send_post0(url,info) {
        $.post(url,info,function(result){
            var body = $("#pay");
            body.empty();
            var html = "";
            html += "<div>";
            for (var i=0 ; i<result.dataList.length ; i++)
            {
                html += "<div class='ddbh'>" ;
                html += "<ul>" ;
                html += "<li class='li1'>订单编号："+result.dataList[i].sequence+"</li>" ;
                html += "<li class='li2'><a href='<%=basePath%>order/toChoose?sequence="+result.dataList[i].sequence+"'><span> 点击付款 </span></a></li>" ;
                html += "</ul>";
                html += "<div style='clear: both'></div>" ;
                html += "</div>" ;
                for (var j=0 ; j<result.dataList[i].orderDetails.length ;j++)
                {
                    html += "<div class='zfdd'>" ;
                    html += "<ul>" ;
                    html += "<li class='li3'>" ;
                    html += "<a><img src='<%=basePath%>image/order?pid="+result.dataList[i].orderDetails[j].picture+"'></a>" ;
                    html += "</li>" ;
                    html += "<li class='li4'>" ;
                    html += "<span>×"+result.dataList[i].orderDetails[j].amount+"</span>" ;
                    html += "<span class='z_fudong'>" ;
                    html += result.dataList[i].orderDetails[j].goodsname+" "+result.dataList[i].orderDetails[j].format ;
                    html += "</span><br>" ;
                    html += "<span class='jiage_3'>￥" + result.dataList[i].orderDetails[j].price + "</span>" ;
                    html += "</li>" ;
                    html += "</ul>" ;
                    html += "<div style='clear: both'></div>" ;
                    html += "</div>" ;
                }
                html += "<div class='ddfk'>" ;
                html += "<ul>" ;
                html += "<li class='li5'>金额：￥"+result.dataList[i].allprice+"</li>" ;
                if( result.dataList[i].createtime != "" && result.dataList[i].createtime != undefined )
                {
                    var time = new Date(result.dataList[i].createtime);
                    result.dataList[i].createtime = time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
                }
                else
                {
                    result.dataList[i].createtime = "";
                }
                html += "<li class='li6'><a href='javascript:;'> "+result.dataList[i].createtime+" </a></li>" ;
                html += "</ul>" ;
                html += "<div style='clear: both'></div>" ;
                html += "</div>" ;
            }//订单结束
            html += "<div class='fenye'>" ;
            html += "<a class='previous pay'><div class='sx_ys'>上一页</div></a>" ;
            html += "<div class='zj_xl'>" ;
            html += "<select class='pg pay' all='"+result.pages+"' >" ;
            for ( var s=1 ; s<=result.pages ; s++ )
            {
                html += "<option value='"+s+"' >第 "+s+" 页</option>" ;
            }
            html += "</select>" ;
            html += "</div>" ;
            html += "<a class='next pay'><div class='sx_ys'>下一页</div></a>" ;
            html += "</div>" ;
            html += "</div>" ;
            body.append(html);
            afterLoad0();
        },"json");
    }

    function send_post1(url,info) {
        $.post(url,info,function(result){
            console.log(result);
            var body = $("#sure");
            body.empty();
            var html = "";
            html += "<div>";
            for (var i=0 ; i<result.dataList.length ; i++)
            {
                html += "<div class='ddbh'>" ;
                html += "<ul>" ;
                html += "<li class='li1'>订单编号："+result.dataList[i].sequence+"</li>" ;
                html += "<li class='li2'><a href='#'><span> 待确认 </span></a></li>" ;
                html += "</ul>";
                html += "<div style='clear: both'></div>" ;
                html += "</div>" ;
                for (var j=0 ; j<result.dataList[i].orderDetails.length ;j++)
                {
                    html += "<div class='zfdd'>" ;
                    html += "<ul>" ;
                    html += "<li class='li3'>" ;
                    html += "<a><img src='<%=basePath%>image/order?pid="+result.dataList[i].orderDetails[j].picture+"'></a>" ;
                    html += "</li>" ;
                    html += "<li class='li4'>" ;
                    html += "<span>×"+result.dataList[i].orderDetails[j].amount+"</span>" ;
                    html += "<span class='z_fudong'>" ;
                    html += result.dataList[i].orderDetails[j].goodsname+" "+result.dataList[i].orderDetails[j].format ;
                    html += "</span><br>" ;
                    html += "<span class='jiage_3'>￥" + result.dataList[i].orderDetails[j].price + "</span>" ;
                    html += "</li>" ;
                    html += "</ul>" ;
                    html += "<div style='clear: both'></div>" ;
                    html += "</div>" ;
                }
                html += "<div class='ddfk'>" ;
                html += "<ul>" ;
                html += "<li class='li5'>金额：￥"+result.dataList[i].allprice+"</li>" ;
                if( result.dataList[i].createtime != "" && result.dataList[i].createtime != undefined )
                {
                    var time = new Date(result.dataList[i].createtime);
                    result.dataList[i].createtime = time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
                }
                else
                {
                    result.dataList[i].createtime = "";
                }
                html += "<li class='li6'><a href='javascript:;'> "+result.dataList[i].createtime+" </a></li>" ;
                html += "</ul>" ;
                html += "<div style='clear: both'></div>" ;
                html += "</div>" ;
            }//订单结束
            html += "<div class='fenye'>" ;
            html += "<a class='previous sure'><div class='sx_ys'>上一页</div></a>" ;
            html += "<div class='zj_xl'>" ;
            html += "<select class='pg sure' all='"+result.pages+"' >" ;
            for ( var s=1 ; s<=result.pages ; s++ )
            {
                html += "<option value='"+s+"' >第 "+s+" 页</option>" ;
            }
            html += "</select>" ;
            html += "</div>" ;
            html += "<a class='next sure'><div class='sx_ys'>下一页</div></a>" ;
            html += "</div>" ;
            html += "</div>" ;
            body.append(html);
            afterLoad1();
        },"json");
    }

    //
    function send_post2(url,info) {
        $.post(url,info,function(result){
            var body = $("#receive");
            body.empty();
            var html = "";
            html += "<div>";
            for (var i=0 ; i<result.dataList.length ; i++)
            {
                html += "<div class='ddbh'>" ;
                html += "<ul>" ;
                html += "<li class='li1'>订单编号："+result.dataList[i].sequence+"</li>" ;
                html += "<li class='li2'><a class='receive' oid='"+result.dataList[i].sequence+"'><span> 点击收货 </span></a></li>" ;
                html += "</ul>";
                html += "<div style='clear: both'></div>" ;
                html += "</div>" ;
                for (var j=0 ; j<result.dataList[i].orderDetails.length ;j++)
                {
                    html += "<div class='zfdd'>" ;
                    html += "<ul>" ;
                    html += "<li class='li3'>" ;
                    html += "<a><img src='<%=basePath%>image/order?pid="+result.dataList[i].orderDetails[j].picture+"'></a>" ;
                    html += "</li>" ;
                    html += "<li class='li4'>" ;
                    html += "<span>×"+result.dataList[i].orderDetails[j].amount+"</span>" ;
                    html += "<span class='z_fudong'>" ;
                    html += result.dataList[i].orderDetails[j].goodsname+" "+result.dataList[i].orderDetails[j].format ;
                    html += "</span><br>" ;
                    html += "<span class='jiage_3'>￥" + result.dataList[i].orderDetails[j].price + "</span>" ;
                    html += "</li>" ;
                    html += "</ul>" ;
                    html += "<div style='clear: both'></div>" ;
                    html += "</div>" ;
                }
                html += "<div class='ddfk'>" ;
                html += "<ul>" ;
                html += "<li class='li5'>金额：￥"+result.dataList[i].allprice+"</li>" ;
                if( result.dataList[i].createtime != "" && result.dataList[i].createtime != undefined )
                {
                    var time = new Date(result.dataList[i].createtime);
                    result.dataList[i].createtime = time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
                }
                else
                {
                    result.dataList[i].createtime = "";
                }
                html += "<li class='li6'><a href='javascript:;'> "+result.dataList[i].createtime+" </a></li>" ;
                html += "</ul>" ;
                html += "<div style='clear: both'></div>" ;
                html += "</div>" ;
                //增加地址信息
                html += "<div class='ddfk'>" ;
                html += "<ul>" ;
                html += "<li class='li5'>地址:"+result.dataList[i].address+"</li>" ;
                html += "<li class='li6'><a href='javascript:;'>"+ result.dataList[i].recipient +"  "+result.dataList[i].logistics+" </a></li>" ;
                html += "</ul>" ;
                html += "</div>" ;
            }//订单结束
            html += "<div class='fenye'>" ;
            html += "<a class='previous'><div class='sx_ys'>上一页</div></a>" ;
            html += "<div class='zj_xl'>" ;
            html += "<select class='pg' all='"+result.pages+"'>" ;
            for ( var s=1 ; s<=result.pages ; s++ )
            {
                html += "<option value='"+s+"' >第 "+s+" 页</option>" ;
            }
            html += "</select>" ;
            html += "</div>" ;
            html += "<a class='next'><div class='sx_ys'>下一页</div></a>" ;
            html += "</div>" ;
            html += "</div>" ;
            body.append(html);
            afterLoad2();
        },"json");
    }

    //已完成
    function send_post3(url,info) {
        $.post(url,info,function(result){
            var body = $("#finish");
            body.empty();
            var html = "";
            html += "<div>";
            for (var i=0 ; i<result.dataList.length ; i++)
            {
                html += "<div class='ddbh'>" ;
                html += "<ul>" ;
                html += "<li class='li1'>订单编号："+result.dataList[i].sequence+"</li>" ;
                html += "<li class='li2'><a href='#'><span> 已完成 </span></a></li>" ;
                html += "</ul>";
                html += "<div style='clear: both'></div>" ;
                html += "</div>" ;
                for (var j=0 ; j<result.dataList[i].orderDetails.length ;j++)
                {
                    html += "<div class='zfdd'>" ;
                    html += "<ul>" ;
                    html += "<li class='li3'>" ;
                    html += "<a><img src='<%=basePath%>image/order?pid="+result.dataList[i].orderDetails[j].picture+"'></a>" ;
                    html += "</li>" ;
                    html += "<li class='li4'>" ;
                    html += "<span>×"+result.dataList[i].orderDetails[j].amount+"</span>" ;
                    html += "<span class='z_fudong'>" ;
                    html += result.dataList[i].orderDetails[j].goodsname+" "+result.dataList[i].orderDetails[j].format ;
                    html += "</span><br>" ;
                    html += "<span class='jiage_3'>￥" + result.dataList[i].orderDetails[j].price + "</span>" ;
                    html += "</li>" ;
                    html += "</ul>" ;
                    html += "<div style='clear: both'></div>" ;
                    html += "</div>" ;
                }
                html += "<div class='ddfk'>" ;
                html += "<ul>" ;
                html += "<li class='li5'>金额：￥"+result.dataList[i].allprice+"</li>" ;
                if( result.dataList[i].createtime != "" && result.dataList[i].createtime != undefined )
                {
                    var time = new Date(result.dataList[i].createtime);
                    result.dataList[i].createtime = time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
                }
                else
                {
                    result.dataList[i].createtime = "";
                }
                html += "<li class='li6'><a href='javascript:;'> "+result.dataList[i].createtime+" </a></li>" ;
                html += "</ul>" ;
                html += "<div style='clear: both'></div>" ;
                html += "</div>" ;
            }//订单结束
            html += "<div class='fenye'>" ;
            html += "<a class='previous'><div class='sx_ys'>上一页</div></a>" ;
            html += "<div class='zj_xl'>" ;
            html += "<select class='pg' all='"+result.pages+"'>" ;
            for ( var s=1 ; s<=result.pages ; s++ )
            {
                html += "<option value='"+s+"' >第 "+s+" 页</option>" ;
            }
            html += "</select>" ;
            html += "</div>" ;
            html += "<a class='next'><div class='sx_ys'>下一页</div></a>" ;
            html += "</div>" ;
            html += "</div>" ;
            body.append(html);
            afterLoad3();
        },"json");
    }

    //后续绑定
    function afterLoad0() {
        var now = $(".pg.pay option:selected").val();
        $(".previous.pay").click(function () {  //上一页
            //console.log(now);
            now = parseInt(now) - 1;
            if(now<=0)
            {
                return false;
            }
            else {
                var info = {pageNo:now};
                var url0 = "<%=basePath%>order/getUserNoPay";
                send_post0(url0,info);
            }
        });

        $(".next.pay").click(function () {  //下一页
            //console.log(now);
            now = parseInt(now) + 1;
            if( now > $(".pg.pay").attr("all") )
            {
                return false;
            }
            else {
                var info = {pageNo:now};
                var url0 = "<%=basePath%>order/getUserNoPay";
                send_post0(url0,info);
            }
        });

        $(".pg.pay").change(function () {
            //console.log(now);
            var info = {pageNo:now};
            var url0 = "<%=basePath%>order/getUserNoPay";
            send_post0(url0,info);
        });
    }

    function afterLoad1() {
        var now = $(".pg.sure option:selected").val();
        $(".previous.sure").click(function () {  //上一页
            //console.log(now);
            now = parseInt(now) - 1;
            if(now<=0)
            {
                return false;
            }
            else {
                var info = {pageNo:now};
                var url1 = "<%=basePath%>order/getUserNoSure";
                send_post1(url1,info);
            }

        });

        $(".next.sure").click(function () {  //下一页
            //console.log(now);
            now = parseInt(now) + 1;
            if( now > $(".pg.sure").attr("all") )
            {
                return false;
            }
            else {
                var info = {pageNo:now};
                var url1 = "<%=basePath%>order/getUserNoSure";
                send_post1(url1,info);
            }


        });

        $(".pg.sure").change(function () {
            console.log(now);
            var info = {pageNo:now};
            var url1 = "<%=basePath%>order/getUserNoSure";
            send_post1(url1,info);
        });
    };

    function afterLoad2() {
        var now = $(".pg.receive option:selected").val();
        $(".previous.receive").click(function () {  //上一页
            //console.log(now);
            now = parseInt(now) - 1;
            if(now<=0)
            {
                return false;
            }
            else {
                var info = {pageNo:now};
                var url2 = "<%=basePath%>order/getUserNoReceive";
                send_post2(url2,info);
            }
        });

        $(".next.receive").click(function () {  //下一页
            //console.log(now);
            now = parseInt(now) + 1;
            if( now > $(".pg.receive").attr("all") )
            {
                return false;
            }
            else {
                var info = {pageNo:now};
                var url2 = "<%=basePath%>order/getUserNoReceive";
                send_post2(url2,info);
            }
        });

        $(".pg.receive").change(function () {
            //console.log(now);
            var info = {pageNo:now};
            var url2 = "<%=basePath%>order/getUserNoReceive";
            send_post2(url2,info);
        });
        /** 特殊 */
        $(".receive").click(function () {
            var oid = $(this).attr("oid");
            layer.msg('确定收货?', {
                time: 0 //不自动关闭
                ,btn: ['收货', '取消']
                ,yes: function(index){
                    layer.close(index);
                    //layer.alert(oid);
                    $.ajax({
                        url:"<%=basePath%>order/receive",
                        data:{sequence:oid},
                        type:"get",
                        dataType:"json",
                        success:function(data){
                            if( data.status == 0 )
                            {
                                layer.alert("收货成功");
                                var info = {pageNo:now};
                                var url2 = "<%=basePath%>order/getUserNoReceive";
                                send_post2(url2,info);
                            }
                            else
                            {
                                layer.alert(data.msg);
                            }
                        },
                        error:function(){
                            alert("请求失败");
                        }
                    });
                }
            });

        });

    }

    function afterLoad3() {
        var now = $(".pg.finish option:selected").val();
        $(".previous.finish").click(function () {  //上一页
            //console.log(now);
            now = parseInt(now) - 1;
            if(now<=0)
            {
                return false;
            }
            else {
                var info = {pageNo:now};
                var url3 = "<%=basePath%>order/getUserFinish";
                send_post3(url3,info);
            }
        });

        $(".next.finish").click(function () {  //下一页
            //console.log(now);
            now = parseInt(now) + 1;
            if( now > $(".pg.finish").attr("all") )
            {
                return false;
            }
            else {
                var info = {pageNo:now};
                var url3 = "<%=basePath%>order/getUserFinish";
                send_post3(url3,info);
            }
        });

        $(".pg.finish").change(function () {
            //console.log(now);
            var info = {pageNo:now};
            var url3 = "<%=basePath%>order/getUserFinish";
            send_post3(url3,info);
        });

    }

</script>


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