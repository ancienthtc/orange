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
    <title>分类</title>
    <link href="<%=basePath%>fontpage/css/mui.min.css" rel="stylesheet"/>
    <link href="<%=basePath%>fontpage/css/ionic.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css"/>
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/jquery-impromptu.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>fontpage/css/felei.css"/>
    <script src="<%=basePath%>fontpage/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <!-- <script src="js/mui.min.js"></script>-->
</head>
<body>
<div class="header">
    <a href="javascript:history.back(-1)">
        <img src="<%=basePath%>fontpage/images/zuojiantou.png">
    </a>
    <div>
        分类
    </div>
</div>
<div class="mui-content mui-row mui-fullscreen search-menu">
    <div class="mui-col-xs-3">
        <div id="segmentedControls"
             class="mui-segmented-control mui-segmented-control-inverted mui-segmented-control-vertical">

            <c:forEach var="i" items="${fatherPart}">

                <c:if test="${not empty pid}">
                    <c:if test="${i.id==pid}">
                        <a class="mui-control-item mui-active" href="#">
                                ${i.name}
                        </a>
                    </c:if>
                    <c:if test="${i.id!=pid}">
                        <a class="mui-control-item" href="<%=basePath%>part/toShopList?pid=${i.id}">
                                ${i.name}
                        </a>
                    </c:if>
                </c:if>
                <c:if test="${empty pid}">
                    <a class="mui-control-item" href="<%=basePath%>part/toShopList?pid=${i.id}">
                            ${i.name}
                    </a>
                </c:if>

            </c:forEach>

        </div>
    </div>
    <div id="segmentedControlContents" class="mui-col-xs-9">

        <div class="mui-control-content">

            <c:forEach var="i" items="${childParts}">

                <h2>
                    <a href="<%=basePath%>goods/toGoodsListPage?pid=${i.id}">
                        <span class="fl"> ${i.name}</span>
                    </a>
                    <a href="<%=basePath%>goods/toGoodsListPage?pid=${i.id}" class="fr">
                        <img class="youjiantou" src="<%=basePath%>fontpage/img/youjiantou.png">
                    </a>
                </h2>
                <c:forEach var="j" items="${allChild}">
                    <c:if test="${j.get('father_id')==i.id && not empty j.get('child_id')}">
                        <a href="<%=basePath%>goods/toGoodsListPage?pid=${j.get('child_id')}">
                            <li class="mui-table-view-cell">
                                <img src="<%=basePath%>fontpage/img/g_1705310944410103520.jpg">
                                <p>
                                    ${j.get("child_name")}
                                </p>
                            </li>
                        </a>
                    </c:if>

                </c:forEach>

            </c:forEach>

        </div>

        <%--<div id="content3" class="mui-control-content" style="display: none;">--%>
            <%--<ul class="mui-table-view">--%>
                <%--<h2><span class="fl"> 生鲜</span>--%>
                    <%--<a href="" class="fr">--%>
                        <%--<img class="youjiantou" src="<%=basePath%>fontpage/img/youjiantou.png">--%>
                    <%--</a></h2>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--草莓--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--橙.柚.柑--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--瓜类--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--梨--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--芒果--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--苹果--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
            <%--</ul>--%>
        <%--</div>--%>
        <%--<div id="content3" class="mui-control-content" style="display: none;">--%>
            <%--<ul class="mui-table-view">--%>
                <%--<h2><span class="fl">常用</span>--%>
                    <%--<a href="" class="fr">--%>
                        <%--<img class="youjiantou" src="<%=basePath%>fontpage/img/youjiantou.png">--%>
                    <%--</a></h2>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--草莓--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--橙.柚.柑--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--瓜类--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--梨--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--芒果--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
                <%--<a href="chanpinliebiao.php">--%>
                    <%--<li class="mui-table-view-cell">--%>
                        <%--<img src="<%=basePath%>fontpage/img/g_1706231810483115234.jpg">--%>
                        <%--<p>--%>
                            <%--苹果--%>
                        <%--</p>--%>
                    <%--</li>--%>
                <%--</a>--%>
            <%--</ul>--%>
        <%--</div>--%>

        <div style="width: 100%;height: 50px;"></div>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
<script type="text/javascript">
    $(function () {
        if (true) {
            $("#f2").html('<img src="<%=basePath%>fontpage/images/fenlei1.png">');
            $("#t2").css("color", "#ee4b02");
        }
    });
    $(".mui-control-item").click(function () {
        $(this).addClass("mui-active").siblings().removeClass("mui-active");
        var index = $(this).index();
        $(".mui-control-content").eq(index).show().siblings().hide();
    })
</script>