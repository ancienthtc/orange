<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
    <div class="index_foot">
        <div class="index_foot_nei">
            <a href="<%=basePath%>user/toShopIndex"><div id="f1" class="index_f1"><img src="<%=basePath%>fontpage/img/shouye.png"></div></a>
            <a href="<%=basePath%>part/toShopList"><div id="f2" class="index_f2"><img src="<%=basePath%>fontpage/images/fenlei.png" ></div></a>
            <a href="<%=basePath%>user/toGuide"><div id="f3" class="index_f3"><img src="<%=basePath%>fontpage/images/zhinan.png"></div></a>
            <a href="<%=basePath%>cart/toCart"><div id="f4" class="index_f4"><img src="<%=basePath%>fontpage/images/gouwuche.png"></div></a>
            <a href="<%=basePath%>user/toCenter"><div id="f5" class="index_f5"><img src="<%=basePath%>fontpage/images/user.png"></div></a>
            <a href="<%=basePath%>user/toShopIndex"><div id="t1" class="index_t1">首页</div></a>
            <a href="<%=basePath%>part/toShopList"><div id="t2" class="index_t2">分类</div></a>
            <a href="<%=basePath%>user/toGuide"><div id="t3" class="index_t3">案内</div></a>
            <a href="<%=basePath%>cart/toCart"><div id="t4" class="index_t4">购物车</div></a>
            <a href="<%=basePath%>user/toCenter"><div id="t5" class="index_t5">我的</div></a>
        </div>
    </div>