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
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/Validform/5.3.2/Validform.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/typeahead-bs2.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/jquery.dataTables.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/js/lrtk.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>管理员</title>
</head>

<body>
<div class="page-content clearfix">
    <div class="administrator">
        <div class="d_Confirm_Order_style">
            <div class="search_style">

                <ul class="search_content clearfix">
                    <li>
                        <label class="l_f">管理员名称</label>
                        <input name="" type="text" class="text_add" placeholder="中、日姓名，登录名" style=" width:400px"/>
                    </li>
                    <li>
                        <label class="l_f">开始时间</label>
                        <input class="inline laydate-icon" id="start" style=" margin-left:10px;">
                    </li>
                    <li>
                        <label class="l_f">结束时间</label>
                        <input class="inline laydate-icon" id="start1" style=" margin-left:10px;">
                    </li>
                    <li style="width:90px;">
                        <button type="button" class="btn_search"><i class="fa fa-search"></i>查询</button>
                    </li>
                </ul>
            </div>
            <!--操作-->
            <div class="border clearfix">
                <span class="l_f">
                    <a href="#" id="administrator_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
                </span>
                <span class="r_f">共：<b>5</b>人</span>
            </div>
            <!--管理员列表-->
            <div class="clearfix administrator_style" id="administrator">
                <div class="left_style"></div>
                <div class="table_menu_list" id="testIframe">
                    <table class="table table-striped table-bordered table-hover" id="sample_table">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                            </th>
                            <th width="80px">管理员编号</th>
                            <th width="250px">登录名</th>
                            <th width="100px">姓名</th>
                            <th width="100px">级别</th>
                            <th width="180px">上次登录时间</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">

                            <%--<c:forEach var="i" items="${admin}">--%>
                                <%--<tr>--%>
                                    <%--<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>--%>
                                    <%--<td>${i.id}</td>--%>
                                    <%--<td>${i.admin}</td>--%>
                                    <%--<td>${i.name}</td>--%>
                                    <%--<td>${i.level}</td>--%>
                                    <%--<td>${i.alogin}</td>--%>
                                    <%--<td class="td-manage">--%>
                                        <%--<a class="btn btn-xs btn-info x_gai"><i class="fa fa-edit bigger-120"></i></a>--%>
                                        <%--<a title="删除" href="javascript:;" onclick="member_del(this,'1')"--%>
                                           <%--class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                            <%--</c:forEach>--%>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!--添加管理员-->
    <div id="add_administrator_style" class="add_menber" style="display:none">
        <form action="" method="post" id="form-admin-add">
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>管理员：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="" placeholder="" id="user-name" name="user-name"
                           datatype="*2-16" nullmsg="用户名不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>初始密码：</label>
                <div class="formControls">
                    <input type="password" placeholder="密码" name="userpassword" autocomplete="off" value=""
                           class="input-text" datatype="*6-20" nullmsg="密码不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>确认密码：</label>
                <div class="formControls ">
                    <input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error"
                           errormsg="您两次输入的新密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="userpassword"
                           id="newpassword2" name="newpassword2">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>性别：</label>
                <div class="formControls  skin-minimal">
                    <label><input name="form-field-radio" type="radio" class="ace" checked="checked"><span class="lbl">保密</span></label>&nbsp;&nbsp;
                    <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;
                    <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">女</span></label>
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>手机：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder="" id="user-tel" name="user-tel"
                           datatype="m" nullmsg="手机不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>邮箱：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" placeholder="@" name="email" id="email" datatype="e"
                           nullmsg="请输入邮箱！">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label">角色：</label>
                <div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="admin-role" size="1">
					<option value="0">超级管理员</option>
					<option value="1">管理员</option>
					<option value="2">栏目主辑</option>
					<option value="3">栏目编辑</option>
				</select>
				</span></div>
            </div>
            <div class="form-group">
                <label class="form-label">备注：</label>
                <div class="formControls">
                    <textarea name="" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内" dragonfly="true"
                              onkeyup="checkLength(this);"></textarea>
                    <span class="wordage">剩余字数：<span id="sy" style="color:Red;">100</span>字</span>
                </div>
                <div class="col-4"></div>
            </div>
            <div style="text-align: center;">
                <input class="btn btn-primary radius" type="submit" id="Add_Administrator"
                       value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </form>

    </div>

    <!--修改管理员-->
    <div id="add_administrator_style1" class="add_menber" style="display:none">
        <form action="" method="post" id="form-admin-add1">
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>管理员：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="" placeholder="" id="user-name" name="user-name"
                           datatype="*2-16" nullmsg="用户名不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>初始密码：</label>
                <div class="formControls">
                    <input type="password" placeholder="密码" name="userpassword" autocomplete="off" value=""
                           class="input-text" datatype="*6-20" nullmsg="密码不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>确认密码：</label>
                <div class="formControls ">
                    <input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error"
                           errormsg="您两次输入的新密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="userpassword"
                           id="newpassword2" name="newpassword2">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>性别：</label>
                <div class="formControls  skin-minimal">
                    <label><input name="form-field-radio" type="radio" class="ace" checked="checked"><span class="lbl">保密</span></label>&nbsp;&nbsp;
                    <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;
                    <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">女</span></label>
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>手机：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder="" id="user-tel" name="user-tel"
                           datatype="m" nullmsg="手机不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>邮箱：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" placeholder="@" name="email" id="email" datatype="e"
                           nullmsg="请输入邮箱！">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label">角色：</label>
                <div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="admin-role" size="1">
					<option value="0">超级管理员</option>
					<option value="1">管理员</option>
					<option value="2">栏目主辑</option>
					<option value="3">栏目编辑</option>
				</select>
				</span></div>
            </div>
            <div class="form-group">
                <label class="form-label">备注：</label>
                <div class="formControls">
                    <textarea name="" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内" dragonfly="true"
                              onkeyup="checkLength(this);"></textarea>
                    <span class="wordage">剩余字数：<span id="sy" style="color:Red;">100</span>字</span>
                </div>
                <div class="col-4"></div>
            </div>
            <div style="text-align: center;margin-bottom: 15px;">
                <input class="btn btn-primary radius" type="submit" id="Add_Administrator"
                       value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </form>
    </div>

