<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/24
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
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
    <link rel="stylesheet" href="<%=basePath%>css/admin/other.css"/>

    <script src="<%=basePath%>backpage/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/Validform/5.3.2/Validform.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/typeahead-bs2.min.js"></script>
    <%--<script src="<%=basePath%>backpage/assets/js/jquery.dataTables.min.js"></script>--%>
    <%--<script src="<%=basePath%>backpage/assets/js/jquery.dataTables.bootstrap.js"></script>--%>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/js/lrtk.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>修改</title>
    <style type="text/css">
        /*.formControls{width: 10% !important;}*/
        .form-label {
            margin: 0px 0 10px 0 !important;
        }

        .layui-layer {
            width: 30%;
            left: 35% !important;
            top: 70px !important;
        }
    </style>
</head>
<body>
<!--修改管理员-->
<div id="add_administrator_style" class="add_menber layui-layer layui-anim layui-layer-page " style="display:block;">
    <div class="layui-layer-title" style="cursor: move;" move="ok">修改管理员</div>
    <form action="<%=basePath%>admin/alter" method="post" id="form-admin-add">
        <input type="hidden" name="id" value="${admin.id}">
        <div class="form-group">
            <label class="form-label"><span class="c-red">*</span>管理员：</label>
            <div class="formControls">
                <input type="text" class="input-text" value="${admin.admin}" placeholder="请输入登录名" id="user-name" name="admin"
                       datatype="*2-16" nullmsg="登录名不能为空">
            </div>
            <div class="col-4"><span class="Validform_checktip"></span></div>
        </div>

        <div class="form-group">
            <label class="form-label"><span class="c-red">*</span>密码：</label>
            <div class="formControls">
                <input type="text" placeholder="请输入密码" name="password" autocomplete="off" value="${admin.password}" class="input-text"
                       datatype="*4-20" nullmsg="密码不能为空">
            </div>
            <div class="col-4"><span class="Validform_checktip"></span></div>
        </div>

        <div class="form-group">
            <label class="form-label"><span class="c-red">*</span>姓名：</label>
            <div class="formControls">
                <input type="text" class="input-text" value="${admin.name}" placeholder="请输入中文姓名" name="name" datatype="*2-16"
                       nullmsg="中文姓名不能为空">
            </div>
            <div class="col-4"><span class="Validform_checktip"></span></div>
        </div>

        <div class="form-group">
            <label class="form-label"><span class="c-red">*</span>姓名(日)：</label>
            <div class="formControls">
                <input type="text" class="input-text" value="${admin.nameJ}" placeholder="请输入日文姓名" name="nameJ" datatype="*0-16"
                       >
            </div>
            <div class="col-4"><span class="Validform_checktip"></span></div>
        </div>

        <div class="form-group">
            <label class="form-label">角色：</label>
            <div class="formControls ">
                    <span class="select-box" style="width:150px;">
                        <select class="select" name="level" size="1">

                            <c:if test="${admin.level==0}">
                                <option value="0">普通管理员</option>
                            </c:if>
                            <c:if test="${admin.level==1}">
                                <option value="1">高级管理员</option>
                            </c:if>
                            <c:if test="${admin.level==2}">
                                <option value="2">超级管理员</option>
                            </c:if>

                            <c:if test="${sessionScope.admin.level>0}">
                                <option value="0">普通管理员</option>
                            </c:if>
                            <c:if test="${sessionScope.admin.level>1}">
                                <option value="1">高级管理员</option>
                            </c:if>
                            <c:if test="${sessionScope.admin.level>2}">
                                <option value="2">超级管理员</option>
                            </c:if>
                        </select>
                    </span>
            </div>
        </div>

        <div style="text-align: center;">
            <input class="btn btn-primary radius" type="submit" id="Add_Administrator"
                   value="&nbsp;&nbsp;提交&nbsp;&nbsp;">

            <a class="btn btn-primary radius" href="javascript:history.back(-1)">取消</a>
        </div>


    </form>

</div>
</body>
</html>
<script type="text/javascript">
    /*修改管理员*/
    $('.x_gai').on('click', function () {
        layer.open({
            type: 1,
            title: '修改信息',
            area: ['700px', ''],
            shadeClose: false,
            content: $('#add_administrator_style1'),

        });
    })
    //表单验证提交
    $("#form-admin-add").Validform({

        tiptype: 2,

        callback: function (data) {
            //form[0].submit();
            if (data.status == 1) {
                layer.msg(data.info, {icon: data.status, time: 1000}, function () {
                    location.reload();//刷新页面
                });
            }
            else {
                layer.msg(data.info, {icon: data.status, time: 3000});
            }
            var index = parent.$("#iframe").attr("src");
            parent.layer.close(index);
            //
        }


    });
    //修改  表单验证提交
    $("#form-admin-add1").Validform({
        tiptype: 2,
        callback: function (data) {
            //form[0].submit();
            if (data.status == 1) {
                layer.msg(data.info, {icon: data.status, time: 1000}, function () {
                    location.reload();//刷新页面
                });
            }
            else {
                layer.msg(data.info, {icon: data.status, time: 3000});
            }
            var index = parent.$("#iframe").attr("src");
            parent.layer.close(index);
            //
        }
    });
</script>