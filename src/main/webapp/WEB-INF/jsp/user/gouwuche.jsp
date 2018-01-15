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
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-wap-web-app-capable" content="yes">
    <meta name="apple-wap-web-app-status-bar-style" content="black-translucent">
    <title>购物车 </title>

    <script src="<%=basePath%>fontpage/js/jquery-1.10.2.js"></script>
    <!-- ionic框架  css -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link href="<%=basePath%>fontpage/css/weixin.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>fontpage/css/ionic.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>fontpage/css/signin.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>fontpage/css/share.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/new_main.css"/>
    <!-- ionic框架  js   -->
    <script type="text/javascript" src="<%=basePath%>fontpage/js/ionic.bundle.min.js"></script>

    <script type="text/javascript" src="<%=basePath%>fontpage/js/runend.js"></script>

    <script type="text/javascript">
        $(function () {
            if (true) {
                $("#f4").html('<img src="<%=basePath%>fontpage/images/gouwuche1.png" width="30" height="30">');
                $("#t4").css("color", "#ee4b02");
            }
        });

        //定义全局变量
        var i = 0;

        //金额总和
        var money = 0;

        //计算合计价格
        var cart_money = new Object();

        //全部商品ID
        var cart_id = new Object();
        //备份商品ID，用于全选后去掉全选又再次全选
        var cart_id_copy = new Object();

    </script>
</head>
<body>
<div class="header">
    <a href="javascript:history.back(-1)">
        <img src="<%=basePath%>fontpage/images/zuojiantou.png"/>
    </a>
    <div>
        购物车
    </div>
    <a class="rig_shai" id="rem_s" href="javascript:void(0)"
       style="margin-right: 2%;position: absolute; top: 5px; right: 3%;">编辑</a>
</div>
<form method="post" name="cart_form" target="_self" id="cart_form" action="">
    <!--list-->
    <div class="commodity_list_box">
        <div class="cart_top">
            <span>橘子屋商品</span>
            <div class="clear"></div>
        </div>
        <!--商品列表-->
        <div class="commodity_box">
            <div class="commodity_list">
                <!--商品-->
                <ul class="commodity_list_term">

                    <c:forEach var="i" items="${carts}">
                        <li class="select">
                            <!--  -->
                            <c:if test="${not empty i.shelf}">
                                <em aem="0" cart_id="${i.id}" sub="true"></em>
                            </c:if>
                            <c:if test="${empty i.shelf}">
                                <em aem="0" cart_id="${i.id}" sub="false"></em>
                            </c:if>

                            <img src="<%=basePath%>image/goods?pic=${i.img.substring(i.img.lastIndexOf("\\") + 1)}"/>
                            <div class="div_center">
                                <c:if test="${not empty i.shelf}">
                                    <h4>${i.gname} ${i.fname}</h4>
                                    <span>${i.amount}${i.fclass}</span>
                                    <p class="now_value"><i>￥ </i><b class="qu_su">${i.all}</b></p>
                                </c:if>
                                <c:if test="${empty i.shelf}">
                                    <h4>商品已下架</h4>
                                </c:if>
                            </div>
                            <div class="div_right">
                                <%--<i onclick="reducew(this)">-</i>--%>
                                <%--<span class="zi">1</span>--%>
                                <input type="hidden" value="${i.id}">
                                <%--<i onclick="plusw(this)">+</i>--%>
                            </div>

                        </li>
                    </c:forEach>


                    <%--<li class="select">--%>
                        <%--<em aem="0" cart_id="84"></em>--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1705310944410103520.jpg"/>--%>
                        <%--<div class="div_center">--%>
                            <%--<h4>柠檬</h4>--%>
                            <%--<span>50斤</span>--%>
                            <%--<p class="now_value"><i>￥</i><b class="qu_su">100.00</b></p>--%>
                        <%--</div>--%>
                        <%--<div class="div_right">--%>
                            <%--<i onclick="reducew(this)">-</i>--%>
                            <%--<span class="zi">1</span>--%>
                            <%--<input type="hidden" value="84">--%>
                            <%--<i onclick="plusw(this)">+</i>--%>
                        <%--</div>--%>
                    <%--</li>--%>

                </ul>
            </div>
        </div>
        <!-- 商品列表 end -->
    </div>
    <!-- end -->
    <div style="width: 100%;height:17vh;"></div>
    <!-- footer -->
    <div class="settle_box">
        <dl class="all_check select">
            <dt><span id="all_pitch_on"></span>
                <div style="color:#ff900d;padding-left:8px;display: inline-block;font-size: 16px;">全选</div>
            </dt>
        </dl>
        <dl class="total_amount">
            <dt>合计：<p id="total_price">¥<b>0</b></p></dt>
            <dd>不含运费</dd>
        </dl>
        <input type="hidden" name="gcs" id="gcs"/>
        <a class="settle_btn" id="confirm_cart">结算</a>
        <a class="settle_btn" href="javascript:void(0);" id="confirm_cart1" onclick="big_cart_remove()">删除</a>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- end -->
