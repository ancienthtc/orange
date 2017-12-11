<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%=basePath%>backpage/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/css/style.css"/>
    <link href="<%=basePath%>backpage/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/font-awesome.min.css"/>
    <script src="<%=basePath%>backpage/assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='<%=basePath%>backpage/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
    </script>
    <script src="<%=basePath%>backpage/assets/js/ace-elements.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/ace.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/typeahead-bs2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
    <script src="<%=basePath%>backpage/js/lrtk.js" type="text/javascript"></script>
    <title>分类管理</title>
</head>
<body>
<div class=" clearfix">
    <div id="category">
        <!---->
        <iframe ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO SRC="<%=basePath%>part/toPartAdd"
                class="page_right_style"></iframe>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $("#category").fix({
            float: 'left',
            skin: 'green',
            durationTime: false
        });
    });
</script>
<script type="text/javascript">
    //初始化宽度、高度
    $(".widget-box").height($(window).height());
    $(".page_right_style").width($(window).width() - 220);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height());
        $(".page_right_style").width($(window).width() - 220);
    })

    /**************/
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function (treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                    return false;
                } else {
                    demoIframe.attr("src", treeNode.file + ".html");
                    return true;
                }
            }
        }
    };
    var code;

    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("<li>" + str + "</li>");
    }

    $(document).ready(function () {
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting, zNodes);
        demoIframe = $("#testIframe");
        demoIframe.bind("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        zTree.selectNode(zTree.getNodeByParam("id", '11'));
    });
</script>