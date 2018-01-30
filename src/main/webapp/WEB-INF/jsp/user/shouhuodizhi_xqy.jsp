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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="www.34580.com" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="format-detection" content="telephone=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />

    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <title>橘子屋</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main_3.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/cart_check.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/animate.css">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main_3.css">
    <script src="<%=basePath%>fontpage/js/iscroll.js"></script>
    <script src="<%=basePath%>fontpage/js/small.function.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-1.10.1.min.js"></script>
    <script src="<%=basePath%>fontpage/js/modal.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-impromptu.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu_3.css">
    <script type="text/javascript">
        $(function () {
            $(".returntop").click(function () {
                $('body,html').animate({ scrollTop: 0 }, 1000);
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
				收货地址
			</div>
		</div>
                <div class="common-wrapper mbNone">
                    <div class="common-body">

                        <c:if test="${empty address}">
                            <input type="hidden" value="" name="id" id="aid">
                        </c:if>
                        <c:if test="${not empty address}">
                            <input type="hidden" value="${address.id}" name="id" id="aid">
                        </c:if>

                        <div class="step4 border-1px">
                            <div class="s-item bdb-1px">
                                <div class="sitem-r">
                                    <c:if test="${empty address}">
                                        <input type="text" id="Address" name="Address" class="w8" placeholder="请输入详细地址">
                                    </c:if>
                                    <c:if test="${not empty address}">
                                        <input type="text" id="Address" name="Address" class="w8" value="${address.detail}" placeholder="请输入详细地址">
                                    </c:if>


                                    <b class="jf-close" style="right:20px;display:none;"></b>
                                </div>
                            </div>
                        </div>
                        <%--<div class="name_tips">--%>
                            <%--苏州市里河新村82-1幢里河菜场79号--%>
                        <%--</div>--%>
                        <div class="step4 border-1px">
                            <div class="s-item bdb-1px">
                                <div class="sitem-r">
                                    <c:if test="${empty address}">
                                        <input type="text" id="UserName" name="UserName" class="w8" placeholder="请输入姓名">
                                    </c:if>
                                    <c:if test="${not empty address}">
                                        <input type="text" id="UserName" name="UserName" class="w8" value="${address.recipient}" placeholder="请输入姓名">
                                    </c:if>
                                    <b class="jf-close" style="right:20px;display:none;"></b>
                                </div>
                            </div>
                        </div>

                        <div class="step4 border-1px">
                            <div class="s-item bdb-1px">
                                <div class="sitem-r">
                                    <c:if test="${empty address}">
                                        <input type="text" id="Tel" name="Phone" class="w8" placeholder="请输入手机号">
                                    </c:if>
                                    <c:if test="${not empty address}">
                                        <input type="text" id="Tel" name="Phone" class="w8" value="${address.tel}" placeholder="请输入手机号">
                                    </c:if>


                                    <b class="jf-close" style="right:20px;display:none;"></b>
                                </div>
                            </div>
                        </div>
                        <div class="step4 border-1px">
                            <div class="s-item bdb-1px">
                                <div class="sitem-r">
                                    <c:if test="${empty address}">
                                        <input type="text" id="ZipCode" name="ZipCode" class="w8" placeholder="请输入6位数邮编">
                                    </c:if>
                                    <c:if test="${not empty address}">
                                        <input type="text" id="ZipCode" name="ZipCode" class="w8" value="${address.zip}" placeholder="请输入6位数邮编">
                                    </c:if>


                                    <b class="jf-close" style="right:20px;display:none;"></b>
                                </div>
                            </div>
                        </div>
                        <c:if test="${empty address}">
                            <div class="f_choose f_choose_selected" data-checked="true">
                                <b></b>
                                <label class="sh_mr">设置为默认地址</label>
                            </div>
                        </c:if>
                        <c:if test="${not empty address}">
                            <c:if test="${address.ismain==0}">
                                <div class="f_choose" data-checked="false">
                                    <b></b>
                                    <label>取消默认地址</label>
                                </div>
                            </c:if>
                            <c:if test="${address.ismain==1}">
                                <div class="f_choose f_choose_selected" data-checked="true">
                                    <b></b>
                                    <label>设置为默认地址</label>
                                </div>
                            </c:if>
                        </c:if>


                        <div class="f_btn gary" data-disable="true">
                            确定
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            
            $(".jf-close").click(function () {
                $("#Address").val("");
                $(".f_btn").addClass("gary");
                $(".f_btn").attr("data-disable", "true");
                $(".jf-close").css("display", "none");
            })
            $('#Address').bind('input propertychange', function () {
                var val = $(this).val();
                if (val == "" || val.length < 2 || val.length > 100) {
                    $(".f_btn").addClass("gary");
                    $(".f_btn").attr("data-disable", "true");
                    $(".jf-close").css("display", "none");
                }
                else {
                    $(".f_btn").removeClass("gary");
                    $(".f_btn").attr("data-disable", "false");
                    $(".jf-close").css("display", "block");
                }
            });
        });

        function go_index() {
            window.location.href = '/Home/Index/';
        }
        function containSpecial(s) {
            var containSpecial = RegExp(/[(\ )(\~)(\!)(\@)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\+)(\=)(\[)(\])(\{)(\})(\|)(\\)(\;)(\:)(\')(\")(\,)(\.)(\/)(\<)(\>)(\?)(\)]+/);
            return (containSpecial.test(s));
        }
        var click = 0;
        var isDefault = 1;//默认地址
        $('.f_btn').click(function () {
            debugger
            //是否默认
            var checked = $(".f_choose").attr("data-checked");
            var isMain=0;
            if(checked=="true")
            {
                isMain=1;
            }
            else
            {
                isMain=0;
            }

            if ($(".f_btn").attr("data-disable") == "true") {
                return false;
            }

            if (click == 1) {
                return false;
            }
            click = 1;

            var Id = $("#aid").val();

            var Address = $('#Address').val();
            if (Address == "" || Address == null) {
                $.prompt(data.Msg, {
                    buttons: { "确定": true }
                });
                return;
            }
            var UserName = $('#UserName').val();
            if (UserName == "" || UserName == null) {
                alert("姓名不能为空", {
                    buttons: { "确定": true }
                });
                return;
            }
            if (containSpecial(UserName)) {
                $.modal({ title: '提示信息', content: '姓名不能包含特殊字符', top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
                click = 0;
                return;
            }

            var Tel = $('#Tel').val();
            if (Tel == "" || Tel == null) {
                alert("手机号码不能为空", {
                    buttons: { "确定": true }
                });
                return;
            }
            if (containSpecial(Tel)) {
                $.modal({ title: '提示信息', content: '手机号码不能包含特殊字符', top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
                click = 0;
                return;
            }

            var Phone = $('#Phone').val();
            // if (Phone == "" || Phone == null) {
            //     $.prompt("电话号码不能为空", {
            //         buttons: { "确定": true }
            //     });
            //     return;
            // }
            // if (containSpecial(Phone)) {
            //     $.modal({ title: '提示信息', content: '电话号码不能包含特殊字符', top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
            //     click = 0;
            //     return;
            // }

            var ZipCode = $('#ZipCode').val();
            if (ZipCode == "" || ZipCode == null) {
                alert("邮编不能为空", {
                    buttons: { "确定": true }
                });
                return;
            }
            if (containSpecial(ZipCode)) {
                $.modal({ title: '提示信息', content: '邮编不能包含特殊字符', top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
                click = 0;
                return;
            }

            //var returnlUrl = "/My/Index/";

            $.ajax({
                type: "POST",
                url: "../user/addressAdd",
                data: { id:Id , detail: Address,tel: Tel, phone: Phone, recipient: UserName, zip: ZipCode , ismain: isMain },
                dataType: "json",
                success: function (data) {
                    debugger
                    if (data == true) {
                        alert("成功", {
                            buttons: { "确定": true }
                        });
                        debugger
                        window.location.href = "<%=basePath%>user/toAddress";
                    } else {
                        alert("失败", {
                            buttons: { "确定": true }
                        });
                    }
                },
                error: function () {

                }
            });

            //$.post('http://wechat.34580.com/my/changeNickname', { nickname: nickname }, function (data) {

            //    if (data.success == 1) {
            //        $.modal({ title: '提示信息', content: '昵称修改成功', top: '20%', bottom: [{ name: '确定', click: 'go_index()', classs: 'btn-ios-default' }] });
            //    } else {
            //        $.modal({ title: '提示信息', content: data.msg, top: '20%', bottom: [{ name: '确定', click: '$.close()', classs: 'btn-ios-default' }] });
            //        click = 0;
            //    }

            //}, 'json');

        });

        //选择默认配送站点
        $(".f_choose").click(function () {
            var checked = $(this).attr("data-checked");
            var id=$("#aid").val();
            debugger;
            if(id.length>0)
            {
                var date = {id:id,status:0};
                if (checked == "true") {//取消默认
                    $.ajax({
                        url: "../user/setMain",
                        type: 'post',
                        //contentType : 'application/json',
                        dataType: 'json',
                        data: date,
                        success: function (data) {
                            if(data==true)
                            {
                                $(this).attr("data-checked", "false");
                                $(this).removeClass("f_choose_selected");
                                isDefault = 1;
                            }
                        },
                        error: function () {
                            alert('服务器繁忙..请稍后重试！');
                        }
                    });

                }
                else {//设为默认
                    $.ajax({
                        url: "../user/setMain",
                        type: 'post',
                        contentType : 'application/json',
                        dataType: 'json',
                        data: {id:id,status:1},
                        success: function (data) {
                            if(data==true)
                            {
                                $(this).attr("data-checked", "true");
                                $(this).addClass("f_choose_selected");
                                isDefault = 0;
                            }
                        },
                        error: function () {
                            alert('服务器繁忙..请稍后重试！');
                        }
                    });
                }
            }
            else if(id==null || id=="")
            {
                if (checked == "true") {//取消默认
                    $(this).attr("data-checked", "false");
                    $(this).removeClass("f_choose_selected");
                    isDefault = 1;
                }
                else
                {
                    $(this).attr("data-checked", "true");
                    $(this).addClass("f_choose_selected");
                    isDefault = 0;
                }
            }


        })

    </script>

</body>
</html>