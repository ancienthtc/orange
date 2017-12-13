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
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="<%=basePath%>backpage/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link href="<%=basePath%>backpage/Widget/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <script src="<%=basePath%>backpage/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/typeahead-bs2.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/jquery.dataTables.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.admin.js"></script>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
    <script src="<%=basePath%>backpage/js/lrtk.js" type="text/javascript"></script>
    <title>分类列表</title>
</head>
<body>
<div class=" page-content clearfix">
    <div id="products_style">
        <div class="search_style">

            <ul class="search_content clearfix">
                <li>
                    <label class="l_f">产品名称</label>
                    <input name="" type="text" class="text_add" placeholder="输入品牌名称" style=" width:250px"/>
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
                    <button type="button" class="btn_search"><i class="icon-search"></i>查询</button>
                </li>
            </ul>
        </div>
        <div class="border clearfix">
       <span class="l_f">
        <a href="picture-add.html" title="添加商品" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</a>
        
       </span>
            <span class="r_f">共：<b>${count}</b>件商品</span>
        </div>
        <!--产品列表展示-->
        <div class="h_products_list clearfix" id="products_list">
            <div id="scrollsidebar" class="left_Treeview">
                <div class="show_btn" id="rightArrow"><span></span></div>
                <div class="widget-box side_content">
                </div>
            </div>
            <div class="table_menu_list" id="testIframe">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25px">
                            <label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                        </th>
                        <th width="80px">产品编号</th>
                        <th width="250px">产品名称</th>
                        <th width="100px">产品名称(日)</th>
                        <th width="100px">是否推荐</th>
                        <th width="100px">上架日期</th>
                        <th width="180px">所属分类</th>
                        <th width="70" class="sorting_disabled" rowspan="1" colspan="1" aria-label="状态"
                            style="width: 52px;">状态
                        </th>
                        <!--	<th width="70px">状态</th>  -->
                        <th width="200px">操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <tr>
                        <td width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                        </td>
                        <td width="80px">45631</td>
                        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">小米 Max 全网通 高配版 3GB内存
                            64GB ROM 金色 移动联通电信4G手机Y</u></td>
                        <td width="100px">5467</td>
                        <td width="100px">4525</td>
                        <td width="100px">法国</td>
                        <td width="180px">2014-6-11 11:11:42</td>
                        <td class="td-status"><span class="label label-success radius">上架</span></td>
                        <!--        <td class="td-status"><span class="label label-success radius">已启用</span></td>-->
                        <td class="td-manage">
                            <a onClick="member_stop(this,'10001')" href="javascript:;" title="停用"
                               class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                            <a href="picture-add.html" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
                            <a title="删除" href="javascript:;" onclick="member_del(this,'1')"
                               class="btn btn-xs btn-warning"><i class="icon-trash  bigger-120"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                        </td>
                        <td width="80px">45631</td>
                        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">小米 Max 全网通 高配版 3GB内存
                            64GB ROM 金色 移动联通电信4G手机Y</u></td>
                        <td width="100px">5467</td>
                        <td width="100px">4525</td>
                        <td width="100px">法国</td>
                        <td width="180px">2014-6-11 11:11:42</td>
                        <td class="td-status"><span class="label label-success radius">上架</span></td>
                        <!--        <td class="td-status"><span class="label label-success radius">已启用</span></td>-->
                        <td class="td-manage">
                            <a onClick="member_stop(this,'10001')" href="javascript:;" title="停用"
                               class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                            <a href="picture-add.html" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
                            <a title="删除" href="javascript:;" onclick="member_del(this,'1')"
                               class="btn btn-xs btn-warning"><i class="icon-trash  bigger-120"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                        </td>
                        <td width="80px">45631</td>
                        <td width="250px"><u style="cursor:pointer" class="text-primary" onclick="">小米 Max 全网通 高配版 3GB内存
                            64GB ROM 金色 移动联通电信4G手机Y</u></td>
                        <td width="100px">5467</td>
                        <td width="100px">4525</td>
                        <td width="100px">法国</td>
                        <td width="180px">2014-6-11 11:11:42</td>
                        <td class="td-status"><span class="label label-success radius">上架</span></td>
                        <!--        <td class="td-status"><span class="label label-success radius">已启用</span></td>-->
                        <td class="td-manage">
                            <a onClick="member_stop(this,'10001')" href="javascript:;" title="停用"
                               class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                            <a href="picture-add.html" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
                            <a title="删除" href="javascript:;" onclick="member_del(this,'1')"
                               class="btn btn-xs btn-warning"><i class="icon-trash  bigger-120"></i></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>

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
                    if(result.dataList[i].recommend==0)
                    {
                        show1="不推荐";
                    }
                    else if(result.dataList[i].recommend==1)
                    {
                        show1="推荐";
                    }

                    tbody.append("<tr>");
                    tbody.append("<td width='25px'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                    tbody.append("<td width='80px'>"+result.dataList[i].id+"</td>");
                    tbody.append("<td width='100px'>"+result.dataList[i].name+"</td>");
                    tbody.append("<td width='250px'><u style='cursor:pointer' class='text-primary' onclick=''>"+result.dataList[i].nameJ+"</u></td>");
                    tbody.append("<td width='100px'>"+show1+"</td>");
                    tbody.append("<td width='100px'>"+result.dataList[i].shelf+"</td>");
                    tbody.append("<td width='180px'>"+result.dataList[i].pname+"</td>");
                    a+="<td class='td-status'>";
                    if(result.dataList[i].shelf.length<=0)
                    {
                        a+="<span class='label label-success radius'>上架</span>";
                    }
                    else {
                        a+="<span class='label label-defaunt radius'>下架</span>";
                    }
                    a+="</td>";
                    a+="<td class='td-manage'>";
                    a+="<a onClick='member_stop(this,\"10001\")' href='javascript:;' title='停用' class='btn btn-xs btn-success'>";
                    a+="<i class='icon-ok bigger-120'></i></a>";
                    a+="<a href='picture-add.html' class='btn btn-xs btn-info'><i class='icon-edit bigger-120'></i></a>";
                    a+="<a title='删除' href='javascript:;' onclick='member_del(this,\"1\")' class='btn btn-xs btn-warning'>";
                    a+="<i class='icon-trash  bigger-120'></i></a></td>";
                    tbody.append(a);
                    tbody.append("</tr>");
                }
            },"json");
    }


    $(function(){
        var info={pageNo:1,pageSize:10}
        var url="<%=basePath%>goods/getGoodsList"
        send_post(url,info);
    })



