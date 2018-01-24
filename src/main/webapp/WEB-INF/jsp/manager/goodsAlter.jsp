<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--<link href="assets/css/bootstrap.min.css" rel="stylesheet" />-->
    <link rel="stylesheet" href="<%=basePath%>backpage/css/style.css"/>
    <link href="<%=basePath%>backpage/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>backpage/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/font-awesome.min.css"/>
    <link href="<%=basePath%>css/admin/bootstrap-fileinput.css" rel="stylesheet">
    <link href="<%=basePath%>backpage/Widget/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>backpage/Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css"/>
    <!-- 提示框CSS -->
    <link href="<%=basePath%>css/admin/jquery-confirm.css" rel="stylesheet" type="text/css"/>

    <title>新增图片</title>
</head>
<body>
<div class="clearfix" id="add_picture">
    <div class="page_right_style" style="height: auto !important;">
        <div class="type_title">添加商品</div>
        <form action="<%=basePath%>goods/update" method="post" class="form form-horizontal" id="form-article-add" enctype="multipart/form-data">
            <input type="hidden" name="id" id="gid" value="${goods.id}">
            <div class=" clearfix cl">
                <div class="spmc_tj">
                    <div>
                        <span>商品(中文)</span>
                        <input type="text" name="name" value="${goods.name}"/>
                    </div>
                    <div>
                        <span>商品(日文)</span>
                        <input type="text" name="nameJ" value="${goods.nameJ}"/>
                    </div>
                </div>
                <div class="zwcs">
                    <div class="zwcs_bt">参数(中文)</div>
                    </br>
                    <div><span>参数1</span><input type="text" name="parameter1" value="${goods.parameter1}"/></div>
                    <div><span>参数2</span><input type="text" name="parameter2" value="${goods.parameter2}"/></div>
                    <div><span>参数3</span><input type="text" name="parameter3" value="${goods.parameter3}"/></div>
                </div>
                <div class="zwcs">
                    <div class="zwcs_bt">参数(日文)</div>
                    </br>
                    <div><span>参数1</span><input type="text" name="parameter1J" value="${goods.parameter1J}"/></div>
                    <div><span>参数2</span><input type="text" name="parameter2J" value="${goods.parameter2J}"/></div>
                    <div><span>参数3</span><input type="text" name="parameter3J" value="${goods.parameter3J}"/></div>
                </div>
            </div>
            <!-- 图片 -->
            <div class="container">
                <div class="page-header">

                    <div class="form-group" id="uploadForm" enctype='multipart/form-data'>
                        <div class="h4" style="margin: 10px 0 10px 0;">图片预览</div>
                        <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                            <div class="fileinput-new thumbnail" style="width: 100%;height: auto;max-height:150px;">
                                <img id="picImg" style="width:200px;height: auto;max-height: 140px;"
                                     src="<%=basePath%>image/goods?pic=${goods.pic1}" alt="">
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail"
                                 style="max-width: 100%; max-height: 150px;"></div>
                            <div>
                                <span class="btn btn-primary btn-file">
                                    <span class="fileinput-new">选择文件</span>
                                    <span class="fileinput-exists">换一张</span>
                                    <input type="file" name="file1" id="picID1" accept="image/gif,image/jpeg,image/x-png">
                                </span>
                                <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                            </div>
                        </div>
                        <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                            <div class="fileinput-new thumbnail" style="width:100%;height: auto;max-height:150px;">
                                <img id="picImg1" style="width:200px;height: auto;max-height: 140px;"
                                     src="<%=basePath%>image/goods?pic=${goods.pic2}" alt="">
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail"
                                 style="max-width: 100%; max-height: 150px;"></div>
                            <div>
                                <span class="btn btn-primary btn-file">
                                    <span class="fileinput-new">选择文件</span>
                                    <span class="fileinput-exists">换一张</span>
                                    <input type="file" name="file2" id="picID2" accept="image/gif,image/jpeg,image/x-png">
                                </span>
                                <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                            </div>
                        </div>
                        <div class="fileinput fileinput-new" data-provides="fileinput" id="exampleInputUpload">
                            <div class="fileinput-new thumbnail"
                                 style="width: 200px;height: auto;max-height:150px;">
                                <img id='picImg2' style="width:200px;height: auto;max-height: 140px;"
                                     src="<%=basePath%>image/goods?pic=${goods.pic3}" alt=""/>
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail"
                                 style="max-width: 100%; max-height: 150px;"></div>
                            <div>
                                <span class="btn btn-primary btn-file">
                                    <span class="fileinput-new">选择文件</span>
                                    <span class="fileinput-exists">换一张</span>

                                    <input type="file" name="file3" id="picID3" accept="image/gif,image/jpeg,image/x-png"/>
                                </span>
                                <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="spms_bj">
                <label class="form-label col-2">详情描述：</label>
                <div class="formControls col-10">
                    <textarea name="detail" cols="" rows="" class="textarea" placeholder="说点什么...最少输入10个字符" datatype="*10-100"
                              dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)">${goods.detail}</textarea>
                    <p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
                </div>
            </div>
            <div class="spms_bj">
                <label class="form-label col-2">详情描述(日)：</label>
                <div class="formControls col-10">
                    <textarea name="detailJ" cols="" rows="" class="textarea" placeholder="说点什么...最少输入10个字符" datatype="*10-100"
                              dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)">${goods.detailJ}</textarea>
                    <p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
                </div>
            </div>

            <div class="clearfix cl" style="margin: 0 0 20px 0;">
                <div class="Button_operation">
                    <button class="btn btn-primary radius" type="submit" id="goodsSub"><i class="icon-save "></i>确认</button>
                </div>
            </div>
        </form>
        <div class="clearfix_xq">
            <label class="form-label col-2">图片上传：</label>
           <br/> <div class="yxstp">
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            <div>
                <img src="<%=basePath%>backpage/images/yinghua.jpg" alt="">
                <span>删除</span>
            </div>
            </div>
            <div class="formControls col-10" style="width: 100%;">
                <div class="uploader-list-container">
                    <div class="queueList">
                        <div id="dndArea" class="placeholder">
                            <div id="filePicker-2"></div>
                            <p>商品详情图</p>
                        </div>
                    </div>
                    <div class="statusBar" style="display:none;">
                        <div class="progress"><span class="text">0%</span> <span class="percentage"></span></div>
                        <div class="info"></div>
                        <div class="btns">
                            <div id="filePicker2"></div>
                            <div class="uploadBtn">开始上传</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="shangxiaxian">
            <div class="xiaxian">
                <c:if test="${not empty goods.shelf}">
                    <input type="radio" name="checked" value="off"/>
                </c:if>
                <c:if test="${empty goods.shelf}">
                    <input type="radio" name="checked" value="off" checked="checked"/>
                </c:if>

                &nbsp;&nbsp;&nbsp;&nbsp;<span>商品下架</span>
            </div>
            <div class="shangxian">
                <c:if test="${not empty goods.shelf}">
                    <input type="radio" name="checked" value="on" checked="checked"/>
                </c:if>
                <c:if test="${empty goods.shelf}">
                    <input type="radio" name="checked" value="on"/>
                </c:if>

                &nbsp;&nbsp;&nbsp;&nbsp;<span>商品上架</span>
                <div class="search_sxx">
                    <ul class="search_content clearfix">
                        <li>
                            <label class="sx_wz">上线时间</label>
                            <input class="cp_tjsj laydate-icon" id="start" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" value="${goods.shelf.toLocaleString()}" style=" margin-left:10px;width: 170px;height: 30px;">
                            <button id="up" >上架</button>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="shangxiaxian">
            <c:if test="${goods.recommend==0}"><!-- 不推荐 -->
                <input type="checkbox" name="recommend">是否推荐(推荐上限:6)
            </c:if>
            <c:if test="${goods.recommend==1}"><!-- 推荐 -->
                <input type="checkbox" name="recommend" checked="checked">是否推荐(推荐上限:6)
            </c:if>

        </div>

        <div class="cpguige">
            <div class="cpguige_bt">产品规格:(Tips:1.更改销量会导致统计结果不准确 2.每个商品最多10个规格)</div>
            <table border="1" cellspacing="0" cellpadding="0" class="cpgg_nr">
                <thead>
                    <tr>
                        <th>规格号</th>
                        <th>规格名</th>
                        <th>规格名(日)</th>
                        <th>单位</th>
                        <th>单位(日)</th>
                        <th>价格</th>
                        <th>库存</th>
                        <th>销量</th>
                        <th>修改</th>
                        <th>删除</th>
                    </tr>
                </thead>
                <tbody id="tbody">
                    <c:forEach var="i" items="${formats}">
                        <tr class="cp_wzbj" value="${i.id}">
                            <th>${i.id}</th>
                            <th><input type="text" name="fname" value="${i.fname}"/></th>
                            <th><input type="text" name="fnameJ" value="${i.fnameJ}"/></th>
                            <th><input type="text" name="fclass" value="${i.fclass}"/></th>
                            <th><input type="text" name="fclassJ" value="${i.fclassJ}"/></th>
                            <th><input type="text" name="price" value="${i.price}"/></th>
                            <th><input type="text" name="stock" value="${i.stock}"/></th>
                            <th><input type="text" name="sales" value="${i.sales}"/></th>
                            <th><input type="button" value="修改" class="table_xg"/></th>
                            <th><input type="button" value="删除" class="table_sc"/></th>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <form action="<%=basePath%>goods/formatAdd" method="post" id="formatForm">
                <input type="hidden" name="goods" value="${goods.id}">
                <div class="cpgg_tj">
                    <span>规格名:</span>
                    <input type="text" name="fname"  value="" placeholder="请输入规格名"/>
                </div>
                <div class="cpgg_tj">
                    <span>规格名(日):</span>
                    <input type="text" name="fnameJ"  value="" placeholder="请输入规格名"/>
                </div>
                <div class="cpgg_tj_2">
                    <div>
                        <span>单位:</span>
                        <input type="text" name="fclass" placeholder="请输入单位"/>
                    </div>
                    <div>
                        <span>单位(日):</span>
                        <input type="text" name="fclassJ" placeholder="请输入单位(日)"/>
                    </div>
                    <div>
                        <span>价格:</span>
                        <input type="text" name="price" placeholder="请输入产品价格"/>
                    </div>
                    <div>
                        <span>库存:</span>
                        <input type="text" name="stock" placeholder="请输入库存"/>
                    </div>
                </div>
                <div class="cpgg_form">
                    <input type="button" value="添加产品" id="formatSub"/>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
