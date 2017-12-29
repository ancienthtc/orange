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
    <title>订单管理</title>
</head>

<body>
<div class="margin clearfix">
    <div class="cover_style" id="cover_style">
        <!--内容-->
        <div class="centent_style" id="centent_style">
            <div id="covar_list" class="order_list">
                <div id="scrollsidebar" class="left_Treeview">
                    <div class="show_btn" id="rightArrow"><span></span></div>
                    <div class="widget-box side_content">
                        <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                        <div class="side_list">
                            <div class="widget-header header-color-green2"><h4 class="lighter smaller">订单类型分类</h4></div>
                            <div class="widget-body">
                                <ul class="b_P_Sort_list">

                                    <li class="lb_bs"><i class="fa fa-sticky-note pink "></i> <a href="#">待确认(${OrderStatus.o0})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#">待付款(${OrderStatus.o1})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#">待发货(${OrderStatus.o2})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#">待收货(${OrderStatus.o3})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#">已完成(${OrderStatus.o4})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#">退货确认(${OrderStatus.o5})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#">待退货(${OrderStatus.o6})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#">完成退货(${OrderStatus.o7})</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="#">取消(${OrderStatus.o8})</a></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="search_style" style="display: inline-block;">

                    <ul class="search_content clearfix">
                        <li><label class="l_f"> 订单编号</label>
                            <input name="" type="text" class="text_add" placeholder="订单订单编号" style=" width:250px"></li>
                        <li><label class="l_f">开始时间</label>
                            <input class="inline laydate-icon" id="start" style=" margin-left:10px;">
                        </li>
                        <li><label class="l_f">结束时间</label>
                            <input class="inline laydate-icon" id="start1" style=" margin-left:10px;">
                        </li>
                        <li style="width:90px;">
                            <button type="button" class="btn_search"><i class="fa fa-search"></i>查询</button>
                        </li>
                    </ul>
                </div>
                <!--左侧样式-->
                <div class="list_right_style">

                    <!--订单列表展示-->
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                            <th width="120px">订单编号0</th>
                            <th width="250px">付款状态</th>
                            <th width="100px">付款时间</th>
                            <th width="100px">商品总价</th>
                            <th width="100px">积分扣除</th>
                            <th width="180px">订单总价</th>
                            <th width="80px">联系方式</th>
                            <th width="70px">状态</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody id="tbody0">
                            <%--<c:forEach var="i" items="${Os0}">--%>
                                <%--<tr>--%>
                                    <%--<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>--%>
                                    <%--<td>${i.sequence}</td>--%>
                                    <%--<td class="order_product_name">--%>
                                        <%--未付款--%>
                                    <%--</td>--%>
                                    <%--<td>---</td>--%>
                                    <%--<td>${i.goodsprice}</td>--%>
                                    <%--<td>${i.scorecost}</td>--%>
                                    <%--<td>${i.allprice}</td>--%>
                                    <%--<td>${i.contact}</td>--%>
                                    <%--<td class="td-status"><span class="label label-success radius">代发货</span></td>--%>
                                    <%--<td>--%>
                                        <%--<a onClick="Delivery_stop(this,'10001')" href="javascript:;" title="发货"--%>
                                           <%--class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>--%>
                                        <%--<a title="订单详细" href="<%=basePath%>order/toOrderDetail/${i.sequence}" class="btn btn-xs btn-info order_detailed"><i--%>
                                                <%--class="fa fa-list bigger-120"></i></a>--%>
                                        <%--<a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"--%>
                                           <%--class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                            <%--</c:forEach>--%>
                        </tbody>
                        <div id="pagehere0"></div>
                        <div>
                            <input type="hidden" id="pageNo0" value=""/>
                            <input type="hidden" id="pages0" value=""/>
                        </div>
                    </table>



                    <table class="table table-striped table-bordered table-hover" style="display: none;">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                            <th width="120px">订单编号1</th>
                            <th width="250px">付款状态</th>
                            <th width="100px">付款时间</th>
                            <th width="100px">商品总价</th>
                            <th width="100px">积分扣除</th>
                            <th width="180px">订单总价</th>
                            <th width="80px">联系方式</th>
                            <th width="70px">状态</th>
                            <th width="200px">操作</th>
                        </tr>
                        </tr>
                        </thead>
                        <tbody id="tbody1">
                            <c:forEach var="i" items="${Os1}">
                                <tr>
                                    <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                                    <td>${i.sequence}</td>
                                    <td class="order_product_name">
                                        未付款
                                    </td>
                                    <td>---</td>
                                    <td>${i.goodsprice}</td>
                                    <td>${i.scorecost}</td>
                                    <td>${i.allprice}</td>
                                    <td>${i.contact}</td>
                                    <td class="td-status"><span class="label label-success radius">代发货</span></td>
                                    <td>
                                        <a onClick="Delivery_stop(this,'10001')" href="javascript:;" title="发货"
                                           class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>
                                        <a title="订单详细" href="<%=basePath%>order/toOrderDetail/${i.sequence}" class="btn btn-xs btn-info order_detailed"><i
                                                class="fa fa-list bigger-120"></i></a>
                                        <a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"
                                           class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <div id="pagehere1"></div>
                        <div>
                            <input type="hidden" id="pageNo1" value=""/>
                            <input type="hidden" id="pages1" value=""/>
                        </div>
                    </table>

                    <table class="table table-striped table-bordered table-hover" style="display:none;">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                            <th width="120px">订单编号2</th>
                            <th width="250px">付款状态</th>
                            <th width="100px">付款时间</th>
                            <th width="100px">商品总价</th>
                            <th width="100px">积分扣除</th>
                            <th width="180px">订单总价</th>
                            <th width="80px">联系方式</th>
                            <th width="70px">状态</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="i" items="${Os2}">
                                <tr>
                                    <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                                    <td>${i.sequence}</td>
                                    <td class="order_product_name">
                                        已付款
                                    </td>
                                    <td>${i.paytime}</td>
                                    <td>${i.goodsprice}</td>
                                    <td>${i.scorecost}</td>
                                    <td>${i.allprice}</td>
                                    <td>${i.contact}</td>
                                    <td class="td-status"><span class="label label-success radius">代发货</span></td>
                                    <td>
                                        <a onClick="Delivery_stop(this,'10001')" href="javascript:;" title="发货"
                                           class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>
                                        <a title="订单详细" href="<%=basePath%>order/toOrderDetail/${i.sequence}" class="btn btn-xs btn-info order_detailed"><i
                                                class="fa fa-list bigger-120"></i></a>
                                        <a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"
                                           class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <div id="pagehere2"></div>
                        <div>
                            <input type="hidden" id="pageNo2" value=""/>
                            <input type="hidden" id="pages2" value=""/>
                        </div>
                    </table>


                    <table class="table table-striped table-bordered table-hover" style="display: none;">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                            <th width="120px">订单编号3</th>
                            <th width="250px">付款状态</th>
                            <th width="100px">付款时间</th>
                            <th width="100px">商品总价</th>
                            <th width="100px">积分扣除</th>
                            <th width="180px">订单总价</th>
                            <th width="80px">联系方式</th>
                            <th width="70px">状态</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="i" items="${Os3}">
                                <tr>
                                    <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                                    <td>${i.sequence}</td>
                                    <td class="order_product_name">
                                        已付款
                                    </td>
                                    <td>${i.paytime}</td>
                                    <td>${i.goodsprice}</td>
                                    <td>${i.scorecost}</td>
                                    <td>${i.allprice}</td>
                                    <td>${i.contact}</td>
                                    <td class="td-status"><span class="label label-success radius">代发货</span></td>
                                    <td>
                                        <a onClick="Delivery_stop(this,'10001')" href="javascript:;" title="发货"
                                           class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>
                                        <a title="订单详细" href="<%=basePath%>order/toOrderDetail/${i.sequence}" class="btn btn-xs btn-info order_detailed"><i
                                                class="fa fa-list bigger-120"></i></a>
                                        <a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"
                                           class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <div id="pagehere3"></div>
                        <div>
                            <input type="hidden" id="pageNo3" value=""/>
                            <input type="hidden" id="pages3" value=""/>
                        </div>
                    </table>

                    <table class="table table-striped table-bordered table-hover" style="display: none;">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                            <th width="120px">订单编号</th>
                            <th width="250px">付款状态</th>
                            <th width="100px">付款时间</th>
                            <th width="100px">商品总价</th>
                            <th width="100px">积分扣除</th>
                            <th width="180px">订单总价</th>
                            <th width="80px">联系方式</th>
                            <th width="70px">状态</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="i" items="${Os4}">
                                <tr>
                                    <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                                    <td>${i.sequence}</td>
                                    <td class="order_product_name">
                                        已付款
                                    </td>
                                    <td>${i.paytime}</td>
                                    <td>${i.goodsprice}</td>
                                    <td>${i.scorecost}</td>
                                    <td>${i.allprice}</td>
                                    <td>${i.contact}</td>
                                    <td class="td-status"><span class="label label-success radius">代发货</span></td>
                                    <td>
                                        <a onClick="Delivery_stop(this,'10001')" href="javascript:;" title="发货"
                                           class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>
                                        <a title="订单详细" href="<%=basePath%>order/toOrderDetail/${i.sequence}" class="btn btn-xs btn-info order_detailed"><i
                                                class="fa fa-list bigger-120"></i></a>
                                        <a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"
                                           class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <table class="table table-striped table-bordered table-hover" style="display: none;">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                            <th width="120px">订单编号</th>
                            <th width="250px">付款状态</th>
                            <th width="100px">付款时间</th>
                            <th width="100px">商品总价</th>
                            <th width="100px">积分扣除</th>
                            <th width="180px">订单总价</th>
                            <th width="80px">联系方式</th>
                            <th width="70px">状态</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="i" items="${Os5}">
                                <tr>
                                    <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                                    <td>${i.sequence}</td>
                                    <td class="order_product_name">
                                        已付款
                                    </td>
                                    <td>${i.paytime}</td>
                                    <td>${i.goodsprice}</td>
                                    <td>${i.scorecost}</td>
                                    <td>${i.allprice}</td>
                                    <td>${i.contact}</td>
                                    <td class="td-status"><span class="label label-success radius">代发货</span></td>
                                    <td>
                                        <a onClick="Delivery_stop(this,'10001')" href="javascript:;" title="发货"
                                           class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>
                                        <a title="订单详细" href="<%=basePath%>order/toOrderDetail/${i.sequence}" class="btn btn-xs btn-info order_detailed"><i
                                                class="fa fa-list bigger-120"></i></a>
                                        <a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"
                                           class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <table class="table table-striped table-bordered table-hover" style="display: none;">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                            <th width="120px">订单编号</th>
                            <th width="250px">付款状态</th>
                            <th width="100px">付款时间</th>
                            <th width="100px">商品总价</th>
                            <th width="100px">积分扣除</th>
                            <th width="180px">订单总价</th>
                            <th width="80px">联系方式</th>
                            <th width="70px">状态</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="i" items="${Os6}">
                                <tr>
                                    <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                                    <td>${i.sequence}</td>
                                    <td class="order_product_name">
                                        未退款
                                    </td>
                                    <td>${i.paytime}</td>
                                    <td>${i.goodsprice}</td>
                                    <td>${i.scorecost}</td>
                                    <td>${i.allprice}</td>
                                    <td>${i.contact}</td>
                                    <td class="td-status"><span class="label label-success radius">代发货</span></td>
                                    <td>
                                        <a onClick="Delivery_stop(this,'10001')" href="javascript:;" title="发货"
                                           class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>
                                        <a title="订单详细" href="<%=basePath%>order/toOrderDetail/${i.sequence}" class="btn btn-xs btn-info order_detailed"><i
                                                class="fa fa-list bigger-120"></i></a>
                                        <a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"
                                           class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <table class="table table-striped table-bordered table-hover" style="display: none;">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                            <th width="120px">订单编号</th>
                            <th width="250px">付款状态</th>
                            <th width="100px">付款时间</th>
                            <th width="100px">商品总价</th>
                            <th width="100px">积分扣除</th>
                            <th width="180px">订单总价</th>
                            <th width="80px">联系方式</th>
                            <th width="70px">状态</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="i" items="${Os7}">
                            <tr>
                                <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                                <td>${i.sequence}</td>
                                <td class="order_product_name">
                                    已退款
                                </td>
                                <td>${i.paytime}</td>
                                <td>${i.goodsprice}</td>
                                <td>${i.scorecost}</td>
                                <td>${i.allprice}</td>
                                <td>${i.contact}</td>
                                <td class="td-status"><span class="label label-success radius">代发货</span></td>
                                <td>
                                    <a onClick="Delivery_stop(this,'10001')" href="javascript:;" title="发货"
                                       class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>
                                    <a title="订单详细" href="<%=basePath%>order/toOrderDetail/${i.sequence}" class="btn btn-xs btn-info order_detailed"><i
                                            class="fa fa-list bigger-120"></i></a>
                                    <a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"
                                       class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <table class="table table-striped table-bordered table-hover" style="display: none;">
                        <thead>
                        <tr>
                            <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                            <th width="120px">订单编号</th>
                            <th width="250px">付款状态</th>
                            <th width="100px">付款时间</th>
                            <th width="100px">商品总价</th>
                            <th width="100px">积分扣除</th>
                            <th width="180px">订单总价</th>
                            <th width="80px">联系方式</th>
                            <th width="70px">状态</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="i" items="${Os8}">
                            <tr>
                                <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                                <td>${i.sequence}</td>
                                <td class="order_product_name">
                                    <c:choose>
                                        <c:when test="${i.shopstatus==0}">待付款</c:when>
                                        <c:when test="${i.shopstatus==1}">已付款</c:when>
                                        <c:when test="${i.shopstatus==2}">待退款</c:when>
                                        <c:when test="${i.shopstatus==3}">已退款</c:when>
                                    </c:choose>
                                </td>
                                <td>${i.paytime}</td>
                                <td>${i.goodsprice}</td>
                                <td>${i.scorecost}</td>
                                <td>${i.allprice}</td>
                                <td>${i.contact}</td>
                                <td class="td-status"><span class="label label-success radius">代发货</span></td>
                                <td>
                                    <a onClick="Delivery_stop(this,'10001')" href="javascript:;" title="发货"
                                       class="btn btn-xs btn-success"><i class="fa fa-cubes bigger-120"></i></a>
                                    <a title="订单详细" href="<%=basePath%>order/toOrderDetail/${i.sequence}" class="btn btn-xs btn-info order_detailed"><i
                                            class="fa fa-list bigger-120"></i></a>
                                    <a title="删除" href="javascript:;" onclick="Order_form_del(this,'1')"
                                       class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

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
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" placeholder="快递号" class="col-xs-10 col-sm-5" style="margin-left:0px;">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">货到付款</label>
                <div class="col-sm-9">
                    <label><input name="checkbox" type="checkbox" class="ace" id="checkbox"><span class="lbl"></span></label>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>

    $(function(){
        var info0={pageNo:1,pageSize:10,orderStatus:0,shopStatus:0}
        var info1={pageNo:1,pageSize:10,orderStatus:1,shopStatus:0}
        var url="<%=basePath%>order/getAdminOrderOnline"
        send_post0(url,info0);
    })

    function send_post0(url,info) {
        $.post(url,info,
            function(result){
                //获取tbody
                var tbody0=$("#tbody0");
                //清空tbody
                tbody0.empty();
                for(var i=0;i<result.dataList.length;i++)
                {
                    var show1="";
                    var a="";
                    tbody0.append("<tr style='text-align: center'>");
                    tbody0.append("<td width='25px'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                    tbody0.append("<td>"+result.dataList[i].sequence+"</td>");
                    tbody0.append("<td >未付款</td>");
                    tbody0.append("<td >---</td>");
                    tbody0.append("<td >"+result.dataList[i].goodsprice+"</td>");
                    tbody0.append("<td >"+result.dataList[i].scorecost+"</td>");
                    tbody0.append("<td >"+result.dataList[i].allprice+"</td>");
                    tbody0.append("<td >"+result.dataList[i].contact+"</td>");
                    tbody0.append("<td class='td-status'><span class='label label-success radius'>代发货</span></td>");

                    a+="<td>";
                    a+="<a href='javascript:;' title='发货' class='btn btn-xs btn-success'><i class='fa fa-cubes bigger-120'></i></a>";
                    a+="<a title='订单详细' href='<%=basePath%>order/toOrderDetail/"+result.dataList[i].sequence+"'" +
                        " class='btn btn-xs btn-info order_detailed'><i class='fa fa-list bigger-120'></i></a>";
                    a+="<a title='删除' href='javascript:;' class='btn btn-xs btn-warning'><i class='fa fa-trash bigger-120'></i></a>";
                    a+="</td>";
                    tbody0.append(a);
                    tbody0.append("</tr>");
                }
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
                $("#pagehere0").empty().append(s);
                afterLoad();//事后绑定
            },"json");
    }

    function send_post1(url,info) {
        $.post(url,info,
            function(result){
                //获取tbody
                var tbody1=$("#tbody0");
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
                    tbody1.append("<td class='td-status'><span class='label label-success radius'>代发货</span></td>");

                    a+="<td>";
                    a+="<a href='javascript:;' title='发货' class='btn btn-xs btn-success'><i class='fa fa-cubes bigger-120'></i></a>";
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
                s+="<span class='jumpinp'><input type='text' v-model='changePage' id='pg1' ></span>";
                s+="<span class='jump go'>GO</span>";
                s+="<span class='jump'>当前 "+result.pageNo+" / "+result.pages+" 共</span>";
                s+="</div></div>";
                $("#pageNo1").val(result.pageNo);$("#pages1").val(result.pages);
                $("#pagehere1").empty().append(s);
                afterLoad();//事后绑定
            },"json");
    }

    function send_post2(url,info) {
        $.post(url,info,
            function(result){
                //获取tbody
                var tbody1=$("#tbody0");
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
                    tbody1.append("<td class='td-status'><span class='label label-success radius'>代发货</span></td>");

                    a+="<td>";
                    a+="<a href='javascript:;' title='发货' class='btn btn-xs btn-success'><i class='fa fa-cubes bigger-120'></i></a>";
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
                s+="<span class='jumpinp'><input type='text' v-model='changePage' id='pg1' ></span>";
                s+="<span class='jump go'>GO</span>";
                s+="<span class='jump'>当前 "+result.pageNo+" / "+result.pages+" 共</span>";
                s+="</div></div>";
                $("#pageNo1").val(result.pageNo);$("#pages1").val(result.pages);
                $("#pagehere1").empty().append(s);
                afterLoad();//事后绑定
            },"json");
    }


</script>



<script>

    $(".b_P_Sort_list li ").click(function () {
        $(this).addClass("lb_bs").siblings().removeClass("lb_bs");
        var index = $(this).index();
        $(".table").eq(index).show().siblings().hide();
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
    laydate({
        elem: '#start1',
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