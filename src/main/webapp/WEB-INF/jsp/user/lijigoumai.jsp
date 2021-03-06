﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="author" content="www.34580.com"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="format-detection" content="telephone=no"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta name="viewport"
          content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height"/>
    <title>购物车</title>
    <link rel="icon" type="image/x-icon" href="<%=basePath%>favicon.ico">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/lijigoumai.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <script src="<%=basePath%>fontpage/js/jquery-1.10.2.js"></script>
    <style>
        label {
            cursor: pointer;
            display: inline-block;
            font-size:1rem;
            margin-right:0;
            padding-left: 25px;
            position: relative;
            left: 0;
            width:40%;
            line-height: 30px;

        }
        .radio{width: 100% !important;}
        input[type="radio"] {
            display: none;
        }
        label:before {
            background-color:#ff900d;
            bottom: 1px;
            /*box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.3) inset, 0 1px 0 0 rgba(255, 255, 255, 0.8);*/
            content: "";
            display: inline-block;
            height: 20px;
            left: 0;
            margin-right: 10px;
            position: absolute;
            top: 5px;
            width: 20px;
        }
        .radio label:before {
            border-radius:100%;
        }
        input[type="radio"]:checked + label:before {
            color: #f3f3f3;
            /*content: "•";*/
            font-size: 30px;
            line-height: 18px;
            text-align: center;
        }

    </style>
</head>
<body>
<div class="header">
    <a href="javascript:history.back(-1)">
        <img src="<%=basePath%>fontpage/images/zuojiantou.png"/>
    </a>
    <div>
        订单
    </div>
</div>
<section class="aui-address-content">
    <div class="aui-address-box">
        <c:if test="${not empty address}">
            <div class="aui-address-box-list aid" aid="${address.id}">
                <a href="<%=basePath%>user/toAddress" class="aui-address-box-default">
                    <ul>
                        <li>
                            <strong><div style="color:#2aa8fd;float: left">${address.recipient}</div>
                                <div style="color:#2aa8fd;float: left"> &nbsp;${address.tel}</div></strong>
                            <span class="aui-tag aui-tag-default" id="aui-default">默认</span>
                        </li>
                        <li>
                            <i class="aui-icon aui-icon-address"></i>
                            ${address.detail}
                        </li>
                    </ul>
                </a>
            </div>
            <div class="address_defalut address_border"></div>
        </c:if>
        <c:if test="${empty address}">
            <div class="dizhi_kb aid" aid="null">
                <a href="<%=basePath%>user/toAddress"style="color:#999;">
                    你还没有设置收货地址 请前往个人中心添加
                </a>
            </div>
        </c:if>

    </div>
    <div class="aui-dri"></div>
    <div class="aui-list-product-float-item">

        <c:forEach var="i" items="${goodsList}">
            <a href="javascript:;" class="aui-list-product-fl-item goods">
                <input type="hidden" name="fid" value="${i.get("fid")}">
                <input type="hidden" name="cid" value="${i.get("cid")}">
                <input type="hidden" name="amount" value="${i.get("amount")}">
                <input type="hidden" name="detail" value="${i.get("detail")}">
                <div class="aui-list-product-fl-img">
                    <img src="<%=basePath%>image/goods?pic=${i.get("pic1")}" alt="">
                </div>
                <div class="aui-list-product-fl-text">
                    <h3 class="aui-list-product-fl-title">
                        ${i.get("gname")}
                    </h3>
                    <h3 class="aui-list-product-fl-title" style="text-align: left;margin-left:24px;width: 60px;">
                        ${i.get("fname")}
                    </h3>
                    <div class="aui-list-product-fl-mes">
                        <div>
							<span class="aui-list-product-item-price">
								<span style="color:#999;width:42px;display: inline-block;">单价:</span>
								<em style="position: relative;left: -3%;">¥</em>
								<span style="position: relative;left: -6%;"> ${i.get("price")}</span>

							</span>
                            <span style="position: relative;left:-7%;font-size: 17px;">x${i.get("amount")}</span>
                            <span style="font-size: 17px;position: relative;left:-8%;">${i.get("fclass")}</span>
                        </div>
                    </div>
                </div>
                <div class="sp_zj">¥${i.get("all")}</div>
            </a>
        </c:forEach>

    </div>
    <div class="aui-address-well">
        <a href="#" class="aui-address-cell aui-fl-arrow">
            <div class="aui-address-cell-bd fanshi" style="margin-top: 1%;">交易方式:</div>
            <div class="jy_fs">
                <div class="radio">
                    <input type="radio" value="1" name="sex" id="radio1" checked>
                    <label for="radio1" >线上交易</label>

                    <input type="radio" value="0" name="sex" id="radio2">
                    <label for="radio2">线下交易</label>
                </div>
            </div>
        </a>
        <div class="aui-prompt">您的商品发货成功后，请您做好收货准备！</div>
        <a href="#" class="aui-address-cell aui-fl-arrow aui-fl-arrow-clear">
            <div class="aui-address-cell-bd">发票</div>
            <div class="aui-address-cell-ft">个人</div>
        </a>
        <div class="aui-dri"></div>
        <a href="#" class="aui-address-cell aui-fl-arrow aui-fl-arrow-clear">
            <c:if test="${sessionScope.user.score >= 100}">
                <div class="aui-address-cell-bd">可用积分${sessionScope.user.score}</div>
                <input onclick="checked=chk=!chk;" onmouseover="chk=checked;" type="radio" class="score choice" value="${sessionScope.user.score}"
                       cost="0" style="width: 18px;height: 18px;position: relative;top:.3vh;right: 1%;display: block;
                       border-radius: 100%;background: #ff900d;border: none;"/>
                <c:if test="${sessionScope.user.score >= all.get('AP')*5 }">
                    <span>优惠${all.get('AP')*0.05}元</span>
                </c:if>
                <c:if test="${sessionScope.user.score < all.get('AP')*5 }">
                    <span>优惠${sessionScope.user.score/100}元</span>
                </c:if>
            </c:if>
            <c:if test="${sessionScope.user.score < 100}">
                <div class="aui-address-cell-bd">无可用积分</div>
                <%--<input onclick="checked=chk=!chk;" onmouseover="chk=checked;" type="radio" class="score"--%>
                       <%--cost="0" style="width: 18px;height: 18px;position: relative;top:.3vh;right: 1%;"/>--%>
                <input type="hidden" class="score" cost="0" style="width: 18px;height: 18px;position: relative;top:.3vh;right: 1%;">
                <span>无优惠</span>
            </c:if>

        </a>
        <div class="aui-dri"></div>
        <a href="#" class="aui-address-cell aui-fl-arrow aui-fl-arrow-clear">
            <div class="aui-address-cell-bd">商品总价</div>
            <div class="aui-address-cell-ft">¥${all.get("AP")}元</div>
        </a>
        <div class="aui-dri"></div>
        <a href="#" class="aui-address-cell aui-fl-arrow aui-fl-arrow-clear">
            <div class="aui-address-cell-bd">其他价格</div>
            <div class="aui-address-cell-ft">¥${all.get("OP")}元</div>
        </a>

        <div class="aui-dri"></div>
        <%--<a href="#" class="aui-address-cell aui-fl-arrow aui-fl-arrow-clear">--%>
            <%--<div class="aui-address-cell-bd">--%>
                <%--<h3>商品金额</h3>--%>
                <%--<!--<p>运费(总重:1.978kg)</p>-->--%>
            <%--</div>--%>
            <%--<div class="aui-address-cell-ft">--%>
                <%--<span class="aui-red">￥2899.00</span><br>--%>
                <%--<!--		<span class="aui-red">+￥0.00</span>-->--%>
            <%--</div>--%>
        <%--</a>--%>
        <!--	<div style="width: 100%;height: 40px;"></div>-->
    </div>
    <div class="aui-payment-bar">
        <div class="shop-total">
            <span class="aui-red aui-size">实付款: <em>￥${all.get("AP")+all.get("OP")}</em></span>
        </div>
        <a class="settlement submit">提交订单</a>
    </div>
