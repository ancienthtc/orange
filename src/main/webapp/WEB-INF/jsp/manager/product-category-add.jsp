<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="<%=basePath%>backpage/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/font-awesome.min.css"/>
    <link href="<%=basePath%>backpage/Widget/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="<%=basePath%>backpage/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/bootstrap.min.js"></script>
    <title>添加产品分类</title>
</head>
<body>
<div class="type_style">
    <div class="type_title">添加产品分类</div>
    <div class="type_content">
        <%--<div class="Operate_btn">--%>
            <%--<a class="btn  btn-warning"><i class="icon-edit align-top bigger-125"></i>新增商品类型</a>--%>

        <%--</div>--%>
        <form action="<%=basePath%>part/add" method="post" class="form form-horizontal" id="form-user-add">
            <div class="Operate_cont clearfix">
                <label class="form-label"><span class="c-red">中文&nbsp;&nbsp;&nbsp;&nbsp;</span>分类名称：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder="" name="name">
                </div>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label"><span class="c-red">日文&nbsp;&nbsp;&nbsp;&nbsp;</span>分类名称：</label>
                <div class="formControls ">
                    <input type="text" class="input-text1" value="" placeholder="" name="nameJ">
                </div>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label">优先顺序：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="0" placeholder="" id="user-name" name="priority">
                </div>
                <label class="form-label">(填写整数，数字越大优先越高)</label>
            </div>
            <div class="Operate_cont clearfix">
                <label class="form-label"><span class="c-red"></span>创建分类类型：</label>
                <select id="city1" name="belong" onchange="" style="margin-left:10px;width: 150px;">
                    <option value="-1">创建一级父分类</option>
                    <c:forEach var="item" items="${parts}">
                        <option value="${item.id}">${item.name} / ${item.nameJ}</option>
                    </c:forEach>

                </select>
                <select id="city2" name="belong" style="margin-left:10px;width: 150px;">

                </select>
            </div>
            <div style="width: 100%;height:10px;"></div>
            <div class="">
                <div class="" style=" text-align:center">
                    <input class="btn btn-primary radius" type="submit" value="提交" id="sub">
                </div>
            </div>
        </form>
    </div>
</div>
</div>
<script type="text/javascript" src="<%=basePath%>backpage/Widget/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/assets/layer/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.admin.js"></script>

<script type="text/javascript">
    $(function(){
        //给下拉列表添加事件
        $("#city1").change(function(){
            //测试可以拿到值，也用于测试是否正确引入js
            //alert($(this).val()+" "+$("#city1 option:selected").text()+" "+$("#city2 option:selected").text());
            //post传输，固定四个参数；
            //第一个参数是url:发送请求地址
            //第二个参数data:待发送的值keyalue
            //第三个参数callback:发送返回时回调函数
            //第四个参数type:返回内容格式，常用text，json,
            $.post("<%=basePath%>part/getPartChoiceChild",{id:$(this).val()},
                function(result){
                    console.log(result);
                    //获取第二级城市的id
                    var city2=$("#city2");
                    //清空第二级里面的城市
                    city2.empty();
                    if(result.length>0)
                    {
                        city2.append("<option value='-2'>创建二级子分类</option>");
                    }
                    for(var i=0;i<result.length;i++)
                    {
                        city2.append("<option value="+result[i].id+">"+result[i].name+" / "+result[i].nameJ+"</option>");
                    }

            },"json");
        });
    });
</script>

<%--<script type="text/javascript">--%>
    <%--//这个 请选择 选项 加的很好。--%>
    <%--var jiaArr = ["请选择", "苹果", "香蕉", "橘子"];--%>
    <%--var exampleArr = [--%>
        <%--["请选择"],--%>
        <%--["请选择", "红富士", "蛇果", "大苹果"],--%>
        <%--["请选择", "香蕉1", "香蕉2", "香蕉3"],--%>
        <%--["请选择", "橘子1", "橘子2", "橘子3"]--%>
    <%--];--%>
    <%--window.onload = function () {--%>

        <%--var selJia = document.getElementById("jia");--%>
        <%--//申请空间--%>
        <%--selJia.length = jiaArr.length;--%>
        <%--//添加元素--%>
        <%--for (var i = 0; i < jiaArr.length; i++) {--%>
            <%--selJia.options[i].text = jiaArr[i];--%>
            <%--selJia.options[i].value = jiaArr[i];--%>
        <%--}--%>
    <%--}--%>

    <%--function ChangeExampleSelect(index) {--%>
        <%--var selExa = document.getElementById("example");--%>

        <%--selExa.length = exampleArr[index].length;--%>

        <%--for (var i = 0; i < exampleArr[index].length; i++) {--%>
            <%--selExa.options[i].text = exampleArr[index][i];--%>
            <%--selExa.options[i].value = exampleArr[index][i];--%>
        <%--}--%>
    <%--}--%>

    <%--$(document).ready(function(){--%>

        <%--//表单提交--%>
        <%--// $("#sub").click(function () {--%>
        <%--//--%>
        <%--// });--%>

    <%--})--%>

<%--</script>--%>
<script type="text/javascript">
    $(".btn").click(function () {

        if ($(".input-text").val() == "") {
            alert("中文分类名称不能为空！");
            return false;
        }
        ;
        if ($(".input-text1").val() == "") {
            alert("日文分类名称不能为空！");
            return false;
        }
        ;
        var reg = /^([1-9]\d*|[0]{1,1})$/;
        if (!reg.test($("#user-name").val())) {
            alert("优先顺序只能为正整数!")
            return false;
        }

    })

    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-user-add").Validform({
            tiptype: 2,
            callback: function (form) {
                form[0].submit();
                var index = parent.layer.getFrameIndex(window.name);
                parent.$('.btn-refresh').click();
                parent.layer.close(index);
            }
        });
    });
</script>
</body>
</html>