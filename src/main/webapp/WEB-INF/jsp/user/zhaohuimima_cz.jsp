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
    <title>重置密码</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css" />
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css" />
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css" />
</head>
<body>
    <div class="container" id="container">
        <div class="wrapper">
            <div id="minHeight" class="minHeight">
               <div class="header">
			<a href="javascript:history.back(-1)">
				<img src="images/zuojiantou.png">
			</a>
			<div>
			重置密码
			</div>
		</div>
                <div class="main_body">
                    <div class="reg">
                        <div id="login" name="login">
                            <div class="control-group">
                                <input type="text" name="phone" id="phone" onblur="is_reg_phone()" class="input-style1" placeholder="新密码" />
                            </div>                          
                            <div class="control-group">
                                <input type="text" name="phone" id="phone" onblur="is_reg_phone()" class="input-style1" placeholder="确认密码" />
                            </div>
                            <div class="control-group">
                                <a href="denglu.php" class="btn-style1" id="submit">完成</a>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
    </div>
</body>
</html>
