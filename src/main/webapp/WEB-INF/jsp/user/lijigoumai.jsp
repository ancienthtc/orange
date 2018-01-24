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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="format-detection" content="telephone=no, email=no"/>
    <meta name="viewport" content="width=320,maximum-scale=1.3,user-scalable=no">
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/lijigoumai.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <script src="<%=basePath%>fontpage/js/jquery-1.10.2.js"></script>
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
                            <strong>${address.recipient} tel:${address.tel} phone:${address.phone}</strong>
                            <span class="aui-tag aui-tag-default" id="aui-default">默认</span>
                        </li>
                        <li>
                            <i class="aui-icon aui-icon-address"></i>
                            ${address.detail}
                        </li>
                    </ul>
                </a>
            </div>
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
                    <h3 class="aui-list-product-fl-title" style="text-align: left;margin-left: 10px;width: 60px;">
                        ${i.get("fname")}
                    </h3>
                    <div class="aui-list-product-fl-mes">
                        <div>
							<span class="aui-list-product-item-price">
								<span style="color:#999;">&nbsp;&nbsp;单价:</span>
								<em>¥</em>
								${i.get("price")}
							</span>
                            <span style="position: relative;left: 1px;">x${i.get("amount")}</span>
                            <span>${i.get("fclass")}</span>
                        </div>
                    </div>
                </div>
                <div class="sp_zj">¥${i.get("all")}</div>
            </a>
        </c:forEach>

    </div>
    <div class="aui-address-well">
        <a href="#" class="aui-address-cell aui-fl-arrow">
            <div class="aui-address-cell-bd fanshi">交易方式:</div>
            <div class="jy_fs">
                <div>
                    <input type="radio" name="radio" class="buyway" value="0" checked="checked"/>
                    <span>线上交易</span>
                </div>
                <div>
                    <input type="radio" name="radio" class="buyway" value="1"/>
                    <span>线下交易</span>
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
                       cost="0" style="width: 18px;height: 18px;position: relative;top:.3vh;right: 1%;"/>
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