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
    <title>找回密码</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css"/>

    <script src="<%=basePath%>fontpage/js/jquery-1.10.1.min.js"></script>
    <script src="<%=basePath%>fontpage/js/jquery-impromptu.min.js"></script>
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
                    找回密码
                </div>
            </div>
            <div class="main_body">
                <div class="reg">
                    <div id="login" name="login">
                        <div class="control-group">
                            <input type="text" name="phone" id="phone" class="input-style1"
                                   placeholder="请输入手机号码"/>
                        </div>
                        <div class="control-group msg">
                            <input type="text" id="msgcode" class="msgcode" maxlength="5" placeholder="输入您收到的短信验证码"/>
                            <a href="javascript:SendPhone();" id="sendCode" style="background-color: #999"
                               class="sendcode">获取验证码</a>
                        </div>
                        <div class="control-group">
                            <a premit="0" class="btn-style1" id="submit">下一步</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
</div>

<script>

    $(function () {
        // $("#phone").change(function () {
        //     alert("手机号已改变");
        //     $("#submit").attr("premit",0);
        // });

        $("#submit").click(function () {    //提交

            if( $("#phone").val().length != 11 || $("#msgcode").val().length <= 0 )
            {
                alert("请填写完整");
                return;
            }
            var phone = $("#phone").val();  //手机号
            if( phone.length != 11 )
            {
                alert("请输入正确的手机号");
                return;
            }
            var code = $("#msgcode").val();
            $.ajax({
                url:"<%=basePath%>login/subForget",
                data:{tel:phone,code:code},
                type:"post",
                dataType:"json",
                success:function(result){
                    //console.log(result);
                    if( result.Statu == 0 )
                    {
                        alert(result.Msg);

                        var form = $("<form></form>");
                        form.attr('action', "<%=basePath%>user/toResetPass");
                        form.attr('method', 'post');
                        form.attr('target', '_self');

                        var input1 = $("<input type='hidden' name='phone' />");
                        input1.attr('value', phone);
                        form.append(input1);

                        form.appendTo("body");
                        form.css('display', 'none');
                        form.submit();
                    }
                    else
                    {
                        alert(result.Msg);
                    }
                },
                error:function(){
                    alert("请求失败");
                }
            });


        });

    })

    function SendPhone() {      //发送验证码
        var phone = $("#phone").val();  //手机号
        if( phone.length != 11 )
        {
            alert("请输入正确的手机号");
            return;
        }
        $.ajax({
            url:"<%=basePath%>login/forgetSend",
            data:{phone:phone},
            //contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            type:"post",
            dataType:"json",
            success:function(result){
                //console.log(result);
                if( result.Statu == 0 )
                {
                    $("#submit").attr("premit",1);
                    alert(result.Msg);
                }
                else
                {
                    alert(result.Msg);
                }
            },
            error:function(){
                alert("请求失败");
            }
        });
    }
</script>


</body>
</html>
