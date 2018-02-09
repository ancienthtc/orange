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
    <link rel="icon" type="image/x-icon" href="<%=basePath%>favicon.ico">
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
    <script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.js"></script>
    <script src="<%=basePath%>backpage/assets/js/typeahead-bs2.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/jquery.dataTables.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/js/jquery.easy-pie-chart.min.js"></script>
    <script src="<%=basePath%>backpage/js/lrtk.js" type="text/javascript"></script>
    <title>线下订单管理</title>
</head>

<body>
<div class="margin clearfix">
    <div class="cover_style" id="cover_style">
        <!--内容-->
        <div class="centent_style" id="centent_style" style=" clear:both;">
            <div id="covar_list" class="order_list">
                <div id="scrollsidebar" class="left_Treeview">
                    <div class="show_btn" id="rightArrow"><span></span></div>
                    <div class="widget-box side_content">
                        <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                        <div class="side_list">
                            <div class="widget-header header-color-green2"><h4 class="lighter smaller">订单类型分类</h4></div>
                            <div class="widget-body">
                                <ul class="b_P_Sort_list">

                                    <li class="lb_bs"><i class="fa fa-sticky-note pink "></i> <a href="#" id="send0">待确认(${OrderStatus.o0})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#" id="send1">待付款(${OrderStatus.o1})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#" id="send2">待取货(${OrderStatus.o2})</a></li>
                                    <%--<li><i class="fa fa-sticky-note pink "></i> <a href="#" id="send3">待收货(${OrderStatus.o3})</a></li>--%>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#" id="send4">已完成(${OrderStatus.o4})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#" id="send5">退货确认(${OrderStatus.o5})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#" id="send6">待退货(${OrderStatus.o6})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#" id="send7">完成退货(${OrderStatus.o7})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#" id="send8">取消(${OrderStatus.o8})</a></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="search_style" style="display: inline-block;">

                    <ul class="search_content clearfix">
                        <li><label class="l_f"> 订单编号</label>
                            <input name="" type="text" class="text_add" id="keys" placeholder="订单订单编号" style=" width:250px"></li>
                        <li><label class="l_f">开始时间</label>
                            <input class="inline laydate-icon" id="start" style=" margin-left:10px;">
                        </li>
                        <li><label class="l_f">结束时间</label>
                            <input class="inline laydate-icon" id="start1" style=" margin-left:10px;">
                        </li>
                        <%--<li style="width:90px;">--%>
                            <%--<button type="button" class="btn_search"><i class="fa fa-search"></i>查询</button>--%>
                        <%--</li>--%>
                    </ul>
                </div>
                <!--左侧样式-->
                <div class="list_right_style" style="/*z-index:-12;*/">

                    <!--订单列表展示-->
                    <div class="changes">
                        <!-- 0待确认 -->
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                                <th width="180px">订单编号0</th>
                                <th width="180px">付款状态</th>
                                <th width="100px">付款时间</th>
                                <th width="100px">商品总价</th>
                                <th width="100px">积分扣除</th>
                                <th width="80px">订单总价</th>
                                <th width="180px">联系方式</th>
                                <th width="70px">状态</th>
                                <th width="200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody0">

                            </tbody>
                        </table>
                        <div id="pagehere0"></div>
                        <div>
                            <input type="hidden" id="pageNo0" value=""/>
                            <input type="hidden" id="pages0" value=""/>
                        </div>
                    </div>

                    <div class="changes" style="display: none;">
                        <!-- 1待付款 -->
                        <table class="table table-striped table-bordered table-hover"  >
                            <thead>
                            <tr>
                                <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                                <th width="180px">订单编号1</th>
                                <th width="180px">付款状态</th>
                                <th width="100px">付款时间</th>
                                <th width="100px">商品总价</th>
                                <th width="100px">积分扣除</th>
                                <th width="80px">订单总价</th>
                                <th width="180px">联系方式</th>
                                <th width="70px">状态</th>
                                <th width="200px">操作</th>
                            </tr>
                            </tr>
                            </thead>
                            <tbody id="tbody1">
                            </tbody>

                        </table>
                        <div id="pagehere1"></div>
                        <div>
                            <input type="hidden" id="pageNo1" value=""/>
                            <input type="hidden" id="pages1" value=""/>
                        </div>
                    </div>

                    <!-- 2待发货 -->
                    <div class="changes" style="display:none;">
                        <table class="table table-striped table-bordered table-hover"  >
                            <thead>
                            <tr>
                                <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                                <th width="180px">订单编号2</th>
                                <th width="180px">付款状态</th>
                                <th width="100px">付款时间</th>
                                <th width="100px">商品总价</th>
                                <th width="100px">积分扣除</th>
                                <th width="80px">订单总价</th>
                                <th width="180px">联系方式</th>
                                <th width="70px">状态</th>
                                <th width="200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody2">
                            </tbody>

                        </table>
                        <div id="pagehere2"></div>
                        <div>
                            <input type="hidden" id="pageNo2" value=""/>
                            <input type="hidden" id="pages2" value=""/>
                        </div>
                    </div>

                    <%--<div class="changes" style="display: none;">--%>
                        <%--<!-- 3待收货 -->--%>
                        <%--<table class="table table-striped table-bordered table-hover" >--%>
                            <%--<thead>--%>
                            <%--<tr>--%>
                                <%--<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>--%>
                                <%--<th width="180px">订单编号3</th>--%>
                                <%--<th width="180px">付款状态</th>--%>
                                <%--<th width="100px">付款时间</th>--%>
                                <%--<th width="100px">商品总价</th>--%>
                                <%--<th width="100px">积分扣除</th>--%>
                                <%--<th width="80px">订单总价</th>--%>
                                <%--<th width="180px">联系方式</th>--%>
                                <%--<th width="70px">状态</th>--%>
                                <%--<th width="200px">操作</th>--%>
                            <%--</tr>--%>
                            <%--</thead>--%>
                            <%--<tbody id="tbody3">--%>
                            <%--</tbody>--%>

                        <%--</table>--%>
                        <%--<div id="pagehere3"></div>--%>
                        <%--<div>--%>
                            <%--<input type="hidden" id="pageNo3" value=""/>--%>
                            <%--<input type="hidden" id="pages3" value=""/>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <div class="changes" style="display: none;">
                        <!-- 4已完成 -->
                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                            <tr>
                                <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                                <th width="180px">订单编号4</th>
                                <th width="180px">付款状态</th>
                                <th width="100px">付款时间</th>
                                <th width="100px">商品总价</th>
                                <th width="100px">积分扣除</th>
                                <th width="80px">订单总价</th>
                                <th width="180px">联系方式</th>
                                <th width="70px">状态</th>
                                <th width="200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody4">
                            </tbody>

                        </table>
                        <div id="pagehere4"></div>
                        <div>
                            <input type="hidden" id="pageNo4" value=""/>
                            <input type="hidden" id="pages4" value=""/>
                        </div>
                    </div>

                    <div class="changes" style="display: none;">
                        <!-- 5 -->
                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                            <tr>
                                <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                                <th width="180px">订单编号5</th>
                                <th width="180px">付款状态</th>
                                <th width="100px">付款时间</th>
                                <th width="100px">商品总价</th>
                                <th width="100px">积分扣除</th>
                                <th width="80px">订单总价</th>
                                <th width="180px">联系方式</th>
                                <th width="70px">状态</th>
                                <th width="200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody5">
                            </tbody>

                        </table>
                        <div id="pagehere5"></div>
                        <div>
                            <input type="hidden" id="pageNo5" value=""/>
                            <input type="hidden" id="pages5" value=""/>
                        </div>
                    </div>

                    <div class="changes" style="display: none;">
                        <!-- 6 -->
                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                            <tr>
                                <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                                <th width="180px">订单编号6</th>
                                <th width="180px">付款状态</th>
                                <th width="100px">付款时间</th>
                                <th width="100px">商品总价</th>
                                <th width="100px">积分扣除</th>
                                <th width="80px">订单总价</th>
                                <th width="180px">联系方式</th>
                                <th width="70px">状态</th>
                                <th width="200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody6">
                            </tbody>

                        </table>
                        <div id="pagehere6"></div>
                        <div>
                            <input type="hidden" id="pageNo6" value=""/>
                            <input type="hidden" id="pages6" value=""/>
                        </div>
                    </div>

                    <div class="changes" style="display: none;">
                        <!-- 7 -->
                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                            <tr>
                                <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                                <th width="180px">订单编号7</th>
                                <th width="180px">付款状态</th>
                                <th width="100px">付款时间</th>
                                <th width="100px">商品总价</th>
                                <th width="100px">积分扣除</th>
                                <th width="80px">订单总价</th>
                                <th width="180px">联系方式</th>
                                <th width="70px">状态</th>
                                <th width="200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody7">
                            </tbody>

                        </table>
                        <div id="pagehere7"></div>
                        <div>
                            <input type="hidden" id="pageNo7" value=""/>
                            <input type="hidden" id="pages7" value=""/>
                        </div>
                    </div>

                    <div class="changes" style="display: none;">
                        <!-- 8取消 -->
                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                            <tr>
                                <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                                <th width="180px">订单编号</th>
                                <th width="180px">付款状态</th>
                                <th width="100px">付款时间</th>
                                <th width="100px">商品总价</th>
                                <th width="100px">积分扣除</th>
                                <th width="80px">订单总价</th>
                                <th width="180px">联系方式</th>
                                <th width="70px">状态</th>
                                <th width="200px">操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody8">
                            </tbody>

                        </table>
                        <div id="pagehere8"></div>
                        <div>
                            <input type="hidden" id="pageNo8" value=""/>
                            <input type="hidden" id="pages8" value=""/>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<!--发货-->
