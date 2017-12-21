<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="<%=basePath%>backpage/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/css/style.css"/>
    <link href="<%=basePath%>backpage/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="<%=basePath%>backpage/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/typeahead-bs2.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/jquery.dataTables.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/js/displayPart.js" type="text/javascript"></script>
    <title>交易金额</title>
</head>

<body>
<div class="clearfix">
    <div class="Order_Statistics ">
        <div class="title_name">订单统计信息</div>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="name">未处理订单：</td>
                <td class="munber"><a href="#">0</a>&nbsp;个</td>
            </tr>
            <tr>
                <td class="name">待发货订单：</td>
                <td class="munber"><a href="#">10</a>&nbsp;个</td>
            </tr>
            <tr>
                <td class="name">待结算订单：</td>
                <td class="munber"><a href="#">13</a>&nbsp;个</td>
            </tr>
            <tr>
                <td class="name">已成交订单数：</td>
                <td class="munber"><a href="#">26</a>&nbsp;个</td>
            </tr>
            <tr>
                <td class="name">交易失败：</td>
                <td class="munber"><a href="#">26</a>&nbsp;个</td>
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
                <td class="munber"><a href="#">340</a>&nbsp;个</td>
            </tr>
            <tr>
                <td class="name">回收站商品：</td>
                <td class="munber"><a href="#">10</a>&nbsp;个</td>
            </tr>
            <tr>
                <td class="name">上架商品：</td>
                <td class="munber"><a href="#">13</a>&nbsp;个</td>
            </tr>
            <tr>
                <td class="name">下架商品：</td>
                <td class="munber"><a href="#">26</a>&nbsp;个</td>
            </tr>
            <tr>
                <td class="name">商品评论：</td>
                <td class="munber"><a href="#">21s6</a>&nbsp;条</td>
            </tr>

            </tbody>
        </table>
    </div>
</div>
</body>
</html>
<script>
    $(function () {
        $(".displayPart").displayPart();
    });
    $(function () {
        var oTable1 = $('#sample-table').dataTable({
            //"aaSorting": [],//默认第几个排序
            "bStateSave": true,//状态保存
            //"dom": 't',
            "bFilter": false,
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 1, 2, 3, 4, 5, 6]}// 制定列不参与排序
            ]
        });
        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });
    })

    /*店铺-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', {icon: 0,}, function (index) {
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }

    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Refund_detailed').on('click', function () {
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
</script>