</form>

<script>

    /* 编辑商品  */
    var topb = 0;
    $("#rem_s").click(function () {
        if (topb == 0) {
            $(this).text("完成");
            $(".total_amount").hide();
            /* 合计  */
            $("#confirm_cart").hide();
            /* 结算  */
            $("#confirm_cart1").show();
            /* 删除 */
            topb = 1;
        } else {
            topb = 0;
            $(this).text("编辑");
            $(".total_amount").show();
            /* 合计  */
            $("#confirm_cart").show();
            /* 结算  */
            $("#confirm_cart1").hide();
            /* 删除 */
            allThis.removeClass("pitch_on");
            /* 取消所有选择  */
            $("#all_pitch_on").removeClass("pitch_on");
            /* 取消所有选择  */
            $("#total_price b").text("0");
            /*合计价格清零*/
        }

    });

    //选择结算商品
    $(".select em").click(function () {
        if ($(this).hasClass("pitch_on"))
        {
            $(this).removeClass("pitch_on");
            Cal();
        }
        else
        {
            $(this).addClass("pitch_on");
            Cal();
        }



    })

    /* 底部全选  */
    $("#all_pitch_on").click(function () {
        if($(this).hasClass("pitch_on"))
        {
            $(".select em").removeClass("pitch_on");
            $(this).removeClass("pitch_on");
            Cal();
        }
        else
        {
            $(".select em").addClass("pitch_on");
            $(this).addClass("pitch_on");
            Cal();
        }


    });

    function Cal() {
        var all = $(".select em").length;   //物品个数
        var $elements = $(".select").children(".pitch_on:not([sub='false'])");
        var len = $elements.length;
        if(all==len && all > 0)
        {
            $("#all_pitch_on").addClass("pitch_on");
        }
        else if(len < all)
        {
            $("#all_pitch_on").removeClass("pitch_on");
        }
        //console.log(all);
        var json='';
        if(len>0)
        {
            json='{"Cart":[';
            $elements.each(function() {
                //var $this = $(this);
                //alert($this.prop('tagName'));
                json+='{"id":"'+$(this).attr("cart_id")+'"},';
            });
            json=json.substr(0,json.length-1);
            json+=']}';
            //console.log(json);
            //计算价格
            $.ajax({
                url: "../cart/getCal",
                type: 'post',
                contentType : 'application/json',
                dataType: 'json',
                data: json,
                success: function (data) {
                    console.log(data);
                    if(data.msg=="success")
                    {
                        $("#total_price").text("￥ "+data.all);
                    }
                    else
                    {
                        $("#total_price").text("￥ "+0);
                    }
                },
                error: function () {
                    alert('服务器繁忙..请稍后重试！');
                }
            });
        }
        else if(len==0)
        {
            $("#total_price").text("￥ "+0);
        }

        //$(".total_price").text(len);

    }

    //删除
    function big_cart_remove() {
        var $elements = $(".select").children(".pitch_on");
        var len=$elements.length;

        if(len>0)
        {
            var json='{"Cart":[';
            $elements.each(function() {
                var $this = $(this);
                json+='{"id":"'+$(this).attr("cart_id")+'"},';
            });
            json=json.substr(0,json.length-1);
            json+=']}';

            $.ajax({
                url: "../cart/cartDel",
                type: 'post',
                contentType : 'application/json',
                dataType: 'json',
                data: json,
                success: function (data) {
                    console.log(data);
                    if(data.msg=="success")
                    {
                        $(".commodity_list_term .pitch_on").parent().remove();
                        $(".commodity_list .tite_tim > em.pitch_on").parents(".commodity_box").remove();
                    }
                    else
                    {
                        window.location.href="<%=basePath%>cart/toCart";
                    }
                },
                error: function () {
                    alert('服务器繁忙..请稍后重试！');
                }
            });
        }
        else
        {

        }


    }

    //结算
    $("#confirm_cart").click(function () {
        var $elements = $(".select").children(".pitch_on:not([sub='false'])");
        var len=$elements.length;
        if( len>0 ) {
            var json = '{"Cart":[';
            $elements.each(function () {
                //var $this = $(this);
                json += '{"id":"' + $(this).attr("cart_id") + '"},';
            });
            json = json.substr(0, json.length - 1);
            json += ']}';

            //提交购物车
            var form = $("<form></form>");
            form.attr('action', "<%=basePath%>cart/commit");
            form.attr('method', 'post');
            form.attr('target', '_self');

            var input1 = $("<input type='hidden' name='json' />");
            input1.attr('value', json);
            form.append(input1);

            var input2 = $("<input type='hidden' name='type' />");
            input2.attr('value', 1);
            form.append(input2);

            form.appendTo("body");
            form.css('display', 'none');
            form.submit();
        }
        else
        {
            alert("请选择商品");
        }

    });

</script>
</body>
</html>