<div id="Delivery_stop" style=" display:none">
    <div class="">
        <div class="content_style">
            <div class="form-group"><label class="col-sm-2 control-label no-padding-right"
                                           for="form-field-1">快递公司 </label>
                <div class="col-sm-9"><select class="form-control" id="form-field-select-1">
                    <option value="">--选择快递--</option>
                    <option value="1">天天快递</option>
                    <option value="2">圆通快递</option>
                    <option value="3">中通快递</option>
                    <option value="4">顺丰快递</option>
                    <option value="5">申通快递</option>
                    <option value="6">邮政EMS</option>
                    <option value="7">邮政小包</option>
                    <option value="8">韵达快递</option>
                </select></div>
            </div>
            <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">
                快递号 </label>
                <div class="col-sm-9"><input type="text" id="form-field-1" placeholder="快递号" class="col-xs-10 col-sm-5"
                                             style="margin-left:0px;"></div>
            </div>
            <div class="form-group"><label class="col-sm-2 control-label no-padding-right"
                                           for="form-field-1">货到付款 </label>
                <div class="col-sm-9"><label><input name="checkbox" type="checkbox" class="ace" id="checkbox"><span
                        class="lbl"></span></label></div>
            </div>
        </div>
    </div>
</div>
</body>

<script>

    $(function(){
        var info0={pageNo:1,pageSize:10,orderStatus:0,shopStatus:0}
        var info1={pageNo:1,pageSize:10,orderStatus:1,shopStatus:0}
        var info2={pageNo:1,pageSize:10,orderStatus:1,shopStatus:1}

        var info4={pageNo:1,pageSize:10,orderStatus:3,shopStatus:1}


        var info8={pageNo:1,pageSize:10,orderStatus:7}

        var url="<%=basePath%>order/getAdminOrderOffline"
        send_post0(url,info0);

        $("#send0").click(function () { //待确认
            send_post0(url,info0);
        })
        $("#send1").click(function () { //待付款
            send_post1(url,info1);
        })
        $("#send2").click(function () { //待取货
            send_post2(url,info2);
        })

        $("#send4").click(function () { //已完成
            send_post4(url,info4);
        })


        $("#send8").click(function () { //已取消
            send_post8(url,info8);
        })


    })

    //绑定事件
    //待确认
    function afterLoad0() {
        var orderstatus=0;
        var shopstatus=0;
        //var keys=$(".text_add").val();
        var keys=$("#keys").val();
        var start=$('#start').val();
        var end=$("#start1").val();
        $(".jump").click(function(){
            $(this).addClass("fyhover").siblings().removeClass("fyhover");
        })


        $(".del").click(function () {
            //alert( $(this).attr("pid") );
            $.ajax({
                url:"<%=basePath%>/",
                data:{pid:$(this).attr("pid")},
                type:"get",
                dataType:"text",
                success:function(data){
                    if(data=="true")
                        alert("删除成功");
                    else
                        alert("删除失败");
                    window.location.href="<%=basePath%> / ";
                },
                error:function(){
                    alert("请求失败");
                }
            });
        });

        //上一页
        $(".previous").click(function () {
            //$(".previous").on("click","#pagehere0",function () {
            var page= $("#pageNo0").val();//变
            if( parseInt(page) -1 <= 0 )
            {
                return false;
            }
            var info={pageNo:parseInt(page)-1,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info);
            send_post0(url,info);
        });



        //下一页
        $(".next").click(function () {
            //$(".next").on("click","#pagehere0",function () {
            var page=$("#pageNo0").val();//变
            var pages=$("#pages0").val();//变
            if( parseInt(page) + 1 > pages )
            {
                return false;
            }
            var info={pageNo:parseInt(page)+1,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info);
            send_post0(url,info);
        });

        //页码
        $(".pg").click(function () {
            //$(".pg").on("click","#pagehere0",function () {
            var page= $(this).text();
            var info={pageNo:page,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info );
            send_post0(url,info);
        });

        //直接跳转
        $(".go").click(function () {
            //$(".go").on("click","#pagehere0",function () {
            var page=$("#pg0").val();//变
            var info={pageNo:page,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info );
            send_post0(url,info);
        });
        /**特殊**/
        $(".sure").click(function () {//确认订单
            var oid = $(this).parent().attr("oid");

            layer.prompt({
                formType: 2,
                //value: '',
                title: '填写运费(非负数)'
            }, function(value, index, elem){
                //alert(value); //得到value
                $.ajax({
                    url: "../order/accept",
                    type: 'post',
                    dataType: 'json',
                    data: { sequence: oid , freight:value },
                    success: function (data) {
                        if(data.status==0)
                        {
                            console.log(data.msg);
                            var url="<%=basePath%>order/getAdminOrderOffline";
                            var page=$("#pageNo0").val();
                            var info={pageNo:page,pageSize:10,orderStatus:orderstatus,shopStatus:shopstatus}
                            send_post0(url,info);
                        }
                        else
                        {
                            alert(data.msg);
                        }
                    },
                    error: function () {
                        alert('服务器繁忙..请稍后重试！');
                    }
                });
                layer.close(index);
            });

        });
        $(".cancel").click(function () {//取消订单
            var oid = $(this).parent().attr("oid");
            $.ajax({
                url: "../order/cancel",
                type: 'post',
                dataType: 'json',
                data: { sequence: oid },
                success: function (data) {
                    if(data.status==0)
                    {
                        console.log(data.msg);
                        var url="<%=basePath%>order/getAdminOrderOnline";
                        var page=$("#pageNo0").val();
                        var info={pageNo:page,pageSize:10,orderStatus:orderstatus,shopStatus:shopstatus}
                        send_post0(url,info);
                    }
                    else
                    {
                        alert(data.msg);
                    }
                },
                error: function () {
                    alert('服务器繁忙..请稍后重试！');
                }
            });
        });

    }
    //待付款
    function afterLoad1() {
        var orderstatus=1;
        var shopstatus=0;
        //var keys=$(".text_add").val();
        var keys=$("#keys").val();
        var start=$('#start').val();
        var end=$("#start1").val();
        $(".jump").click(function(){
            $(this).addClass("fyhover").siblings().removeClass("fyhover");
        })

        $(".del").click(function () {
            $.ajax({
                url:"<%=basePath%>/",
                data:{pid:$(this).attr("pid")},
                type:"get",
                dataType:"text",
                success:function(data){
                    if(data=="true")
                        alert("删除成功");
                    else
                        alert("删除失败");
                    window.location.href="<%=basePath%> / ";
                },
                error:function(){
                    alert("请求失败");
                }
            });
        });

        //上一页
        $(".previous").click(function () {
            var page= $("#pageNo1").val();//变
            if( parseInt(page) -1 <= 0 )
            {
                return false;
            }
            var info={pageNo:parseInt(page)-1,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info);
            send_post1(url,info);
        });

        //下一页
        $(".next").click(function () {
            var page=$("#pageNo1").val();//变
            var pages=$("#pages1").val();//变
            if( parseInt(page) + 1 > pages )
            {
                return false;
            }
            var info={pageNo:parseInt(page)+1,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info);
            send_post1(url,info);
        });

        //页码
        $(".pg1").click(function () {
            var page= $(this).text();
            var info={pageNo:page,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info );
            send_post1(url,info);
        });

        //直接跳转
        $(".go").click(function () {
            var page=$("#pg1").val();//变
            var info={pageNo:page,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info );
            send_post1(url,info);
        });
        /**特殊**/

    }
    //待取货
    function afterLoad2() {
        var orderstatus=1;
        var shopstatus=1;
        //var keys=$(".text_add").val();
        var keys=$("#keys").val();
        var start=$('#start').val();
        var end=$("#start1").val();
        $(".jump").click(function(){
            $(this).addClass("fyhover").siblings().removeClass("fyhover");
        })

        $(".del").click(function () {
            $.ajax({
                url:"<%=basePath%>/",
                data:{pid:$(this).attr("pid")},
                type:"get",
                dataType:"text",
                success:function(data){
                    if(data=="true")
                        alert("删除成功");
                    else
                        alert("删除失败");
                    window.location.href="<%=basePath%> / ";
                },
                error:function(){
                    alert("请求失败");
                }
            });
        });

        //上一页
        $(".previous").click(function () {
            var page= $("#pageNo2").val();//变
            if( parseInt(page) -1 <= 0 )
            {
                return false;
            }
            var info={pageNo:parseInt(page)-1,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info);
            send_post2(url,info);
        });

        //下一页
        $(".next").click(function () {
            var page=$("#pageNo2").val();//变
            var pages=$("#pages2").val();//变
            if( parseInt(page) + 1 > pages )
            {
                return false;
            }
            var info={pageNo:parseInt(page)+1,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info);
            send_post1(url,info);
        });

        //页码
        $(".pg1").click(function () {
            var page= $(this).text();
            var info={pageNo:page,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info );
            send_post1(url,info);
        });

        //直接跳转
        $(".go").click(function () {
            var page=$("#pg2").val();//变
            var info={pageNo:page,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info );
            send_post1(url,info);
        });
        /**特殊**/
        $(".send").click(function () {
            //var logistics = '';
            var oid = $(this).attr("oid");
            // layer.prompt({title: '填写快递公司与物流单号'},function(val, index){
            //     layer.msg('得到了'+val);
            //     logistics = val;
            //     layer.close(index);
            // });
            layer.msg('你确定发货吗？', {
                time: 0 //不自动关闭
                ,btn: ['发货', '取消']
                ,yes: function(index){
                    layer.close(index);
                    $.ajax({
                        url:"<%=basePath%>order/send",
                        data:{sequence:oid},
                        type:"get",
                        dataType:"json",
                        success:function(data){
                            if( data.status == 0 )
                            {
                                var url="<%=basePath%>order/getAdminOrderOffline";
                                var page=$("#pageNo2").val();
                                var info={pageNo:page,pageSize:10,orderStatus:orderstatus,shopStatus:shopstatus}
                                send_post2(url,info);
                            }
                            else
                            {
                                layer.alert(data.msg);
                            }
                        },
                        error:function(){
                            alert("请求失败");
                        }
                    });

                }
            });

        });
    }


    //已完成
    function afterLoad4() {
        var orderstatus=3;
        var shopstatus=1;
        //var keys=$(".text_add").val();
        var keys=$("#keys").val();
        var start=$('#start').val();
        var end=$("#start1").val();
        $(".jump").click(function(){
            $(this).addClass("fyhover").siblings().removeClass("fyhover");
        })

        $(".del").click(function () {
            $.ajax({
                url:"<%=basePath%>/",
                data:{pid:$(this).attr("pid")},
                type:"get",
                dataType:"text",
                success:function(data){
                    if(data=="true")
                        alert("删除成功");
                    else
                        alert("删除失败");
                    window.location.href="<%=basePath%> / ";
                },
                error:function(){
                    alert("请求失败");
                }
            });
        });

        //上一页
        $(".previous").click(function () {
            var page= $("#pageNo4").val();//变
            if( parseInt(page) -1 <= 0 )
            {
                return false;
            }
            var info={pageNo:parseInt(page)-1,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info);
            send_post4(url,info);//变
        });

        //下一页
        $(".next").click(function () {
            var page=$("#pageNo4").val();//变
            var pages=$("#pages4").val();//变
            if( parseInt(page) + 1 > pages )
            {
                return false;
            }
            var info={pageNo:parseInt(page)+1,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info);
            send_post4(url,info);//变
        });

        //页码
        $(".pg4").click(function () {//变
            var page= $(this).text();
            var info={pageNo:page,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info );
            send_post4(url,info);//变
        });

        //直接跳转
        $(".go").click(function () {
            var page=$("#pg4").val();//变
            var info={pageNo:page,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus,shopStatus:shopstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info );
            send_post4(url,info);//变
        });
        /**特殊**/
    }


    //已取消
    function afterLoad8() {
        var orderstatus=7;
        //var keys=$(".text_add").val();
        var keys=$("#keys").val();
        var start=$('#start').val();
        var end=$("#start1").val();
        $(".jump").click(function(){
            $(this).addClass("fyhover").siblings().removeClass("fyhover");
        })

        $(".del").click(function () {
            $.ajax({
                url:"<%=basePath%>/",
                data:{pid:$(this).attr("pid")},
                type:"get",
                dataType:"text",
                success:function(data){
                    if(data=="true")
                        alert("删除成功");
                    else
                        alert("删除失败");
                    window.location.href="<%=basePath%> / ";
                },
                error:function(){
                    alert("请求失败");
                }
            });
        });

        //上一页
        $(".previous").click(function () {
            var page= $("#pageNo8").val();//变
            if( parseInt(page) -1 <= 0 )
            {
                return false;
            }
            var info={pageNo:parseInt(page)-1,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info);
            send_post8(url,info);
        });

        //下一页
        $(".next").click(function () {
            var page=$("#pageNo8").val();//变
            var pages=$("#pages8").val();//变
            if( parseInt(page) + 1 > pages )
            {
                return false;
            }
            var info={pageNo:parseInt(page)+1,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info);
            send_post8(url,info);
        });

        //页码
        $(".pg8").click(function () {
            var page= $(this).text();
            var info={pageNo:page,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info );
            send_post8(url,info);
        });

        //直接跳转
        $(".go").click(function () {
            var page=$("#pg8").val();//变
            var info={pageNo:page,pageSize:10,key:keys,start:start,end:end,orderStatus:orderstatus}
            var url="<%=basePath%>order/getAdminOrderOffline";
            //console.log(info );
            send_post8(url,info);
        });
        /**特殊**/

    }

    //发送AJAX
    //待确认
    function send_post0(url,info) {
        $.post(url,info,
            function(result){
                //获取tbody
                var tbody0=$("#tbody0");
                //清空tbody
                tbody0.empty();
                var html = "";
                for(var i=0;i<result.dataList.length;i++)
                {
                    var a="";
                    //tbody0.append("<tr style='text-align: center'>");
                    html += "<tr style='text-align: center'>";
                    //tbody0.append("<td width='25px'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                    html += "<td width='25px'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>";
                    //tbody0.append("<td>"+result.dataList[i].sequence+"</td>");
                    html += "<td>"+result.dataList[i].sequence+"</td>" ;
                    //tbody0.append("<td >未付款</td>");
                    html += "<td >未付款</td>" ;
                    //tbody0.append("<td >---</td>");
                    html += "<td >---</td>" ;
                    //tbody0.append("<td >"+result.dataList[i].goodsprice+"</td>");
                    html += "<td >"+result.dataList[i].goodsprice+"</td>" ;
                    //tbody0.append("<td >"+result.dataList[i].scorecost+"</td>");
                    html += "<td >"+result.dataList[i].scorecost+"</td>" ;
                    //tbody0.append("<td >"+result.dataList[i].allprice+"</td>");
                    html += "<td >"+result.dataList[i].allprice+"</td>" ;
                    //tbody0.append("<td >"+result.dataList[i].contact+"</td>");
                    html += "<td >"+result.dataList[i].contact+"</td>" ;
                    //tbody0.append("<td class='td-status'><span class='label label-success radius'>待确认</span></td>");
                    html += "<td class='td-status'><span class='label label-success radius'>待确认</span></td>" ;
                    a+="<td oid='"+result.dataList[i].sequence+"'>";
                    a+="<a href='javascript:;' title='确认' class='btn btn-xs btn-success sure'><i class='fa fa-cubes bigger-120'></i></a>";
                    a+="<a href='javascript:;' title='取消' class='btn btn-xs btn-success cancel'><i class='fa fa-cubes bigger-120'></i></a>";
                    a+="<a title='订单详细' href='<%=basePath%>order/toOrderDetail/"+result.dataList[i].sequence+"'" +
                        " class='btn btn-xs btn-info order_detailed'><i class='fa fa-list bigger-120'></i></a>";
                    a+="<a title='删除' href='javascript:;' class='btn btn-xs btn-warning'><i class='fa fa-trash bigger-120'></i></a>";
                    a+="</td>";
                    //tbody0.append(a);
                    html += a;
                    //tbody0.append("</tr>");
                    html += "</tr>" ;
                }
                tbody0.append(html);
                //页码隐藏域
                var s="<div class='page'>";
                s+="<div class='pagelist'>";
                s+="<span class='jump previous'>上一页</span>";
                for(var i=1 ; i<=result.pages ; i++  )
                {
                    if(i==result.pageNo)
                    {
                        s+="<span class='jump fyhover pg' value='"+i+"'>"+i+"</span>";
                    }
                    else
                    {
                        s+="<span class='jump pg' value='"+i+"'>"+i+"</span>";
                    }
                }
                s+="<span class='jump next'>下一页</span>";
                s+="<span class='jumppoint'>跳转到：</span>";
                s+="<span class='jumpinp'><input type='text' v-model='changePage' id='pg0' ></span>";
                s+="<span class='jump go'>GO</span>";
                s+="<span class='jump'>当前 "+result.pageNo+" / "+result.pages+" 共</span>";
                s+="</div></div>";
                $("#pageNo0").val(result.pageNo);$("#pages0").val(result.pages);
                $("#pagehere0").empty().append(s);$("#pagehere0").show();
                $("#pagehere1").hide();$("#pagehere2").hide();$("#pagehere3").hide();$("#pagehere4").hide();
                $("#pagehere5").hide();$("#pagehere6").hide();$("#pagehere7").hide();$("#pagehere8").hide();
                afterLoad0();//事后绑定
            },"json");
    }

    //待付款
    function send_post1(url,info) {
        $.post(url,info,
            function(result){
                //获取tbody
                var tbody1=$("#tbody1");
                //清空tbody
                tbody1.empty();
                for(var i=0;i<result.dataList.length;i++)
                {
                    var show1="";
                    var a="";
                    tbody1.append("<tr style='text-align: center'>");
                    tbody1.append("<td width='25px'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                    tbody1.append("<td>"+result.dataList[i].sequence+"</td>");
                    tbody1.append("<td >未付款</td>");
                    tbody1.append("<td >---</td>");
                    tbody1.append("<td >"+result.dataList[i].goodsprice+"</td>");
                    tbody1.append("<td >"+result.dataList[i].scorecost+"</td>");
                    tbody1.append("<td >"+result.dataList[i].allprice+"</td>");
                    tbody1.append("<td >"+result.dataList[i].contact+"</td>");
                    tbody1.append("<td class='td-status'><span class='label label-success radius'>待付款</span></td>");

                    a+="<td>";
                    //a+="<a href='javascript:;' title='发货' class='btn btn-xs btn-success'><i class='fa fa-cubes bigger-120'></i></a>";
                    a+="<a title='订单详细' href='<%=basePath%>order/toOrderDetail/"+result.dataList[i].sequence+"'" +
                        " class='btn btn-xs btn-info order_detailed'><i class='fa fa-list bigger-120'></i></a>";
                    a+="<a title='删除' href='javascript:;' class='btn btn-xs btn-warning'><i class='fa fa-trash bigger-120'></i></a>";
                    a+="</td>";
                    tbody1.append(a);
                    tbody1.append("</tr>");
                }
                //页码隐藏域
                var s="<div class='page'  v-show='show'>";
                s+="<div class='pagelist'>";
                s+="<span class='jump previous'>上一页</span>";
                for(var i=1 ; i<=result.pages ; i++  )
                {
                    if(i==result.pageNo)
                    {
                        s+="<span class='jump fyhover pg' value='"+i+"'>"+i+"</span>";
                    }
                    else
                    {
                        s+="<span class='jump pg' value='"+i+"'>"+i+"</span>";
                    }
                }
                s+="<span class='jump next'>下一页</span>";
                s+="<span class='jumppoint'>跳转到：</span>";
                s+="<span class='jumpinp'><input type='text' v-model='changePage' id='pg1' ></span>";   //修改pg i
                s+="<span class='jump go'>GO</span>";
                s+="<span class='jump'>当前 "+result.pageNo+" / "+result.pages+" 共</span>";
                s+="</div></div>";
                $("#pageNo1").val(result.pageNo);$("#pages1").val(result.pages);
                $("#pagehere1").empty().append(s);$("#pagehere1").show();
                $("#pagehere0").hide();$("#pagehere2").hide();$("#pagehere3").hide();$("#pagehere4").hide();
                $("#pagehere5").hide();$("#pagehere6").hide();$("#pagehere7").hide();$("#pagehere8").hide();
                afterLoad1();//事后绑定
            },"json");
    }

    //待取货
    function send_post2(url,info) {
        $.post(url,info,
            function(result){
                //获取tbody
                var tbody2=$("#tbody2");
                //清空tbody
                tbody2.empty();
                for(var i=0;i<result.dataList.length;i++)
                {
                    var show1="";
                    var a="";
                    tbody2.append("<tr style='text-align: center'>");
                    tbody2.append("<td width='25px'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                    tbody2.append("<td>"+result.dataList[i].sequence+"</td>");
                    tbody2.append("<td >已付款</td>");//变
                    tbody2.append("<td >"+result.dataList[i].paytime+"</td>");
                    tbody2.append("<td >"+result.dataList[i].goodsprice+"</td>");
                    tbody2.append("<td >"+result.dataList[i].scorecost+"</td>");
                    tbody2.append("<td >"+result.dataList[i].allprice+"</td>");
                    tbody2.append("<td >"+result.dataList[i].contact+"</td>");
                    tbody2.append("<td class='td-status'><span class='label label-success radius'>待取货</span></td>");//变

                    a+="<td>";
                    a+="<a href='javascript:;' title='发货' oid='"+result.dataList[i].sequence+"' class='btn btn-xs btn-success send'><i class='fa fa-cubes bigger-120'></i></a>";
                    a+="<a title='订单详细' href='<%=basePath%>order/toOrderDetail/"+result.dataList[i].sequence+"'" +
                        " class='btn btn-xs btn-info order_detailed'><i class='fa fa-list bigger-120'></i></a>";
                    a+="<a title='删除' href='javascript:;' class='btn btn-xs btn-warning'><i class='fa fa-trash bigger-120'></i></a>";
                    a+="</td>";
                    tbody2.append(a);
                    tbody2.append("</tr>");
                }
                //页码隐藏域
                var s="<div class='page'  v-show='show'>";
                s+="<div class='pagelist'>";
                s+="<span class='jump previous'>上一页</span>";
                for(var i=1 ; i<=result.pages ; i++  )
                {
                    if(i==result.pageNo)
                    {
                        s+="<span class='jump fyhover pg' value='"+i+"'>"+i+"</span>";
                    }
                    else
                    {
                        s+="<span class='jump pg' value='"+i+"'>"+i+"</span>";
                    }
                }
                s+="<span class='jump next'>下一页</span>";
                s+="<span class='jumppoint'>跳转到：</span>";
                s+="<span class='jumpinp'><input type='text' v-model='changePage' id='pg2' ></span>";   //变
                s+="<span class='jump go'>GO</span>";
                s+="<span class='jump'>当前 "+result.pageNo+" / "+result.pages+" 共</span>";
                s+="</div></div>";
                $("#pageNo2").val(result.pageNo);$("#pages2").val(result.pages);
                $("#pagehere2").empty().append(s);$("#pagehere2").show();   //变
                $("#pagehere0").hide();$("#pagehere1").hide();$("#pagehere3").hide();$("#pagehere4").hide();
                $("#pagehere5").hide();$("#pagehere6").hide();$("#pagehere7").hide();$("#pagehere8").hide();
                afterLoad2();//事后绑定
            },"json");
    }


    //已完成
    function send_post4(url,info) {
        $.post(url,info,
            function(result){
                //获取tbody
                var tbody4=$("#tbody4");
                //清空tbody
                tbody4.empty();
                var html = "";
                for(var i=0;i<result.dataList.length;i++)
                {
                    var a="";
                    //tbody0.append("<tr style='text-align: center'>");
                    html += "<tr style='text-align: center'>";
                    //tbody0.append("<td width='25px'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                    html += "<td width='25px'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>";
                    //tbody0.append("<td>"+result.dataList[i].sequence+"</td>");
                    html += "<td>"+result.dataList[i].sequence+"</td>" ;
                    //tbody0.append("<td >未付款</td>");
                    html += "<td >已完成</td>" ;
                    //tbody0.append("<td >---</td>");
                    html += "<td >"+result.dataList[i].paytime+"</td>" ;
                    //tbody0.append("<td >"+result.dataList[i].goodsprice+"</td>");
                    html += "<td >"+result.dataList[i].goodsprice+"</td>" ;
                    //tbody0.append("<td >"+result.dataList[i].scorecost+"</td>");
                    html += "<td >"+result.dataList[i].scorecost+"</td>" ;
                    //tbody0.append("<td >"+result.dataList[i].allprice+"</td>");
                    html += "<td >"+result.dataList[i].allprice+"</td>" ;
                    //tbody0.append("<td >"+result.dataList[i].contact+"</td>");
                    html += "<td >"+result.dataList[i].contact+"</td>" ;
                    //tbody0.append("<td class='td-status'><span class='label label-success radius'>待确认</span></td>");
                    html += "<td class='td-status'><span class='label label-success radius'>已完成</span></td>" ;
                    a+="<td oid='"+result.dataList[i].sequence+"'>";
                    a+="<a title='订单详细' href='<%=basePath%>order/toOrderDetail/"+result.dataList[i].sequence+"'" +
                        " class='btn btn-xs btn-info order_detailed'><i class='fa fa-list bigger-120'></i></a>";
                    a+="<a title='删除' href='javascript:;' class='btn btn-xs btn-warning'><i class='fa fa-trash bigger-120'></i></a>";
                    a+="</td>";
                    //tbody0.append(a);
                    html += a;
                    //tbody0.append("</tr>");
                    html += "</tr>" ;
                }
                tbody4.append(html);
                //页码隐藏域
                var s="<div class='page'>";
                s+="<div class='pagelist'>";
                s+="<span class='jump previous'>上一页</span>";
                for(var i=1 ; i<=result.pages ; i++  )
                {
                    if(i==result.pageNo)
                    {
                        s+="<span class='jump fyhover pg' value='"+i+"'>"+i+"</span>";
                    }
                    else
                    {
                        s+="<span class='jump pg' value='"+i+"'>"+i+"</span>";
                    }
                }
                s+="<span class='jump next'>下一页</span>";
                s+="<span class='jumppoint'>跳转到：</span>";
                s+="<span class='jumpinp'><input type='text' v-model='changePage' id='pg4' ></span>";
                s+="<span class='jump go'>GO</span>";
                s+="<span class='jump'>当前 "+result.pageNo+" / "+result.pages+" 共</span>";
                s+="</div></div>";
                $("#pageNo4").val(result.pageNo);$("#pages4").val(result.pages);
                $("#pagehere4").empty().append(s);$("#pagehere4").show();
                $("#pagehere1").hide();$("#pagehere2").hide();$("#pagehere3").hide();$("#pagehere0").hide();
                $("#pagehere5").hide();$("#pagehere6").hide();$("#pagehere7").hide();$("#pagehere8").hide();
                afterLoad4();//事后绑定
            },"json");
    }




    //已取消
    function send_post8(url,info) {
        $.post(url,info,
            function(result){
                //获取tbody
                var tbody8=$("#tbody8");
                //清空tbody
                tbody8.empty();
                var html = "";
                for(var i=0;i<result.dataList.length;i++)
                {
                    var a="";
                    html += "<tr style='text-align: center'>";
                    html += "<td width='25px'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>";
                    html += "<td>"+result.dataList[i].sequence+"</td>" ;
                    html += "<td >已取消</td>" ;
                    html += "<td >"+result.dataList[i].paytime+"</td>" ;
                    html += "<td >"+result.dataList[i].goodsprice+"</td>" ;
                    html += "<td >"+result.dataList[i].scorecost+"</td>" ;
                    html += "<td >"+result.dataList[i].allprice+"</td>" ;
                    html += "<td >"+result.dataList[i].contact+"</td>" ;
                    html += "<td class='td-status'><span class='label label-success radius'>已取消</span></td>" ;
                    a+="<td oid='"+result.dataList[i].sequence+"'>";
                    a+="<a title='订单详细' href='<%=basePath%>order/toOrderDetail/"+result.dataList[i].sequence+"'" +
                        " class='btn btn-xs btn-info order_detailed'><i class='fa fa-list bigger-120'></i></a>";
                    a+="<a title='删除' href='javascript:;' class='btn btn-xs btn-warning'><i class='fa fa-trash bigger-120'></i></a>";
                    a+="</td>";
                    html += a;
                    html += "</tr>" ;
                }
                tbody8.append(html);
                //页码隐藏域
                var s="<div class='page'>";
                s+="<div class='pagelist'>";
                s+="<span class='jump previous'>上一页</span>";
                for(var i=1 ; i<=result.pages ; i++  )
                {
                    if(i==result.pageNo)
                    {
                        s+="<span class='jump fyhover pg' value='"+i+"'>"+i+"</span>";
                    }
                    else
                    {
                        s+="<span class='jump pg' value='"+i+"'>"+i+"</span>";
                    }
                }
                s+="<span class='jump next'>下一页</span>";
                s+="<span class='jumppoint'>跳转到：</span>";
                s+="<span class='jumpinp'><input type='text' v-model='changePage' id='pg8' ></span>";
                s+="<span class='jump go'>GO</span>";
                s+="<span class='jump'>当前 "+result.pageNo+" / "+result.pages+" 共</span>";
                s+="</div></div>";
                $("#pageNo8").val(result.pageNo);$("#pages8").val(result.pages);
                $("#pagehere8").empty().append(s);$("#pagehere8").show();
                $("#pagehere1").hide();$("#pagehere2").hide();$("#pagehere3").hide();$("#pagehere4").hide();
                $("#pagehere5").hide();$("#pagehere6").hide();$("#pagehere7").hide();$("#pagehere0").hide();
                afterLoad8();//事后绑定
            },"json");
    }

</script>

</html>
<script>

    $(".b_P_Sort_list li ").click(function () {
        $(this).addClass("lb_bs").siblings().removeClass("lb_bs");
        var index = $(this).index();
        //$(".table").eq(index).show().siblings().hide();
        $("div.changes").eq(index).show().siblings().hide();
    });

    $(function () {
        $("#cover_style").fix({
            float: 'top',
            minStatue: false,
            skin: 'green',
            durationTime: false,
            window_height: 30,//设置浏览器与div的高度值差
            spacingw: 0,//
            spacingh: 0,//
            close_btn: '.yingchan_btn',
            show_btn: '.xianshi_btn',
            side_list: '.hide_style',
            widgetbox: '.top_style',
            close_btn_width: 60,
            da_height: '#centent_style,.left_Treeview,.list_right_style',
            side_title: '.b_n_btn',
            content: null,
            left_css: '.left_Treeview,.list_right_style'


        });
    });
    //左侧显示隐藏
    $(function () {
        $("#covar_list").fix({
            float: 'left',
            minStatue: false,
            skin: false,
            //durationTime :false,
            spacingw: 50,//设置隐藏时的距离
            spacingh: 270,//设置显示时间距
            stylewidth: '220',
            close_btn: '.close_btn',
            show_btn: '.show_btn',
            side_list: '.side_list',
            content: '.side_content',
            widgetbox: '.widget-box',
            da_height: null,
            table_menu: '.list_right_style'
        });
    });
    //时间选择
    laydate({
        elem: '#start',
        event: 'focus'
    });

    /*订单-删除*/
    function Order_form_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }

    /**发货**/
    function Delivery_stop(obj, id) {
        layer.open({
            type: 1,
            title: '发货',
            maxmin: true,
            shadeClose: false,
            area: ['500px', ''],
            content: $('#Delivery_stop'),
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                if ($('#form-field-1').val() == "") {
                    layer.alert('快递号不能为空！', {
                        title: '提示框',
                        icon: 0,
                    })

                } else {
                    layer.confirm('提交成功！', function (index) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a style=" display:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="已发货"><i class="fa fa-cubes bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发货</span>');
                        $(obj).remove();
                        layer.msg('已发货!', {icon: 6, time: 1000});
                    });
                    layer.close(index);
                }

            }
        })
    };
    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Order_form,.order_detailed').on('click', function () {
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

    //初始化宽度、高度
    var heights = $(".top_style").outerHeight() + 47;
    $(".centent_style").height($(window).height() - heights);
    $(".page_right_style").width($(window).width() - 220);
    $(".left_Treeview,.list_right_style").height($(window).height() - heights - 2);
    $(".list_right_style").width($(window).width() - 250);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".centent_style").height($(window).height() - heights);
        $(".page_right_style").width($(window).width() - 220);
        $(".left_Treeview,.list_right_style").height($(window).height() - heights - 2);
        $(".list_right_style").width($(window).width() - 250);
    })
    //比例
    var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
    $('.easy-pie-chart.percentage').each(function () {
        $(this).easyPieChart({
            barColor: $(this).data('color'),
            trackColor: '#EEEEEE',
            scaleColor: false,
            lineCap: 'butt',
            lineWidth: 10,
            animate: oldie ? false : 1000,
            size: 103
        }).css('color', $(this).data('color'));
    });

    $('[data-rel=tooltip]').tooltip();
    $('[data-rel=popover]').popover({html: true});
</script>
<script>
    //订单列表
    //jQuery(function($) {
    //		var oTable1 = $('#sample-table').dataTable( {
    //		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
    //		"bStateSave": true,//状态保存
    //		"aoColumnDefs": [
    //		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
    //		  {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7,8,9]}// 制定列不参与排序
    //		] } );
    //
    //
    //				$('table th input:checkbox').on('click' , function(){
    //					var that = this;
    //					$(this).closest('table').find('tr > td:first-child input:checkbox')
    //					.each(function(){
    //						this.checked = that.checked;
    //						$(this).closest('tr').toggleClass('selected');
    //					});
    //
    //				});
    //
    //
    //
    //			});
</script>