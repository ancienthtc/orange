<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/24
  Time: 16:18
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
    <script src="<%=basePath%>backpage/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/laydate/laydate.js" type="text/javascript"></script>
    <%--<script src="assets/js/bootstrap.min.js"></script>--%>
    <%--<script src="assets/js/typeahead-bs2.min.js"></script>--%>
    <%--<script src="assets/js/jquery.dataTables.min.js"></script>--%>
    <%--<script src="assets/js/jquery.dataTables.bootstrap.js"></script>--%>
    <title>管理员信息</title>
    <style>
        .admin_info_style .admin_modify_style {
            float: none;
            margin: auto;
            border-right: none;
            border: 1px solid #dddddd;
        }

        .type_title {
            width: 100%;
            height: 40px;
            line-height: 40px;
            background: #F8F8F8;
            text-align: center;
            font-size: 17px;
        }

        .admin_info_style .Button_operation button {
            float: none;
            margin-bottom: 10px;
        }

        .btn {
            margin-right: auto;
        }

        /*.btn-success{margin:10px auto;}*/
        #Personal {
            height: auto !important;
        }

        .admin_info_style .Button_operation .btn-success {
            margin: auto;
        }

        #Personal {
            margin-top: 140px !important;
        }

        .btn-warning {
            margin-left: 8%;
        }
    </style>
</head>
<body>
<div class="clearfix">
    <div class="admin_info_style">
        <div class="admin_modify_style" id="Personal" style="height: auto;">
            <div class="type_title">管理员信息</div>
            <input id="aid" type="hidden" value="${sessionScope.admin.id}">
            <div class="xinxi">
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                                               for="form-field-1">用户名： </label>
                    <div class="col-sm-9"><input type="text" name="admin" id="admin" value="${sessionScope.admin.admin}"
                                                 class="col-xs-7 text_info" disabled="disabled">
                        &nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="change_Password()"
                                             class="btn btn-warning btn-xs">修改密码</a></div>

                </div>
                <%--<div class="form-group"><label class="col-sm-3 control-label no-padding-right"--%>
                                               <%--for="form-field-1">性别： </label>--%>
                    <%--<div class="col-sm-9">--%>
                        <%--<span class="sex">男</span>--%>
                        <%--<div class="add_sex">--%>
                            <%--<label><input name="form-field-radio" type="radio" class="ace" checked="checked"><span--%>
                                    <%--class="lbl">保密</span></label>&nbsp;&nbsp;--%>
                            <%--<label><input name="form-field-radio" type="radio" class="ace"><span--%>
                                    <%--class="lbl">男</span></label>&nbsp;&nbsp;--%>
                            <%--<label><input name="form-field-radio" type="radio" class="ace"><span--%>
                                    <%--class="lbl">女</span></label>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                                               for="form-field-1">名字： </label>
                    <div class="col-sm-9"><input type="text" name="name" id="name" value="${sessionScope.admin.name}"
                                                 class="col-xs-7 text_info" disabled="disabled"></div>
                </div>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                                               for="form-field-1">名字(日)： </label>
                    <div class="col-sm-9"><input type="text" name="nameJ" id="nameJ" value="${sessionScope.admin.nameJ}"
                                                 class="col-xs-7 text_info" disabled="disabled"></div>
                </div>

                <%--<div class="form-group"><label class="col-sm-3 control-label no-padding-right"--%>
                                               <%--for="form-field-1">电子邮箱： </label>--%>
                    <%--<div class="col-sm-9"><input type="text" name="电子邮箱" id="website-title" value="567890@qq.com"--%>
                                                 <%--class="col-xs-7 text_info" disabled="disabled"></div>--%>
                <%--</div>--%>

                <%--<div class="form-group"><label class="col-sm-3 control-label no-padding-right"--%>
                                               <%--for="form-field-1">QQ： </label>--%>
                    <%--<div class="col-sm-9"><input type="text" name="QQ" id="website-title" value="456789787"--%>
                                                 <%--class="col-xs-7 text_info" disabled="disabled"></div>--%>
                <%--</div>--%>

                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                                               for="form-field-1">权限： </label>
                    <div class="col-sm-9">
                        <c:if test="${sessionScope.admin.level == 0}">
                            <span>普通管理员</span>
                        </c:if>
                        <c:if test="${sessionScope.admin.level == 1}">
                            <span>高级管理员</span>
                        </c:if>
                        <c:if test="${sessionScope.admin.level == 2}">
                            <span>超级管理员</span>
                        </c:if>
                        <c:if test="${sessionScope.admin.level == 3}">
                            <span>顶级管理员</span>
                        </c:if>
                    </div>
                </div>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right"
                                               for="form-field-1">创建时间： </label>
                    <div class="col-sm-9">
                        <span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${sessionScope.admin.alogin}" /></span>
                    </div>
                </div>
                <div class="Button_operation clearfix">
                    <button onclick="modify();" class="btn btn-danger radius" type="submit">修改信息</button>
                    <button onclick="save_info();" class="btn btn-success radius" type="button">保存修改</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--修改密码样式-->