</div>
<script src="<%=basePath%>backpage/js/jquery-1.9.1.min.js"></script>
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
<script src="<%=basePath%>js/admin/bootstrap-fileinput.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/js/form.js"></script>
<!-- 提示框插件 -->
<script type="text/javascript" src="<%=basePath%>js/admin/jquery-confirm.js"></script>
<script type="text/javascript" src="<%=basePath%>js/admin/jquery.sticky.min.js"></script>
<!-- 日期插件 -->
<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>

<script>

    $(function () {
        // $("#goodsSub").click(function () {
        //     $("#form-article-add").ajaxSubmit({
        //         beforeSubmit: function () {
        //         },
        //         success:function (date) {
        //             console.log(date);
        //             if(date=="true")
        //                 alert("添加成功");
        //             else
        //                 alert("添加失败");
        //         },
        //         error : function(data) {
        //             alert("错误");
        //         }
        //     })
        // });
        <!-- format表单提交 -->
        $("#formatSub").click(function () {
            $("#formatForm").ajaxSubmit({
                beforeSubmit: function () {
                },
                success:function (date) {
                    //console.log(date);
                    if(date=="true" || date==true)
                        alert("添加成功");
                    else
                        alert("添加失败");
                    window.location.href="<%=basePath%>goods/toGoodsAlter/"+$("#gid").val();
                },
                error : function(data) {
                    alert("错误");
                }
            })
        });

        <!-- 下架 -->
        var radios=$('input[name="checked"]');
        radios.change(function () {
            var s=$(this).val();
            if(s=="off")
            {
                //alert("下架");
                $.post("<%=basePath%>goods/shelf",{id:$("#gid").val(),shelf:null},
                    function(result){
                    if(result=="true" || result==true)
                        alert("下架成功");
                    else
                        alert("下架失败");
                },"json");
            }
        });
        <!-- 上架 -->
        $("#up").click(function () {
            var v=$('input[name="checked"]:checked').val();
            if(v=="on")
            {
                if($("#start").val().length<=0)
                {
                    alert("必须选日期");
                    return false;
                }
                //alert("上架");
                $.post("<%=basePath%>goods/shelf",{id:$("#gid").val(),shelf:$("#start").val()},
                    function(result){
                        if(result=="true" || result==true)
                            alert("上架成功");
                        else
                            alert("上架失败,请确保至少一个库存大于0的规格");
                },"json");
            }
        });

        var recommend=$('input[name="recommend"]');
        recommend.change(function () {
           if(recommend.prop("checked"))
           {
               //alert("选中");//推荐
               $.post("<%=basePath%>goods/recommend",{id:$("#gid").val(),recommend:1},
                   function(result){
                       if(result==true)
                           alert("推荐成功");
                       else
                       {
                           alert("推荐失败");
                           recommend.removeAttr("checked");
                       }


                   },"json");
           }
           else {
               //alert("未选中");//取消
               $.post("<%=basePath%>goods/recommend",{id:$("#gid").val(),recommend:0},
                   function(result){
                       if(result==true)
                           alert("取消成功");
                       else
                           alert("取消失败");
               },"json");
           }
        });

    })


    //规格修改
    $('.table_xg').click(function () {
        var tr=$(this).parent().parent();
        var id=tr.attr("value");
        var fname = tr.find("input[name='fname']").val();
        var fnameJ = tr.find("input[name='fnameJ']").val();
        var fclass = tr.find("input[name='fclass']").val();
        var fclassJ = tr.find("input[name='fclassJ']").val();
        var price = tr.find("input[name='price']").val();
        var stock = tr.find("input[name='stock']").val();
        var sales = tr.find("input[name='sales']").val();
        var date={id:id,fname:fname,fnameJ:fnameJ,fclass:fclass,fclassJ:fclassJ,price:price,stock:stock,sales:sales};
        $.post("<%=basePath%>goods/formatUpdate",date,
            function(result){
                if(result==true)
                    alert("修改成功");
                else
                    alert("修改失败");
        },"json");
    });

    //规格删除
    $(".table_sc").click(function () {
        var tr=$(this).parent().parent();
        var id=tr.attr("value");
        $.confirm({
            title: '警告',
            content: '确认删除?',
            confirm: function(){
                var date={id:id};
                $.post("<%=basePath%>goods/formatDel",date,
                    function(result){
                        if(result==true)
                        {
                            alert("删除成功");
                            tr.remove();
                        }
                        else
                            alert("修改失败");
                },"json");
            },
            cancel: function(){

            }
        });
    });


