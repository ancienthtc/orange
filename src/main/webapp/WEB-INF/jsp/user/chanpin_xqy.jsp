<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>商品详情</title>
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
</head>
<body class="body_color">
<div class="mall_main">
    <div class="header">
        <a href="javascript:history.back(-1)">
            <img src="<%=basePath%>fontpage/images/zuojiantou.png"/>
        </a>
        <div>
            商品详情
        </div>
    </div>

    <div id="banner_box" class="box_swipe">
        <ul>
            <li>
                <img src="<%=basePath%>image/goods?pic=${goods.pic1}&&">
            </li>
            <li>
                <img src="<%=basePath%>image/goods?pic=${goods.pic2}&&">
            </li>
            <li>
                <img src="<%=basePath%>image/goods?pic=${goods.pic3}&&">
            </li>
        </ul>
        <ol>
            <li class="on"></li>
            &nbsp;
            <li></li>
            &nbsp;
            <li></li>
            &nbsp;
        </ol>
    </div>
    <div class="des_goods">
        <p>
            ${goods.name}
        </p>
        <%--<p>--%>
            <%--<span class="sp_style1">皮薄爽脆 口口诱人</span>--%>
        <%--</p>--%>
        <p>
            <span class="pr">价格:</span>
            <span class="sp_style3">
                ¥
                <c:if test="${goods.formats.size()>0}">
                    ${goods.formats.get(0).price}
                </c:if>
            </span>
        </p>
        <%--<p>--%>
            <%--<span class="pr">促销价</span><span class="sp_style3">¥398</span>--%>
        <%--</p>--%>
        <%--<p>--%>
            <%--<span class="pr">促销有效期：</span><span>2015-11-01~2015-11-30</span>--%>
        <%--</p>--%>
        <%--<p>--%>
            <%--<span class="pr">服务：</span><span>由微分销销售和发货并提供售后服务</span>--%>
        <%--</p>--%>
        <%--<p>--%>
            <%--<span class="pr">运费：</span><span>深圳至无锡</span><span>快递：6.00</span><span>EMS：14.00</span>--%>
        <%--</p>--%>
        <hr/>
        <div class="spec_select">
            <ul>
                <li>
                    <span>商品规格：</span>
                    <c:if test="${goods.formats.size()>1}">
                        <c:if test="${goods.formats.get(0).stock > 0}">
                            <em class="click" value="${goods.formats.get(0).id}">${goods.formats.get(0).fname}</em>
                        </c:if>
                        <c:forEach var="item" items="${goods.formats}" begin="1">
                            <c:if test="${item.stock > 0}">
                                <em value="${item.id}">${item.fname}</em>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${goods.formats.size()==1}">
                        <c:if test="${goods.formats.get(0).stock > 0}">
                            <em class="click" value="${goods.formats.get(0).id}">${goods.formats.get(0).fname}</em>
                        </c:if>
                    </c:if>
                </li>
            </ul>
        </div>
        <hr/>
        <div class="goods_activity">
            <%--<p>--%>
                <%--<span class="pr">备注</span>--%>
                <%--<a href="">--%>
                    <%--<span class="sp_style3">满200减10 满599减30</span>--%>
                <%--</a>--%>
            <%--</p>--%>
            <div class="num">
                <span>数量：</span>
                <span id="a" class="Spinner"></span>
                <span class="stock">库存
                    <c:if test="${goods.formats.size()>0}">
                        ${goods.formats.get(0).stock} ${goods.formats.get(0).fclass}
                    </c:if>
                </span>
            </div>
            <p>
                <span class="pr">服务承诺：</span><span>7天无理由退货 正品保证</span>
            </p>
            <p class="pay_type">
                <span class="pr">支付类别：</span>
                <span>
						<img src="<%=basePath%>fontpage/images/zhifubao.png" width="35" height="35">
						支付宝
						</span>
                <span>
						<img src="<%=basePath%>fontpage/images/weixin.png" width="32" height="30">
						微信
						</span>
                <span>
						<img src="<%=basePath%>fontpage/images/xianxiazhifu.png" width="28" height="28">
						线下支付
                </span>
            </p>
            <p>
                <span>留言:</span><span><input type="text" name="detail" placeholder="说点什么吧..." id="message"
     style="border: 1px solid #66666629;width: 84%;padding-bottom: 50px; border-radius: 4px;color: #666666;font-size: 14px;"></span>
            </p>
        </div>
    </div>

    <div class="box_list">
        <ul class="box_nav">
            <li class="current">
                <a>
                    商品详情
                </a>
            </li>
            <li>
                <a>
                    商品参数
                </a>
            </li>
        </ul>
        <div class="goods_box">
            <!-- 商品其他图片 -->
            <img src="<%=basePath%>fontpage/images/1.jpg" width="100%">
            <img src="<%=basePath%>fontpage/images/3.jpg" width="100%">
        </div>
        <div class="goods_box" style="display: none">
            <div class="deal_list">
                <p>
                    <span>产品参数1:</span><span>${goods.parameter1}</span>
                </p>
                <p>
                    <span>产品参数2:</span><span>${goods.parameter2}</span>
                </p>
                <p>
                    <span>产品参数3:</span><span>${goods.parameter3}</span>
                </p>
                <p>
                    <span style="width: 86%;height: auto;text-align: left;margin-left: 7%;">${goods.detail}</span>
                </p>
                <%--<p>--%>
                    <%--<span>18762678928</span><span>1<em>[xl,深蓝]</em></span><span>2015-12-04</span>--%>
                <%--</p>--%>
                <%--<p>--%>
                    <%--<span>18762678928</span><span>1<em>[xl,深蓝]</em></span><span>2015-12-04</span>--%>
                <%--</p>--%>
                <%--<p>--%>
                    <%--<span>18762678928</span><span>1<em>[xl,深蓝]</em></span><span>2015-12-04</span>--%>
                <%--</p>--%>
                <%--<p>--%>
                    <%--<span>18762678928</span><span>1<em>[xl,深蓝]</em></span><span>2015-12-04</span>--%>
                <%--</p>--%>
            </div>
        </div>
    </div>
    <div class="bottomdiv clearfix">
        <div class="inner clearfix">
            <div class="fl btn_sure">
                <a class="buy">
                    立即购买
                </a>
            </div>
            <div class="fl btn_buy_detail">
                <a class="addshop_cat" >
                    加入购物车
                </a>
            </div>
        </div>

    </div>