</section>

</body>



<script>
$(function () {
    $(".score.choice").eq(0).click(function () {
        if( $(this).prop("checked") == false )
        {
            $(".score.choice").eq(0).attr("cost",0);
        }
        else
        {
            $(".score.choice").eq(0).attr("cost",1);
        }
        //return
        //$("#ssssss").prop("checked")
    })
})
    $(".submit").click(function () {
        //aid , buyway , cost
        var aid=$(".aid").attr("aid");//aid
        //console.log("aid="+aid);
        var buyway=$(".buyway:checked").val();//buyway
        //console.log("buyway="+buyway);
        var $list=$(".goods");//goods  fid , cid , amount , detail
        //score cost: 0 / 1
        $(".score.choice").click(function () {
            if( $(this).prop("checked") == true )
            {
                $(this).attr("cost",1);
                //$(this).prop("checked",false);
            }
            else if( $(this).prop("checked") == false )
            {
                $(this).attr("cost",0);
            }
        });
        var cost=$(".score").attr("cost");//cost
        //console.log("cost="+cost);
        var json='';
        json+='{';
        json+='"goods":[';
        $list.each(function () {
            var fid=$(this).find("input[name='fid']").val();
            var cid=$(this).find("input[name='cid']").val();
            if(cid==null || cid.length<=0)
            {
                cid="null";
            }
            var amount=$(this).find("input[name='amount']").val();
            var detail=$(this).find("input[name='detail']").val();
            //console.log("fid="+fid+" "+"cid="+cid+" "+"amount="+amount+" "+"detail="+detail);
            json+='{"fid":'+fid+',"cid":'+cid+',"amount":'+amount+',"detail":"'+detail+'"},';
        });
        json=json.substr(0,json.length-1);
        json+='],';
        json+='"aid":'+aid+',"buyway":'+buyway+',"cost":'+cost;
        json+='}';
        console.log(json);
        //提交订单
        $.ajax({
            url: "../order/create",
            type: 'post',
            contentType : 'application/json',
            dataType: 'json',
            data: json,
            success: function (data) {
                console.log(data);
                if(data.status==0)
                {
                    alert("创建成功");
                    window.location.href = "<%=basePath%>order/toMyOrder";
                }
                else
                {
                    //console.log(data.msg);
                    alert(data.msg);
                }
            },
            error: function () {
                alert('服务器繁忙..请稍后重试！');
            }
        });

    });

</script>

</html>
<!--
{
"goods": [
{
"fid": 1,
"cid": 4,
"amount": 7,
"detail": "l"
},
{
"fid": 1,
"cid": 4,
"amount": 7,
"detail": "l"
}
],
"aid": 1,
"buyway": 0,
"cost": 1
}
-->