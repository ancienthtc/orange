<%@ page import="java.util.Date" %>
<%@ page import="com.jd.orange.util.date.DateExample" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" type="image/x-icon" href="<%=basePath%>favicon.ico">
    <link href="<%=basePath%>backpage/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/font-awesome.min.css"/>
    <link href="<%=basePath%>backpage/assets/css/codemirror.css" rel="stylesheet">
    <!--[if IE 7]>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="<%=basePath%>backpage/assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="<%=basePath%>backpage/assets/js/html5shiv.js"></script>
    <script src="<%=basePath%>backpage/assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="<%=basePath%>backpage/assets/js/jquery.min.js"></script>
    <!-- <![endif]-->
    <script src="<%=basePath%>backpage/assets/dist/echarts.js"></script>
    <script src="<%=basePath%>backpage/assets/js/bootstrap.min.js"></script>
    <title></title>
</head>
<body>
<div class="page-content clearfix">
    <div class="alert alert-block alert-success">
        <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
        <i class="icon-ok green"></i>欢迎使用<strong class="green">后台管理系统
        <small>(v1.2)</small>
    </strong>,你本次登陆时间为 <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${sessionScope.admin.alogin}" />.
    </div>
    <div class="state-overview clearfix">
        <div class="col-lg-3 col-sm-6">
            <section class="panel">
                <a href="#" title="商城会员">
                    <div class="symbol terques">
                        <i class="icon-user"></i>
                    </div>
                    <div class="value">
                        <h1>${userAmount}</h1>
                        <p>商城用户</p>
                    </div>
                </a>
            </section>
        </div>
        <div class="col-lg-3 col-sm-6">
            <section class="panel">
                <div class="symbol yellow">
                    <i class="icon-shopping-cart"></i>
                </div>
                <div class="value">
                    <h1>${orderAmount}</h1>
                    <p>商城订单</p>
                </div>
            </section>
        </div>
    </div>
    <!--实时交易记录-->
    <div class="clearfix">
        <div class="Order_Statistics ">
            <div class="title_name">订单统计信息</div>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="name">未处理订单：</td>
                    <td class="munber"><a href="#">${cal.orderCountNoSure}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">待发货订单：</td>
                    <td class="munber"><a href="#">${cal.orderCountNoSend}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">待付款订单：</td>
                    <td class="munber"><a href="#">${cal.orderCountNoPay}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">已完成订单数：</td>
                    <td class="munber"><a href="#">${cal.orderCountFinish}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">交易失败：</td>
                    <td class="munber"><a href="#">${cal.orderCountCancel}</a>&nbsp;个</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="Order_Statistics">
            <div class="title_name">商品统计信息</div>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="name">商品总数：</td>
                    <td class="munber"><a href="#">${cal.goodsCount}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">下架商品：</td>
                    <td class="munber"><a href="#">${cal.goodsCountUnder}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">上架商品：</td>
                    <td class="munber"><a href="#">${cal.goodsCountLoad}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">总规格数：</td>
                    <td class="munber"><a href="#">${cal.goodsFormatCount}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">总销量：</td>
                    <td class="munber"><a href="#">${cal.goodsAllSales}</a>&nbsp;个</td>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
    <!--记录-->
</div>
</body>
</html>
<script type="text/javascript">
    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.no-radius').on('click', function () {
        var cname = $(this).attr("title");
        var chref = $(this).attr("href");
        var cnames = parent.$('.Current_page').html();
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe').html(cname);
        parent.$('#iframe').attr("src", chref).ready();
        ;
        parent.$('#parentIframe').css("display", "inline-block");
        parent.$('.Current_page').attr({"name": herf, "href": "javascript:void(0)"}).css({
            "color": "#4c8fbd",
            "cursor": "pointer"
        });
        //parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
        parent.layer.close(index);

    });
    $(document).ready(function () {

        $(".t_Record").width($(window).width() - 640);
        //当文档窗口发生改变时 触发
        $(window).resize(function () {
            $(".t_Record").width($(window).width() - 640);
        });
    });


</script>