</script>

<script>
    $(function () {
        $("#add_picture").fix({
            float: 'left',
            skin: 'green',
            durationTime: false,
            stylewidth: '220',
            spacingw: 0,
            spacingh: 260,
        });
    });
    $(document).ready(function () {
//初始化宽度、高度

        $(".widget-box").height($(window).height());
        $(".page_right_style").height($(window).height());
        $(".page_right_style").width($(window).width() - 220);
        //当文档窗口发生改变时 触发
        $(window).resize(function () {

            $(".widget-box").height($(window).height());
            $(".page_right_style").height($(window).height());
            $(".page_right_style").width($(window).width() - 220);
        });
    });
    $(function () {
        var ue = UE.getEditor('editor');
    });
    /******树状图********/
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

    var zNodes = [
        {id: 1, pId: 0, name: "商城分类列表", open: true},
        {id: 11, pId: 1, name: "蔬菜水果"},
        {id: 111, pId: 11, name: "蔬菜"},
        {id: 112, pId: 11, name: "苹果"},
        {id: 113, pId: 11, name: "大蒜"},
        {id: 114, pId: 11, name: "白菜"},
        {id: 115, pId: 11, name: "青菜"},
        {id: 12, pId: 1, name: "手机数码"},
        {id: 121, pId: 12, name: "手机 "},
        {id: 122, pId: 12, name: "照相机 "},
        {id: 13, pId: 1, name: "电脑配件"},
        {id: 131, pId: 13, name: "手机 "},
        {id: 122, pId: 13, name: "照相机 "},
        {id: 14, pId: 1, name: "服装鞋帽"},
        {id: 141, pId: 14, name: "手机 "},
        {id: 42, pId: 14, name: "照相机 "},
    ];

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
        //demoIframe.bind("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        //zTree.selectNode(zTree.getNodeByParam("id",'11'));
    });