</div>
</body>
</html>

<script >

    function send_post(url,info) {
        $.post(url,info,
            function(result){
                //console.log(result);
                //console.log(result.dataList);
                //获取tbody
                var tbody=$("#tbody");
                //清空tbody
                tbody.empty();
                for(var i=0;i<result.dataList.length;i++)
                {
                    var show1="";
                    var a="";

                    tbody.append("<tr>");
                    tbody.append("<td><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                    tbody.append("<td>"+result.dataList[i].id+"</td>");
                    tbody.append("<td>"+result.dataList[i].admin+"</td>");
                    tbody.append("<td>"+result.dataList[i].name+"</td>");
                    tbody.append("<td>"+result.dataList[i].level+"</td>");
                    tbody.append("<td>"+result.dataList[i].alogin+"</td>");
                    a+="<td class='td-manage'>";
                    a+="<a class='btn btn-xs btn-info x_gai'><i class='fa fa-edit bigger-120'></i></a>";
                    a+="<a title='删除' href='javascript:;' onclick='member_del(this,\"1\")' class='btn btn-xs btn-warning'><i class='fa fa-trash  bigger-120'></i></a>";
                    a+="</td>";
                    tbody.append(a);
                    tbody.append("</tr>");
                }
            },"json");
    }

    $(function(){
        var info={pageNo:1,pageSize:10}
        var url="<%=basePath%>admin/getAdminListByLevel"
        send_post(url,info);
    })

    $(".btn_search").click(function () {
        var keys=$(".text_add").val();
        var start=$('#start').val();
        var end=$("#start1").val();
        var info={pageNo:1,pageSize:10,key:keys,start:start,end:end}
        var url="<%=basePath%>admin/getAdminListByLevel";
        send_post(url,info);
    });




</script>

<script type="text/javascript">
    jQuery(function ($) {
        var oTable1 = $('#sample_table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 2, 3, 4, 5, 7, 8,]}// 制定列不参与排序
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


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }
    });

</script>
<script type="text/javascript">
    $(function () {
        $("#administrator").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 50,//设置隐藏时的距离
            spacingh: 270,//设置显示时间距
        });
    });

    //字数限制
    function checkLength(which) {
        var maxChars = 100; //
        if (which.value.length > maxChars) {
            layer.open({
                icon: 2,
                title: '提示框',
                content: '您输入的字数超过限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };
    //初始化宽度、高度
    $(".widget-box").height($(window).height() - 215);
    $(".table_menu_list").width($(window).width() - 260);
    $(".table_menu_list").height($(window).height() - 215);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height() - 215);
        $(".table_menu_list").width($(window).width() - 260);
        $(".table_menu_list").height($(window).height() - 215);
    })
    laydate({
        elem: '#start',
        event: 'focus'
    });
    laydate({
        elem: '#start1',
        event: 'focus'
    });

    /*产品-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }

    /*添加管理员*/
    $('#administrator_add').on('click', function () {
        layer.open({
            type: 1,
            title: '添加管理员',
            area: ['700px', ''],
            shadeClose: false,
            content: $('#add_administrator_style'),

        });
    })
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