<div class="change_Pass_style" id="change_Pass">
    <ul class="xg_style">
        <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class=""
                                                                          id="password"></li>
        <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class=""
                                                                          id="Nes_pas"></li>
        <li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>

    </ul>
    <!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
</div>
</body>
</html>
<script>

    //按钮点击事件
    function modify() {
        $('.text_info').attr("disabled", false);
        $('.text_info').addClass("add");
        $('#Personal').find('.xinxi').addClass("hover");
        $('#Personal').find('.btn-success').css({'display': 'block'});
    };

    function save_info() {
        var num = 0;
        var str = "";
        $(".xinxi input[type$='text']").each(function (n) {

            if( $(this).attr("name") == "nameJ" )
            {
                return true;
            }

            if ($(this).val() == "") {

                layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
                    title: '提示框',
                    icon: 0,
                });
                num++;
                return false;
            }
        });
        if (num > 0) {
            return false;
        }
        else {
            //修改ajax
            var id = $("#aid").val();
            var admin = $("#admin").val();
            var name = $("#name").val();
            var nameJ = $("#nameJ").val();
            var data = {id:id,admin:admin,name:name,nameJ:nameJ} ;
            $.ajax({
                url: "<%=basePath%>admin/alterMe",
                type: 'post',
                //contentType : 'application/json',
                dataType: 'json',
                data: data,
                success: function (data) {
                    if(data == true)
                    {
                        layer.alert('修改成功！', {
                            title: '提示框',
                            icon: 1,
                        });
                        $('#Personal').find('.xinxi').removeClass("hover");
                        $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
                        $('#Personal').find('.btn-success').css({'display': 'none'});
                        layer.close(index);
                    }
                    else
                    {
                        layer.alert('修改失败！', {
                            title: '提示框',
                            icon: 1,
                        });
                        $('#Personal').find('.xinxi').removeClass("hover");
                        $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
                        $('#Personal').find('.btn-success').css({'display': 'none'});
                        layer.close(index);
                    }
                },
                error: function () {
                    alert('服务器繁忙..请稍后重试！');
                }
            });

        }
    };
    //初始化宽度、高度
    $(".admin_modify_style").height($(window).height());
    $(".recording_style").width($(window).width() - 400);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".admin_modify_style").height($(window).height());
        $(".recording_style").width($(window).width() - 400);
    });

    //修改密码
    function change_Password() {
        layer.open({
            type: 1,
            title: '修改密码',
            area: ['300px', '300px'],
            shadeClose: true,
            content: $('#change_Pass'),
            btn: ['确认修改'],
            yes: function (index, layero) {
                if ($("#password").val() == "") {
                    layer.alert('原密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }
                if ($("#Nes_pas").val() == "") {
                    layer.alert('新密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }

                if ($("#c_mew_pas").val() == "") {
                    layer.alert('确认新密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }
                if (!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
                    layer.alert('密码不一致!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }
                else {
                    //密码ajax
                    var id = $("#aid").val();
                    var oldPass = $("#password").val();
                    var newPass = $("#Nes_pas").val();
                    var data = {id:id,oldPass:oldPass,newPass:newPass};
                    $.ajax({
                        url: "<%=basePath%>admin/alterMePass",
                        type: 'post',
                        //contentType : 'application/json',
                        dataType: 'json',
                        data: data,
                        success: function (data) {
                            if(data == true)
                            {
                                layer.alert('修改成功！', {
                                    title: '提示框',
                                    icon: 1,
                                });
                                layer.close(index);
                            }
                            else
                            {
                                layer.alert('修改失败！', {
                                    title: '提示框',
                                    icon: 1,
                                });
                                layer.close(index);
                            }
                        },
                        error: function () {
                            alert('服务器繁忙..请稍后重试！');
                        }
                    });

                }
            }
        });
    }

</script>
<script>
    jQuery(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 2, 3, 4, 5, 6]}// 制定列不参与排序
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
    });</script>
