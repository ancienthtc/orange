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
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css" />
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css" />
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css" />
    <script src="<%=basePath%>fontpage/js/jquery-1.10.1.min.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-impromptu.min.js"></script>
    <style>
        .jqidefaultbutton{background: #ee4b02 !important;}
        /*.jqibox{position: inherit !important;}*/
      input[type=submit]{ -webkit-appearance: none;}
        .jqi{top: 185px !important;}

    </style>
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
			用户注册
			</div>
		</div>
                <div class="main_body">
                    <div class="reg">
                        <div id="login" name="login">

                            <div class="control-group">
                                <input type="text" name="phone" id="phone" onblur="is_reg_phone()" class="input-style1" placeholder="请输入手机号码" />
                            </div>
                            <div class="control-group">
                                <input type="password" name="pwd" id="pwd" onblur="is_reg_pwd()" class="input-style1" placeholder="请输入密码" />
                            </div>
                            <div class="control-group">
                                <input type="password" name="repwd" id="repwd" class="input-style1" placeholder="密码确认" />
                            </div>                           
                            <div class="control-group msg">
                                <input type="text" id="msgcode" class="msgcode" maxlength="6" placeholder="输入您收到的短信验证码" />
                                <a href="javascript:SendPhone();" id="sendCode" style="background-color: #999" class="sendcode">获取验证码</a>
                            </div>
                            <div class="control-group">
                                <%--<a id="submit" class="btn-style1">立即注册</a>--%>
                                <input type="submit" id="submit" class="btn-style1" value="立即注册">
                            </div>
                        </div>
                        <!--<div class="clearfix">
                            <label class="default-cursor">
                                <input type="checkbox" class="fl" name="rules" id="rules" value="1" checked />
                                <span class="fl">我已阅读并接受《<a href="/User/Agreement" class="rules">注册协议</a>》</span>
                            </label>
                        </div>-->
                    </div>
                </div>

                <script type="text/javascript">
                    // $("#phone").blur(function () {
                    //     phone = this.value;
                    //     RegCellPhone = /^(1)([0-9]{10})?$/;
                    //     falg=phone.search(RegCellPhone);
                    //     if (falg==-1){
                    //         $.prompt("请输入正确的手机号码");
                    //
                    //         return false;
                    //         this.focus();
                    //     }
                    // });
                    //验证手机号码
                    function checkTel(phone) {
                        var reg = /^1[3|4|5|7|8](\d){9}$/;
                        if (reg.test(phone)) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    //手机号码焦点离开事件
                    // function is_reg_phone() {
                    //     debugger;
                    //     var phone = $("#phone").val();
                    //     if (phone.length != 11) {
                    //         $.prompt("请输入您的11位手机号码", {
                    //             buttons: { "确定": true }
                    //         });
                    //         return;
                    //     }else if (phone.length == 11) {
                    //         if (!checkTel(phone)) {
                    //             $.prompt("您的手机号码不正确", {
                    //                 buttons: { "确定": true }
                    //             });
                    //             return;
                    //         } else {//验证手机号码是否可以注册
                    //             $.ajax({
                    //                 url: "../login/checkPhone",
                    //                 type: 'post',
                    //                 dataType: 'json',
                    //                 data: { phone: phone },
                    //                 success: function (data) {
                    //                     debugger;
                    //                     if (data.status == 1) {
                    //                         $("#sendCode_register").css({ "background": "#999" });
                    //                         $.prompt(data.msg, {
                    //                             buttons: { "确定": true }
                    //                         });
                    //                     } else {
                    //                         $("#sendCode_register").css({ "background": "#093" });
                    //                     }
                    //                 },
                    //                 error: function () {
                    //                     alert('服务器繁忙..请稍后重试！');
                    //                 }
                    //             });
                    //         }
                    //     }
                    // }

                    //验证登陆密码
                    function is_reg_pwd()
                    {
                        var pwd = $.trim($("#pwd").val());//密码
                        if (pwd.length < 6 || pwd.length > 16) {
                            $.prompt("密码长度为6-16位", {
                                buttons: { "确定": true }
                            });
                            return;
                        }
                    }

                    //验证确认密码
                    function checkPwd(pwd, repwd) {
                        if (pwd == repwd) {
                            return true;
                        } else {
                            return false;
                        }
                    }

               
                    var sendVerifyNum = 0;
                    //发送手机证码
                    function SendPhone() {
                        debugger;
                        var phone = $.trim($("#phone").val());//获取手机号码                       
                        if (sendVerifyNum == 0) {
                            $.ajax({
                                type: "POST",
                                url: "../login/sendCode_register",    //发送验证码
                                data: {
                                    "phone": phone
                                },
                                dataType: "json",
                                success: ajaxMsgPhone
                            });
                        } else {
                            //Showbo.Msg.alert("验证码已发到您手机，请查收！", "消息提示");
                            $.prompt("验证码已发到您手机，请查收！", {
                                buttons: { "确定": true }
                            });
                        }
                    }
                    //手机验证码发送成功返回函数
                    function ajaxMsgPhone(jsonData) {
                        debugger
                        if (jsonData.Statu == 0) {//成功
                            $("#sendCode_register").disabled = "disabled";
                            sendVerifyNum = 60;
                            var that = this;
                            //计时器
                            that.timer = setInterval(function () {
                                sendVerifyNum--;
                                $("#sendCode_register").html("" + sendVerifyNum + " 秒");
                                if (sendVerifyNum <= 1) {
                                    sendVerifyNum = 0;
                                    $("#sendCode_register").html("获取验证码");
                                    $("#sendCode_register").disabled = "";
                                    clearInterval(that.timer);
                                }
                            }, 1000);                                             

                            $.prompt(jsonData.Msg, {
                                buttons: { "确定": true }
                            });

                        } else {
                            $.prompt(jsonData.Msg, {
                                buttons: { "确定": true }
                            });
                        }                                               
                    }
                    //是否同意注册协议
                    $("#rules").click(function () {
                        var _self = $(this);
                        if (_self.prop("checked")) {
                            $(".btn-style1").css("background", "");
                            $(".btn-style1").addClass('submit');
                            _self.val(1);
                        } else {
                            $(".btn-style1").css("background", "grey");
                            $(".btn-style1").removeClass('submit');
                            _self.val(0);
                        }
                    });

                    //注册
                    $("body").delegate('#submit', 'click', function () {
                        debugger;
                        var that = $(this);
                        that.attr('id', '');
                        that.text('处理中');
                        that.css('background', '#808080');
                        //var name = $.trim($("#name").val());
                        var pwd = $.trim($("#pwd").val());
                        var repwd = $.trim($("#repwd").val());
                        var phone = $.trim($("#phone").val());
                        var msgcode = $.trim($("#msgcode").val());
                        var rules = $("#rules").val();
                        //if (checkTel(phone) && pwd != '' && checkPwd(pwd, repwd) && rules == '1' && msgcode != '') {
                        if (checkTel(phone) && pwd != '' && checkPwd(pwd, repwd)  && msgcode != '') {
                            if (pwd.length < 6 || pwd.length > 16) {
                                $.prompt("密码长度为6-16位", {
                                    buttons: { "确定": true }
                                });
                                that.attr('id', 'submit');
                                that.text('立即注册');
                                that.css('background', '#093');
                            }
                            else {
                                $.ajax({
                                    url: "<%=basePath%>login/register",    //注册地址
                                    type: 'post',
                                    data: {
                                        //name:name,
                                        password: pwd,
                                        tel: phone,
                                        checkcode: msgcode
                                    },
                                    dataType: 'json',
                                    success: function (data) {
                                        debugger;
                                        //if (data.Statu == 1) {
                                        if (data == true) {
                                            // $.prompt(data.Msg, {
                                            //     buttons: { "确定": true }
                                            // });
                                            $.prompt("注册成功", {
                                                buttons: { "确定": true }
                                            });

                                            //window.location.href = data.BackUrl;//跳转登录
                                            window.location.href = "<%=basePath%>login/login" ;
                                        } else {

                                            // $.prompt(data.Msg, {
                                            //     buttons: { "确定": true }
                                            // });
                                            $.prompt("注册失败", {
                                                buttons: { "确定": true }
                                            });

                                            that.attr('id', 'submit');
                                            that.text('立即注册');
                                            that.css('background', '#093');
                                        }
                                    }
                                });
                            }
                        } else {
                            if (pwd == '' || repwd == '' || msgcode == '' || phone == '') {
                                $.prompt("请将信息填写完整", {
                                    buttons: { "确定": true }
                                });
                            } else if (!checkPwd(pwd, repwd)) {
                                $.prompt("密码不一致", {
                                    buttons: { "确定": true }
                                });
                            } else if (!checkTel(phone)) {
                                $.prompt("请输入正确的手机号码", {
                                    buttons: { "确定": true }
                                });
                            }
                            // else if (rules == '0') {
                            //     $.prompt("请同意协议", {
                            //         buttons: { "确定": true }
                            //     });
                            // }
                            else {

                            }
                            that.attr('id', 'submit');
                            that.text('立即注册');
                            that.css('background', '#093');

                        }
                    });
                   

                    $(window).on('load', function () {
                        setTimeout(function () { window.scrollTo(0, 1); }, 100);
                    })
                </script>
            </div>
        </div>
    </div>
    <div>
       <!-- <a href="javascript:;" class="returntop" style="display:none">返回顶部</a>-->
    </div>
    <script type="text/javascript">

        // $(function () {
        //
        //     $(".returntop").click(function () {
        //
        //         $('body,html').animate({ scrollTop: 0 }, 1000);
        //     });
        //     var height = document.getElementById("container").offsetHeight;
        //     if (height >= 568) {
        //         $("#minHeight").removeClass('minHeight');
        //         $(".returntop").show();
        //     }
        // });
    </script>
</body>
</html>
