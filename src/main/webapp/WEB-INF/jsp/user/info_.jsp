<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/24
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="refresh" content ="2;url=<%=basePath%>order/toMyOrder">
    <title>提示</title>

    <script type="text/javascript">
        var i = 2;
        function shownum(){
            i=i-1;
            //document.getElementById("time").innerHTML=i+"秒后自动跳转登陆界面";
            setTimeout('shownum()',1000);
        }
    </script>

</head>
<body onload="shownum()">
    ${info} , 2秒后自动跳转

</body>



</html>