</div>

<script>

</script>

<script src="<%=basePath%>fontpage/js/swipe2.js" type="text/javascript"></script>
<script type="text/javascript">$(function () {
    new Swipe(document.getElementById('banner_box'), {
        speed: 500,
        auto: 3000,
        callback: function () {
            var lis = $(this.element).next("ol").children();
            lis.removeClass("on").eq(this.index).addClass("on");
        }
    });
});</script>

<script type="text/javascript">

    $(function () {

        $(".spec_select ul li em").click(function () {
            $(this).addClass("click").siblings().removeClass("click");

            //ajax
            //console.log(  $(this).attr("value") );
            $.ajax({
                url:"<%=basePath%>goods/getFormat",
                data:{fid:$(this).attr("value")},
                contentType:"application/x-www-form-urlencoded;charset=UTF-8",
                type:"post",
                dataType:"text",
                success:function(result){
                    //console.log(result);
                    var jsondata = $.parseJSON(result);
                    $(".sp_style3").text("¥"+jsondata.price);
                    $(".stock").text("库存: "+jsondata.stock + " "+ jsondata.fclass);
                },
                error:function(){
                    alert("请求失败");
                }
            });

    })

        $(".addshop_cat").click(function () {
            //console.log( "fid:"+$(".click").attr("value") );
            //console.log("amount:"+$(".Amount").val() );
            var url="<%=basePath%>cart/add";

            var $choice = $(".click");
            if($choice.length==0)
            {
                alert("请选择规格");
                return;
            }

            var info={format:$(".click").attr("value"),amount:$(".Amount").val(),detail:$("#message").val()};

            $.post(url,info,
                function(result){
                    console.log(result);
                    if(result=="true")
                    {
                        alert("加入成功");
                    }
                    else
                    {
                        alert(result);
                        if(result=="请先登录")
                        {
                            window.location.href="<%=basePath%>login/login";
                        }
                    }
                },"text");
        });


        $(".buy").click(function () {
            var json='{"format":"'+$(".click").attr("value")+'","amount":"'+$(".Amount").val()+'","detail":"'+$("#message").val()+'"}';

            //提交购物车
            var form = $("<form></form>");
            form.attr('action', "<%=basePath%>cart/commit");
            form.attr('method', 'post');
            form.attr('target', '_self');

            var input1 = $("<input type='hidden' name='json' />");
            input1.attr('value', json);
            form.append(input1);

            var input2 = $("<input type='hidden' name='type' />");
            input2.attr('value', 0);
            form.append(input2);

            form.appendTo("body");
            form.css('display', 'none');
            form.submit();

        });


    })
</script>

<!--商品数量加减-->
<script type="text/javascript">$(function () {
    $("#a").Spinner({
        value: 1,
        min: 1,
        len: 3,
        max: 10000
    });
});</script>
<script type="text/javascript">jQuery(function ($) {
    $('.box_list ul li').click(function () {
        var index = $('.box_list ul li').index(this);
        $(this).addClass('current').siblings('li').removeClass('current');
        $('.box_list .goods_box:eq(' + index + ')').show().siblings('.goods_box').hide();
    })
})</script>
</body>
</html>