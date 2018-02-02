<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>

    <script src="<%=basePath%>backpage/js/jquery-1.9.1.min.js">
    </script>
    <script>

        function isNumber(value) {         //验证是否为数字
            var patrn = "^\\d+(";
            if (patrn.exec(value) == null || value == "") {
                alert("no");
            } else {
                alert("yes");
            }
        }

        $(document).ready(function(){

            $("p").click(function(){
                var s = $(this).attr("value");
                //isNumber( $(this).val );
                //alert( isNaN(s) + " " + s );
                if( isNaN(s) == true )
                {
                    alert("不是数字");
                }
            });

        });

    </script>
</head>
<body>
        <p value="a">如果您点击我，我会消失。</p>
        <p value="1">点击我，我会消失。</p>
        <p value="2.1">也要点击我哦。</p>
        <p value="2.1.2">也要点击我哦。</p>
</body>
</html>
