<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="author" content="www.34580.com"/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="format-detection" content="telephone=no"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>

    <meta name="viewport"
          content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height"/>
    <title>橘子屋</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/cart_check.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/animate.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css">
    <script src="<%=basePath%>fontpage/js/iscroll.js"></script>
    <script src="<%=basePath%>fontpage/js/small.function.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-1.10.1.min.js"></script>
    <script src="<%=basePath%>fontpage/js/modal.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-impromptu.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css">

    <script type="text/javascript">
        $(function () {
            $(".returntop").click(function () {
                $('body,html').animate({scrollTop: 0}, 1000);
            });
            var height = document.getElementById("container").offsetHeight;
            if (height <= 568) {
                $("#minHeight").addClass('minHeight');
                $(".returntop").hide();
            }
        });
    </script>

</head>

<body>
<div class="container" id="container">
    <div class="wrapper">
        <div id="minHeight" class="minHeight">
            <div class="header">
                <a href="javascript:history.back(-1)">
                    <img src="<%=basePath%>fontpage/images/zuojiantou.png">
                </a>
                <div>
                    收货地址管理
                </div>
            </div>

            <!-- 选择收货地址 -->
            <div class="common-wrapper">
                <div class="animation">

                    <!-- 选项卡1 -->
                    <div class="tab1" id="addressList">

                        <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css">

                        <script src="<%=basePath%>fontpage/js/jquery-1.10.1.min.js"></script>

                        <script src="<%=basePath%>fontpage/js/jquery-impromptu.min.js"></script>

                        <c:if test="${not empty addressses}">
                            <c:forEach var="i" items="${addressses}">
                                <div class="step3 border-1px step3-adress">
                                    <div class="s-item">
                                        <div class="sitem-l mr10" style="width:100%;border-bottom: 1px solid rgba(0,0,0,.07)">
                                            <!-- 地址状态 -->
                                            <c:if test="${i.ismain==1}">
                                                <span class="default-icon address_default"></span>
                                            </c:if>
                                            <c:if test="${i.ismain==0}">
                                                <span class="default-icon"></span>
                                            </c:if>
                                            <p class="cellName" style="width:95%">${i.recipient} ${i.tel}</p>
                                            <p class="cellAddress" style="width:95%">${i.detail} / ${i.zip}</p>
                                        </div>
                                        <div class="sitem-m">
                                            <c:if test="${i.ismain==1}">
                                                <div class="f_choose fl f_choose_selected" aid="${i.id}" onclick="toDefault('19',1,0)"
                                                     data-checked="true">
                                                    <b></b>
                                                    <label>设为默认</label>
                                                </div>
                                            </c:if>
                                            <c:if test="${i.ismain==-0}">
                                                <div class="f_choose fl" aid="${i.id}" onclick="toDefault('18',1,0)" data-checked="false">
                                                    <b></b>
                                                    <label>设为默认</label>
                                                </div>
                                            </c:if>

                                            <div class="f_bottom fr">
                                                <a class="btn_edit" href="<%=basePath%>user/toAddressDetail?aid=${i.id}">修改</a>
                                                <a class="btn_del" href="javascript:;" onclick="deleteAddress('${i.id}', 1)">删除</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="height: 0.5em;"></div>
                            </c:forEach>

                        </c:if>
                        <%--<c:if test="${empty addressses}">--%>
                            <%--<div class="step3 border-1px step3-adress">--%>
                                <%--暂无地址，前去添加--%>
                            <%--</div>--%>
                        <%--</c:if>--%>

                        <%--<div class="step3 border-1px step3-adress">--%>
                            <%--<div class="s-item">--%>
                                <%--<div class="sitem-l mr10" style="width:100%;border-bottom: 1px solid rgba(0,0,0,.07)">--%>
                                    <%--<!-- 地址状态 -->--%>
                                    <%--<span class=""></span>--%>
                                    <%--<p class="cellName" style="width:95%">张俊杰(15965735894)</p>--%>
                                    <%--<p class="cellAddress" style="width:95%">苏州市里河新村82-1幢里河菜场79号</p>--%>
                                <%--</div>--%>
                                <%--<div class="sitem-m">--%>
                                    <%--<div class="f_choose fl" onclick="toDefault('18',1,0)" data-checked="true">--%>
                                        <%--<b></b>--%>
                                        <%--<label>设为默认</label>--%>
                                    <%--</div>--%>

                                    <%--<div class="f_bottom fr">--%>
                                        <%--<a class="btn_edit" href="shouhuodizhi_xqy.php">修改</a>--%>
                                        <%--<a class="btn_del" href="javascript:;" onclick="deleteAddress('18', 1)">删除</a>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div style="height: 0.5em;"></div>--%>

                    </div>
                    <!-- End 选项卡1 -->
                </div>
                <!-- 新建站点 -->

                <div class="add-address tab1" style="z-index:9999">
                    <a class="add-btn" href="<%=basePath%>user/toAddressDetail">
                        + 新建收货地址
                    </a>
                </div>
                <!-- End 新建地址 -->
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        //            //选项卡切换事件
        //            $(".tab > div").click(function () {
        //                $(this).addClass("hover").siblings().removeClass("hover");
        //                var tab = $(this).attr("data-tab");
        //                $(".tab1,.tab2").css("display", "none");
        //                $("." + tab).css("display", "block");
        //            })

        //选择默认配送站点
        $(".f_choose").click(function () {

            var $icon = $(".default-icon");
            var $choice = $(".f_choose");
            var id = $(this).attr("aid");
            var $this = $(this);

            var f = $(this).parent().parent();//$(this).parent(".s-item");//父div
            var $the_default=f.find(".default-icon");//"默认"span

            var checked = $(this).attr("data-checked");

            if (checked == "true") {    //取消-- 去除所有default-icon
                $.ajax({
                    url: "../user/setMain",
                    type: 'post',
                    //contentType : 'application/json',
                    dataType: 'json',
                    data: {id:id,status:0},
                    success: function (data) {
                        if(data==true)
                        {
                            debugger;
                            //去除所有default-icon
                            $icon.each(function(index,element) {
                                //var $this = $(this);
                                $(this).removeClass("address_default");
                            });

                            $this.attr("data-checked", "false");
                            $this.removeClass("f_choose_selected");
                            isDefault = 1;
                        }
                    },
                    error: function () {
                        alert('服务器繁忙..请稍后重试！');
                    }
                });
            }
            else {      //设默认
                $.ajax({
                    url: "../user/setMain",
                    type: 'post',
                    //contentType : 'application/json',
                    dataType: 'json',
                    data: {id:id,status:1},
                    success: function (data) {
                        if(data==true)
                        {
                            debugger;
                            //去除其他default-icon
                            $icon.each(function(index,element) {
                                //var $this = $(this);
                                $(this).removeClass("address_default");
                            });
                            //$this.parent(".s-item").find(".default-icon").addClass("address_default");
                            $the_default.addClass("address_default");

                            //去除其他绿钩
                            $choice.each(function (index,element) {
                                //var $this = $(this);
                                $(this).attr("data-checked", "false");
                                $(this).removeClass("f_choose_selected");
                            });
                            //设置绿钩
                            $this.attr("data-checked", "true");
                            $this.addClass("f_choose_selected");
                            isDefault = 0;
                        }
                    },
                    error: function () {
                        alert('服务器繁忙..请稍后重试！');
                    }
                });
            }
        })

        $.post("/Address/AddressList/?returnlUrl=/My/Index/", {}, function (data) {
            jQuery("#addressList").html(data);
        });

    });

    var todefault = 0;

    /**
     * 设为默认
     */
    function toDefault(id, type, isdefalut) {
        if (todefault == 1) {
            return;
        }
        todefault = 1;
        var returnlUrl = "/My/Index/";

        $.ajax({
            type: "POST",
            url: "/Address/toDefault/",
            data: {AddressID: id, returnlUrl: returnlUrl},
            dataType: "json",
            success: function (data) {
                debugger
                if (data.Statu == 1) {
                    $.prompt(data.Msg, {
                        buttons: {"确定": true}
                    });
                    window.location.href = data.BackUrl;
                } else {
                    $.prompt(data.Msg, {
                        buttons: {"确定": true}
                    });
                }
            },
            error: function () {

            }
        });

    }

    var todelete = 0;

    /**
     * 删除地址
     */
    function deleteAddress(id, type) {
        if (todelete == 1) {
            return;
        }
        todelete = 1;
        if (!confirm('确认删除？')) {
            todelete = 0;
            return;
        }
        //var returnlUrl = "/My/Index/";
        $.ajax({
            type: "POST",
            url: "../user/addressDel",
            data: {aid: id},
            dataType: "json",
            success: function (data) {
                debugger
                if (data == true) {
                    $.prompt("删除成功", {
                        buttons: {"确定": true}
                    });
                    window.location.href = "<%=basePath%>user/toAddress";
                } else {
                    $.prompt("删除失败", {
                        buttons: {"确定": true}
                    });
                }
            },
            error: function () {

            }
        });

    }

</script>


</body>
</html>