</script>
<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $list = $("#fileList"),
            $btn = $("#btn-star"),
            state = "pending",
            uploader;

        var uploader = WebUploader.create({
            auto: true,
            swf: 'lib/webuploader/0.1.5/Uploader.swf',

            // 文件接收服务端。
            server: 'http://lib.h-ui.net/webuploader/0.1.5/server/fileupload.php',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#filePicker',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false,
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });
        uploader.on('fileQueued', function (file) {
            var $li = $(
                '<div id="' + file.id + '" class="item">' +
                '<div class="pic-box"><img></div>' +
                '<div class="info">' + file.name + '</div>' +
                '<p class="state">等待上传...</p>' +
                '</div>'
                ),
                $img = $li.find('img');
            $list.append($li);

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb(file, function (error, src) {
                if (error) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr('src', src);
            }, thumbnailWidth, thumbnailHeight);
        });
        // 文件上传过程中创建进度条实时显示。
        uploader.on('uploadProgress', function (file, percentage) {
            var $li = $('#' + file.id),
                $percent = $li.find('.progress-box .sr-only');

            // 避免重复创建
            if (!$percent.length) {
                $percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo($li).find('.sr-only');
            }
            $li.find(".state").text("上传中");
            $percent.css('width', percentage * 100 + '%');
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on('uploadSuccess', function (file) {
            $('#' + file.id).addClass('upload-state-success').find(".state").text("已上传");
        });

        // 文件上传失败，显示上传出错。
        uploader.on('uploadError', function (file) {
            $('#' + file.id).addClass('upload-state-error').find(".state").text("上传出错");
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on('uploadComplete', function (file) {
            $('#' + file.id).find('.progress-box').fadeOut();
        });
        uploader.on('all', function (type) {
            if (type === 'startUpload') {
                state = 'uploading';
            } else if (type === 'stopUpload') {
                state = 'paused';
            } else if (type === 'uploadFinished') {
                state = 'done';
            }

            if (state === 'uploading') {
                $btn.text('暂停上传');
            } else {
                $btn.text('开始上传');
            }
        });

        $btn.on('click', function () {
            if (state === 'uploading') {
                uploader.stop();
            } else {
                uploader.upload();
            }
        });

    });

    (function ($) {
        // 当domReady的时候开始初始化
        $(function () {
            var $wrap = $('.uploader-list-container'),

                // 图片容器
                $queue = $('<ul class="filelist"></ul>')
                    .appendTo($wrap.find('.queueList')),

                // 状态栏，包括进度和控制按钮
                $statusBar = $wrap.find('.statusBar'),

                // 文件总体选择信息。
                $info = $statusBar.find('.info'),

                // 上传按钮
                $upload = $wrap.find('.uploadBtn'),

                // 没选择文件之前的内容。
                $placeHolder = $wrap.find('.placeholder'),

                $progress = $statusBar.find('.progress').hide(),

                // 添加的文件数量
                fileCount = 0,

                // 添加的文件总大小
                fileSize = 0,

                // 优化retina, 在retina下这个值是2
                ratio = window.devicePixelRatio || 1,

                // 缩略图大小
                thumbnailWidth = 110 * ratio,
                thumbnailHeight = 110 * ratio,

                // 可能有pedding, ready, uploading, confirm, done.
                state = 'pedding',

                // 所有文件的进度信息，key为file id
                percentages = {},
                // 判断浏览器是否支持图片的base64
                isSupportBase64 = (function () {
                    var data = new Image();
                    var support = true;
                    data.onload = data.onerror = function () {
                        if (this.width != 1 || this.height != 1) {
                            support = false;
                        }
                    }
                    data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                    return support;
                })(),

                // 检测是否已经安装flash，检测flash的版本
                flashVersion = (function () {
                    var version;

                    try {
                        version = navigator.plugins['Shockwave Flash'];
                        version = version.description;
                    } catch (ex) {
                        try {
                            version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
                                .GetVariable('$version');
                        } catch (ex2) {
                            version = '0.0';
                        }
                    }
                    version = version.match(/\d+/g);
                    return parseFloat(version[0] + '.' + version[1], 10);
                })(),

                supportTransition = (function () {
                    var s = document.createElement('p').style,
                        r = 'transition' in s ||
                            'WebkitTransition' in s ||
                            'MozTransition' in s ||
                            'msTransition' in s ||
                            'OTransition' in s;
                    s = null;
                    return r;
                })(),

                // WebUploader实例
                uploader;

            if (!WebUploader.Uploader.support('flash') && WebUploader.browser.ie) {

                // flash 安装了但是版本过低。
                if (flashVersion) {
                    (function (container) {
                        window['expressinstallcallback'] = function (state) {
                            switch (state) {
                                case 'Download.Cancelled':
                                    alert('您取消了更新！')
                                    break;

                                case 'Download.Failed':
                                    alert('安装失败')
                                    break;

                                default:
                                    alert('安装已成功，请刷新！');
                                    break;
                            }
                            delete window['expressinstallcallback'];
                        };

                        var swf = 'expressInstall.swf';
                        // insert flash object
                        var html = '<object type="application/' +
                            'x-shockwave-flash" data="' + swf + '" ';

                        if (WebUploader.browser.ie) {
                            html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                        }

                        html += 'width="100%" height="100%" style="outline:0">' +
                            '<param name="movie" value="' + swf + '" />' +
                            '<param name="wmode" value="transparent" />' +
                            '<param name="allowscriptaccess" value="always" />' +
                            '</object>';

                        container.html(html);

                    })($wrap);

                    // 压根就没有安转。
                } else {
                    $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
                }

                return;
            } else if (!WebUploader.Uploader.support()) {
                alert('Web Uploader 不支持您的浏览器！');
                return;
            }

            // 实例化
            uploader = WebUploader.create({
                pick: {
                    id: '#filePicker-2',
                    label: '点击选择图片'
                },
                formData: {
                    uid: 123
                },
                dnd: '#dndArea',
                paste: '#uploader',
                swf: 'lib/webuploader/0.1.5/Uploader.swf',
                chunked: false,
                chunkSize: 512 * 1024,
                server: 'http://lib.h-ui.net/webuploader/0.1.5/server/fileupload.php',
                // runtimeOrder: 'flash',

                // accept: {
                //     title: 'Images',
                //     extensions: 'gif,jpg,jpeg,bmp,png',
                //     mimeTypes: 'image/*'
                // },

                // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
                disableGlobalDnd: true,
                fileNumLimit: 300,
                fileSizeLimit: 200 * 1024 * 1024,    // 200 M
                fileSingleSizeLimit: 50 * 1024 * 1024    // 50 M
            });

            // 拖拽时不接受 js, txt 文件。
            uploader.on('dndAccept', function (items) {
                var denied = false,
                    len = items.length,
                    i = 0,
                    // 修改js类型
                    unAllowed = 'text/plain;application/javascript ';

                for (; i < len; i++) {
                    // 如果在列表里面
                    if (~unAllowed.indexOf(items[i].type)) {
                        denied = true;
                        break;
                    }
                }

                return !denied;
            });

            uploader.on('dialogOpen', function () {
                console.log('here');
            });

            // uploader.on('filesQueued', function() {
            //     uploader.sort(function( a, b ) {
            //         if ( a.name < b.name )
            //           return -1;
            //         if ( a.name > b.name )
            //           return 1;
            //         return 0;
            //     });
            // });

            // 添加“添加文件”的按钮，
            uploader.addButton({
                id: '#filePicker2',
                label: '继续添加'
            });

            uploader.on('ready', function () {
                window.uploader = uploader;
            });

            // 当有文件添加进来时执行，负责view的创建
            function addFile(file) {
                var $li = $('<li id="' + file.id + '">' +
                    '<p class="title">' + file.name + '</p>' +
                    '<p class="imgWrap"></p>' +
                    '<p class="progress"><span></span></p>' +
                    '</li>'),

                    $btns = $('<div class="file-panel">' +
                        '<span class="cancel">删除</span>' +
                        '<span class="rotateRight">向右旋转</span>' +
                        '<span class="rotateLeft">向左旋转</span></div>').appendTo($li),
                    $prgress = $li.find('p.progress span'),
                    $wrap = $li.find('p.imgWrap'),
                    $info = $('<p class="error"></p>'),

                    showError = function (code) {
                        switch (code) {
                            case 'exceed_size':
                                text = '文件大小超出';
                                break;

                            case 'interrupt':
                                text = '上传暂停';
                                break;

                            default:
                                text = '上传失败，请重试';
                                break;
                        }

                        $info.text(text).appendTo($li);
                    };

                if (file.getStatus() === 'invalid') {
                    showError(file.statusText);
                } else {
                    // @todo lazyload
                    $wrap.text('预览中');
                    uploader.makeThumb(file, function (error, src) {
                        var img;

                        if (error) {
                            $wrap.text('不能预览');
                            return;
                        }

                        if (isSupportBase64) {
                            img = $('<img src="' + src + '">');
                            $wrap.empty().append(img);
                        } else {
                            $.ajax('lib/webuploader/0.1.5/server/preview.php', {
                                method: 'POST',
                                data: src,
                                dataType: 'json'
                            }).done(function (response) {
                                if (response.result) {
                                    img = $('<img src="' + response.result + '">');
                                    $wrap.empty().append(img);
                                } else {
                                    $wrap.text("预览出错");
                                }
                            });
                        }
                    }, thumbnailWidth, thumbnailHeight);

                    percentages[file.id] = [file.size, 0];
                    file.rotation = 0;
                }

                file.on('statuschange', function (cur, prev) {
                    if (prev === 'progress') {
                        $prgress.hide().width(0);
                    } else if (prev === 'queued') {
                        $li.off('mouseenter mouseleave');
                        $btns.remove();
                    }

                    // 成功
                    if (cur === 'error' || cur === 'invalid') {
                        console.log(file.statusText);
                        showError(file.statusText);
                        percentages[file.id][1] = 1;
                    } else if (cur === 'interrupt') {
                        showError('interrupt');
                    } else if (cur === 'queued') {
                        percentages[file.id][1] = 0;
                    } else if (cur === 'progress') {
                        $info.remove();
                        $prgress.css('display', 'block');
                    } else if (cur === 'complete') {
                        $li.append('<span class="success"></span>');
                    }

                    $li.removeClass('state-' + prev).addClass('state-' + cur);
                });

                $li.on('mouseenter', function () {
                    $btns.stop().animate({height: 30});
                });

                $li.on('mouseleave', function () {
                    $btns.stop().animate({height: 0});
                });

                $btns.on('click', 'span', function () {
                    var index = $(this).index(),
                        deg;

                    switch (index) {
                        case 0:
                            uploader.removeFile(file);
                            return;

                        case 1:
                            file.rotation += 90;
                            break;

                        case 2:
                            file.rotation -= 90;
                            break;
                    }

                    if (supportTransition) {
                        deg = 'rotate(' + file.rotation + 'deg)';
                        $wrap.css({
                            '-webkit-transform': deg,
                            '-mos-transform': deg,
                            '-o-transform': deg,
                            'transform': deg
                        });
                    } else {
                        $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
                        // use jquery animate to rotation
                        // $({
                        //     rotation: rotation
                        // }).animate({
                        //     rotation: file.rotation
                        // }, {
                        //     easing: 'linear',
                        //     step: function( now ) {
                        //         now = now * Math.PI / 180;

                        //         var cos = Math.cos( now ),
                        //             sin = Math.sin( now );

                        //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
                        //     }
                        // });
                    }


                });

                $li.appendTo($queue);
            }

            // 负责view的销毁
            function removeFile(file) {
                var $li = $('#' + file.id);

                delete percentages[file.id];
                updateTotalProgress();
                $li.off().find('.file-panel').off().end().remove();
            }

            function updateTotalProgress() {
                var loaded = 0,
                    total = 0,
                    spans = $progress.children(),
                    percent;

                $.each(percentages, function (k, v) {
                    total += v[0];
                    loaded += v[0] * v[1];
                });

                percent = total ? loaded / total : 0;


                spans.eq(0).text(Math.round(percent * 100) + '%');
                spans.eq(1).css('width', Math.round(percent * 100) + '%');
                updateStatus();
            }

            function updateStatus() {
                var text = '', stats;

                if (state === 'ready') {
                    text = '选中' + fileCount + '张图片，共' +
                        WebUploader.formatSize(fileSize) + '。';
                } else if (state === 'confirm') {
                    stats = uploader.getStats();
                    if (stats.uploadFailNum) {
                        text = '已成功上传' + stats.successNum + '张照片至XX相册，' +
                            stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
                    }

                } else {
                    stats = uploader.getStats();
                    text = '共' + fileCount + '张（' +
                        WebUploader.formatSize(fileSize) +
                        '），已上传' + stats.successNum + '张';

                    if (stats.uploadFailNum) {
                        text += '，失败' + stats.uploadFailNum + '张';
                    }
                }

                $info.html(text);
            }

            function setState(val) {
                var file, stats;

                if (val === state) {
                    return;
                }

                $upload.removeClass('state-' + state);
                $upload.addClass('state-' + val);
                state = val;

                switch (state) {
                    case 'pedding':
                        $placeHolder.removeClass('element-invisible');
                        $queue.hide();
                        $statusBar.addClass('element-invisible');
                        uploader.refresh();
                        break;

                    case 'ready':
                        $placeHolder.addClass('element-invisible');
                        $('#filePicker2').removeClass('element-invisible');
                        $queue.show();
                        $statusBar.removeClass('element-invisible');
                        uploader.refresh();
                        break;

                    case 'uploading':
                        $('#filePicker2').addClass('element-invisible');
                        $progress.show();
                        $upload.text('暂停上传');
                        break;

                    case 'paused':
                        $progress.show();
                        $upload.text('继续上传');
                        break;

                    case 'confirm':
                        $progress.hide();
                        $('#filePicker2').removeClass('element-invisible');
                        $upload.text('开始上传');

                        stats = uploader.getStats();
                        if (stats.successNum && !stats.uploadFailNum) {
                            setState('finish');
                            return;
                        }
                        break;
                    case 'finish':
                        stats = uploader.getStats();
                        if (stats.successNum) {
                            alert('上传成功');
                        } else {
                            // 没有成功的图片，重设
                            state = 'done';
                            location.reload();
                        }
                        break;
                }

                updateStatus();
            }

            uploader.onUploadProgress = function (file, percentage) {
                var $li = $('#' + file.id),
                    $percent = $li.find('.progress span');

                $percent.css('width', percentage * 100 + '%');
                percentages[file.id][1] = percentage;
                updateTotalProgress();
            };

            uploader.onFileQueued = function (file) {
                fileCount++;
                fileSize += file.size;

                if (fileCount === 1) {
                    $placeHolder.addClass('element-invisible');
                    $statusBar.show();
                }

                addFile(file);
                setState('ready');
                updateTotalProgress();
            };

            uploader.onFileDequeued = function (file) {
                fileCount--;
                fileSize -= file.size;

                if (!fileCount) {
                    setState('pedding');
                }

                removeFile(file);
                updateTotalProgress();

            };

            uploader.on('all', function (type) {
                var stats;
                switch (type) {
                    case 'uploadFinished':
                        setState('confirm');
                        break;

                    case 'startUpload':
                        setState('uploading');
                        break;

                    case 'stopUpload':
                        setState('paused');
                        break;

                }
            });

            uploader.onError = function (code) {
                alert('Eroor: ' + code);
            };

            $upload.on('click', function () {
                if ($(this).hasClass('disabled')) {
                    return false;
                }

                if (state === 'ready') {
                    uploader.upload();
                } else if (state === 'paused') {
                    uploader.upload();
                } else if (state === 'uploading') {
                    uploader.stop();
                }
            });

            $info.on('click', '.retry', function () {
                uploader.retry();
            });

            $info.on('click', '.ignore', function () {
                alert('todo');
            });

            $upload.addClass('state-' + state);
            updateTotalProgress();
        });

    })(jQuery);
</script>

</body>
</html>
<script>
    jQuery(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 2, 3, 4, 5, 8, 9]}// 制定列不参与排序
            ]
        });


        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }
    });
    // laydate({
    //     elem: '#start',
    //     event: 'focus'
    // });
    $(function () {
        $("#products_style").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 30,//设置隐藏时的距离
            spacingh: 260,//设置显示时间距
        });
    });
</script>
<script type="text/javascript">
    // $('.table_sc').click(function () {
    //     $(this).parent('th').parent('tr').remove();
    // });
</script>
