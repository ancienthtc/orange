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
                <a href="<%=basePath%>user/toAddress">
                    你还没有设置收货地址 请前往个人中心添加
                </a>
            </div>
        </c:if>

    </div>
    <div class="aui-dri"></div>
    <div class="aui-list-product-float-item">

        <c:forEach var="i" items="${goodsList}">
            <a href="javascript:;" class="aui-list-product-fl-item">
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


        <a href="javascript:;" class="aui-list-product-fl-item">
            <div class="aui-list-product-fl-img">
                <img src="<%=basePath%>fontpage/img/g_1705310944410103520.jpg" alt="">
            </div>
            <div class="aui-list-product-fl-text">
                <h3 class="aui-list-product-fl-title">
                    2018新上市柠檬
                </h3>
                <h3 class="aui-list-product-fl-title" style="text-align: left;margin-left: 10px;width: 60px;">
                    规格名
                </h3>
                <div class="aui-list-product-fl-mes">
                    <div>
							<span class="aui-list-product-item-price">
								<span style="color:#999;">&nbsp;&nbsp;单价:</span>
								<em>¥</em>
								200.00
							</span>
                        <span style="position: relative;left: 1px;">x3</span>
                        <span>个</span>
                    </div>
                </div>
            </div>
            <div class="sp_zj">¥600.00</div>
        </a>
        <a href="javascript:;" class="aui-list-product-fl-item">
            <div class="aui-list-product-fl-img">
                <img src="<%=basePath%>fontpage/img/g_1705310944410103520.jpg" alt="">
            </div>
            <div class="aui-list-product-fl-text">
                <h3 class="aui-list-product-fl-title">
                    2018新上市柠檬
                </h3>
                <h3 class="aui-list-product-fl-title" style="text-align: left;margin-left: 10px;width: 60px;">
                    规格名
                </h3>
                <div class="aui-list-product-fl-mes">
                    <div>
							<span class="aui-list-product-item-price">
								<span style="color:#999;">&nbsp;&nbsp;单价:</span>
								<em>¥</em>
								200.00
							</span>
                        <span style="position: relative;left: 1px;">x3</span>
                        <span>个</span>
                    </div>
                </div>
            </div>
            <div class="sp_zj">¥600.00</div>
        </a>
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
                <input onclick="checked=chk=!chk;" onmouseover="chk=checked;" type="radio" class="score" value="${sessionScope.user.score}"
                       cost="1" style="width: 18px;height: 18px;position: relative;top:.3vh;right: 1%;"/>
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
        <a class="settlement" class="submit">提交订单</a>
    </div>
</section>

</body>

<script src="<%=basePath%>fontpage/js/jquery-1.10.2.js"></script>

<script>

    $(".submit").click(function () {
        //aid


        //goodslist


        //score 0 / 1

    });

</script>

</html>