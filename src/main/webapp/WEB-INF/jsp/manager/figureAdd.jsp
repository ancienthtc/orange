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
    <link href="<%=basePath%>backpage/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=basePath%>css/admin/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
    <script src = "<%=basePath%>backpage/js/jquery-1.9.1.min.js" ></script>
    <script src="<%=basePath%>backpage/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/typeahead-bs2.min.js"></script>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>backpage/assets/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/icheck/jquery.icheck.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/Validform/5.3.2/Validform.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/webuploader/0.1.5/webuploader.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/ueditor/1.4.3/ueditor.config.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/ueditor/1.4.3/ueditor.all.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
    <script src="<%=basePath%>backpage/js/lrtk.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.admin.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/admin/bootstrap-fileinput.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/js/form.js"></script>
</head>
<body>
<div class="container">
    <div class="page-header">
        <form id="subForm" action="<%=basePath%>admin/FigureAdd" method="post" enctype="multipart/form-data">
            <div class="form-group" id="uploadForm" enctype='multipart/form-data'>
                <div class="h4">图片预览</div>
                <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                        <img id="picImg" style="width: 100%;height: auto;max-height: 140px;" src="<%=basePath%>images/default.png" alt="">
                    </div>
                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                    <div>
                        <span class="btn btn-primary btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">换一张</span>
                            <input type="file" name="file" id="picID" accept="image/gif,image/jpeg,image/x-png">
                        </span>
                        <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                    </div>
                </div>
                <%--<div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">--%>
                    <%--<div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">--%>
                        <%--<img id="picImg" style="width: 100%;height: auto;max-height: 140px;" src="<%=basePath%>images/default.png" alt="">--%>
                    <%--</div>--%>
                    <%--<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>--%>
                    <%--<div>--%>
                        <%--<span class="btn btn-primary btn-file">--%>
                            <%--<span class="fileinput-new">选择文件</span>--%>
                            <%--<span class="fileinput-exists">换一张</span>--%>
                            <%--<input type="file" name="pic1" id="picID" accept="image/gif,image/jpeg,image/x-png">--%>
                        <%--</span>--%>
                        <%--<a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">--%>
                    <%--<div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">--%>
                        <%--<img id="picImg" style="width: 100%;height: auto;max-height: 140px;" src="<%=basePath%>images/default.png" alt="">--%>
                    <%--</div>--%>
                    <%--<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>--%>
                    <%--<div>--%>
                        <%--<span class="btn btn-primary btn-file">--%>
                            <%--<span class="fileinput-new">选择文件</span>--%>
                            <%--<span class="fileinput-exists">换一张</span>--%>
                            <%--<input type="file" name="pic1" id="picID" accept="image/gif,image/jpeg,image/x-png">--%>
                        <%--</span>--%>
                        <%--<a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </div>
            <button type="button" id="uploadSubmit" class="btn btn-info">提交</button>
        </form>
    </div>
</div>
</body>

<script>
    $(function () {

        $("#uploadSubmit").click(function () {

            $("#subForm").ajaxSubmit({
                beforeSubmit: function () {

                },
                success:function (date) {
                    //console.log(date);
                    if(date=="true")
                        alert("添加成功");
                    else
                        alert("添加失败");
                    window.location.href="<%=basePath%>admin/toFigure";
                },
                error : function(data) {
                    alert("错误");
                }
            })

        });

    })
</script>

</html>