</script>

<script>
    jQuery(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 2, 3, 4, 5, 8, 9]}// 制定列不参与排序
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
    laydate({
        elem: '#start',
        event: 'focus'
    });
    $(function () {
        $("#products_style").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 30,//设置隐藏时的距离
            spacingh: 260,//设置显示时间距
        });
    });
    laydate({
        elem: '#start1',
        event: 'focus'
    });

</script>
<script type="text/javascript">
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

    /*******树状图*******/
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function (treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                    return false;
                } else {
                    demoIframe.attr("src", treeNode.file + ".html");
                    return true;
                }
            }
        }
    };


    var code;

    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("<li>" + str + "</li>");
    }

    $(document).ready(function () {
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting, zNodes);
        demoIframe = $("#testIframe");
        demoIframe.bind("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        zTree.selectNode(zTree.getNodeByParam("id", '11'));
    });

    /*产品-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要下架吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="下架"><i class="icon-ok bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">下架</span>');
            $(obj).remove();
            layer.msg('下架成功!', {icon: 5, time: 1000});
        });
    }

    /*产品-启用*/
    function member_start(obj, id) {
        layer.confirm('确认要上架吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="下架"><i class="icon-ok bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">上架</span>');
            $(obj).remove();
            layer.msg('上架成功!', {icon: 6, time: 1000});
        });
    }

    /*产品-编辑*/
    function member_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*产品-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }

    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Order_form').on('click', function () {
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