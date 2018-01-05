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
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta name="apple-wap-web-app-capable" content="yes">
	<meta name="apple-wap-web-app-status-bar-style" content="black-translucent">
    <title>案内</title>
    <link href="<%=basePath%>fontpage/css/ionic.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css" />
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css" />
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css" />
	<script src="<%=basePath%>fontpage/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div class="header">
			<a href="javascript:history.back(-1)">
				<img src="<%=basePath%>fontpage/images/zuojiantou.png">
			</a>
			<div>
			案内
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
<script type="text/javascript">
	        $(function () {
	        if (true) {
                $("#f3").html('<img src="<%=basePath%>fontpage/images/zhinan1.png">');
                $("#t3").css("color", "#ee4b02");
           }
        });
</script>