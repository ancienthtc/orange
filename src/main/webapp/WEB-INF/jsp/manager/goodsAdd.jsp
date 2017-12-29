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
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="<%=basePath%>backpage/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath%>backpage/css/style.css"/>
    <link href="<%=basePath%>backpage/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=basePath%>backpage/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <link href="<%=basePath%>backpage/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>backpage/Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />

    <title></title>
</head>
<body>
<header>
    <div class="container">
        <div class="type_title">创建商品</div>
    </div>
</header>
<div class="clearfix" id="add_picture">
    <div class="container">

        <form action="<%=basePath%>goods/add" method="post" class="form form-horizontal" id="form-article-add" enctype="multipart/form-data">
            <div class=" clearfix cl">

                <div class="Add_p_s">
                    <label class="form-label col-2">商品中文名：</label>
                    <div class="formControls col-5"><input type="text" class="input-text" value="" placeholder="填写商品中文名" id="name" name="name"></div>
                </div>
                <div class="Add_p_s">
                    <label class="form-label col-2">商品日文名：</label>
                    <div class="formControls col-5"><input type="text" class="input-text" value="" placeholder="填写商品日文名" id="nameJ" name="nameJ"></div>
                </div>


            </div>
            <div class="clearfix fl">
                <label class=" col-12">中文参数</label>
            </div>
            <div class=" clearfix cl">

                <div class="Add_p_s-canshu">
                    <label class="form-label col-2">参数1：</label>
                    <div class="formControls-canshu col-3"><input type="text" class="input-text" value="" placeholder="" id="parameter1" name="parameter1"></div>
                </div>
                <div class="Add_p_s-canshu">
                    <label class="form-label col-2">参数2：</label>
                    <div class="formControls-canshu col-3"><input type="text" class="input-text" value="" placeholder="" id="parameter2" name="parameter2"></div>
                </div>
                <div class="Add_p_s-canshu">
                    <label class="form-label col-2">参数3：</label>
                    <div class="formControls-canshu col-3"><input type="text" class="input-text" value="" placeholder="" id="parameter3" name="parameter3"></div>
                </div>



            </div>
            <div class="clearfix ">
                <label class=" col-12">日文参数</label>
            </div>
            <div class=" clearfix cl">

                <div class="Add_p_s-canshu">
                    <label class="form-label col-2">参数1：</label>
                    <div class="formControls-canshu col-3"><input type="text" class="input-text" value="" placeholder="" id="parameter1J" name="parameter1J"></div>
                </div>
                <div class="Add_p_s-canshu">
                    <label class="form-label col-2">参数2：</label>
                    <div class="formControls-canshu col-3"><input type="text" class="input-text" value="" placeholder="" id="parameter2J" name="parameter2J"></div>
                </div>
                <div class="Add_p_s-canshu">
                    <label class="form-label col-2">参数3：</label>
                    <div class="formControls-canshu col-3"><input type="text" class="input-text" value="" placeholder="" id="parameter3J" name="parameter3J"></div>
                </div>



            </div>

            <%--<div class="clearfix cl">--%>
                <%--<label class="form-label col-2">上架日期：</label>--%>
                <%--<div class="formControls col-2">--%>
                    <%--<input class="inline laydate-icon" id="start" name="shelf" style=" margin-left:10px;">--%>
                <%--</div>--%>
                <%--<div class="formControls col-2">--%>
                    <%--<input type="button" class="input-text" value="下架" placeholder="" id="" name="">--%>
                <%--</div>--%>
                <%--<div class="formControls col-2 skin-minimal">--%>
                    <%--<div class="check-box" style=" margin-top:5px">--%>
                        <%--<input type="checkbox" id="checkbox-1"><label for="checkbox-1">&nbsp;</label>是否设置为推荐商品（推荐商品上线为8）</div>--%>
                <%--</div>--%>
            <%--</div>--%>

            <div class="clearfix cl">
                <label class="form-label col-2">图片说明1：</label>
                <div class="formControls col-2 "  style="margin-top: 5px">
                    <input type="file" id="exampleInputFile1" name="file1" >
                </div>
            </div>
            <div class="clearfix cl">
                <label class="form-label col-2">图片说明2：</label>
                <div class="formControls col-2 "  style="margin-top: 5px">
                    <input type="file" id="exampleInputFile2" name="file2" >
                </div>
            </div>
            <div class="clearfix cl">
                <label class="form-label col-2">图片说明3：</label>
                <div class="formControls col-2 " style="margin-top: 5px">
                    <input type="file" id="exampleInputFile3" name="file3" >
                </div>
            </div>

            <div class="clearfix cl">
                <label class="form-label col-2">详细内容：</label>
                <div class="formControls col-10">
                    <textarea class="form-control" rows="3" name="detail"></textarea>
                </div>
            </div>
            <div class="clearfix cl">
                <label class="form-label col-2">详细内容日：</label>
                <div class="formControls col-10">
                    <textarea class="form-control" rows="3" name="detailJ"></textarea>
                </div>
            </div>

            <div class="clearfix cl">
                <label class="form-label color_part"><span class="c-red"></span>选择所属分类*：</label>
                <select id="f1" name="part" onchange="" style="margin-left:10px;">
                    <option value="-1">选择分类</option>
                </select>
                <select id="f2" name="part" style="margin-left:10px;">

                </select>

                <select id="f3" name="part" style="margin-left:10px;">

                </select>

            </div>

            <div class="clearfix cl">
                <div class="Button_operation">
                    <button  class="btn btn-primary radius" type="submit"><i class="icon-save "></i>保存并提交审核</button>
                    <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
                </div>
            </div>
        </form>

    </div>
</div>
</div>
<%--<script src="<%=basePath%>backpage/js/jquery-1.9.1.min.js"></script>--%>
<script src="<%=basePath%>js/admin/jquery-3.1.1.js"></script>
<script src="<%=basePath%>backpage/assets/js/bootstrap.min.js"></script>
<script src="<%=basePath%>backpage/assets/js/typeahead-bs2.min.js"></script>
<script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript" ></script>
<script src="<%=basePath%>backpage/assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>backpage/Widget/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/Widget/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/Widget/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/Widget/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/Widget/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="<%=basePath%>backpage/Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script src="<%=basePath%>backpage/js/lrtk.js" type="text/javascript" ></script>
<script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.admin.js"></script>

<script>
    $(function() {

        $.ajax({
            url:"<%=basePath%>part/getPartChoiceFather",
            //data:{aid:$(this).attr("aid")},
            type:"post",
            dataType:"text",
            success:function(result){
                var f1=$("#f1");
                f1.empty();
                console.log(result);
                f1.append("<option value='-1'>选择分类</option>");


                $.each($.parseJSON(result), function (index,row) {
                    //console.log( this[index]["name"] );
                    //console.log( this[index].name + "  " + this[this].nameJ );
                    //console.log( row.name+"  "+row.nameJ );
                    f1.append("<option value="+row.id+">中文名:"+row.name+"  日文名:"+row.nameJ+"</option>");
                })

                // $.each(result,function(i,row){
                //     f1.append("<option value="+row.id+">中文名:"+row.name+"  日文名:"+row.nameJ+"</option>");
                //     console.log(result[i].id + " " + result[i].name);
                // })

            },
            error:function(){
                alert("请求失败");
            }
        });


        //给下拉列表添加事件
        $("#f1").change(function(){
            $.post("<%=basePath%>part/getPartChoiceChild",{id:$(this).val()},
                function(result){
                    console.log(result);
                    var f2=$("#f2");
                    f2.empty();
                    var f3=$("#f3");
                    f3.empty();
                    if(result.length>0)
                    {
                        f2.append("<option value='-2'>选择</option>");
                    }
                    for(var i=0;i<result.length;i++)
                    {
                        f2.append("<option value="+result[i].id+">中文名:"+result[i].name+"  日文名:"+result[i].nameJ+"</option>");
                    }

                },"json");
        });

        $("#f2").change(function(){
            $.post("<%=basePath%>part/getPartChoiceChild",{id:$(this).val()},
                function(result){
                    console.log(result);
                    var f3=$("#f3");
                    f3.empty();
                    if(result.length>0)
                    {
                        f3.append("<option value='-3'>选择</option>");
                    }
                    for(var i=0;i<result.length;i++)
                    {
                        f3.append("<option value="+result[i].id+">中文名:"+result[i].name+"  日文名:"+result[i].nameJ+"</option>");
                    }

                },"json");
        });


    });

</script>

<script>
    $(function() {
        $("#add_picture").fix({
            float : 'left',
            skin : 'green',
            durationTime :false,
            stylewidth:'220',
            spacingw:0,
            spacingh:260,
        });
    });
    $( document).ready(function(){
//初始化宽度、高度

        $(".widget-box").height($(window).height());
        $(".").height($(window).height());
        $(".").width($(window).width()-220);
        //当文档窗口发生改变时 触发
        $(window).resize(function(){

            $(".widget-box").height($(window).height());
            $(".").height($(window).height());
            $(".").width($(window).width()-220);
        });
    });
    $(function(){
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
                enable:true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                    return false;
                } else {
                    demoIframe.attr("src",treeNode.file + ".html");
                    return true;
                }
            }
        }
    };

    var zNodes =[
        { id:1, pId:0, name:"商城分类列表", open:true},
        { id:11, pId:1, name:"蔬菜水果"},
        { id:111, pId:11, name:"蔬菜"},
        { id:112, pId:11, name:"苹果"},
        { id:113, pId:11, name:"大蒜"},
        { id:114, pId:11, name:"白菜"},
        { id:115, pId:11, name:"青菜"},
        { id:12, pId:1, name:"手机数码"},
        { id:121, pId:12, name:"手机 "},
        { id:122, pId:12, name:"照相机 "},
        { id:13, pId:1, name:"电脑配件"},
        { id:131, pId:13, name:"手机 "},
        { id:122, pId:13, name:"照相机 "},
        { id:14, pId:1, name:"服装鞋帽"},
        { id:141, pId:14, name:"手机 "},
        { id:42, pId:14, name:"照相机 "},
    ];

    var code;

    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("<li>"+str+"</li>");
    }
    $(document).ready(function(){
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting, zNodes);
        demoIframe = $("#testIframe");
        //demoIframe.bind("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        //zTree.selectNode(zTree.getNodeByParam("id",'11'));
    });
</script>
<script type="text/javascript">
    $(function(){
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
        uploader.on( 'fileQueued', function( file ) {
            var $li = $(
                            '<div id="' + file.id + '" class="item">' +
                            '<div class="pic-box"><img></div>'+
                            '<div class="info">' + file.name + '</div>' +
                            '<p class="state">等待上传...</p>'+
                            '</div>'
                    ),
                    $img = $li.find('img');
            $list.append( $li );

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr( 'src', src );
            }, thumbnailWidth, thumbnailHeight );
        });
        // 文件上传过程中创建进度条实时显示。
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),
                    $percent = $li.find('.progress-box .sr-only');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
            }
            $li.find(".state").text("上传中");
            $percent.css( 'width', percentage * 100 + '%' );
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file ) {
            $( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
        });

        // 文件上传失败，显示上传出错。
        uploader.on( 'uploadError', function( file ) {
            $( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on( 'uploadComplete', function( file ) {
            $( '#'+file.id ).find('.progress-box').fadeOut();
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

    (function( $ ){
        // 当domReady的时候开始初始化
        $(function() {
            var $wrap = $('.uploader-list-container'),

            // 图片容器
                    $queue = $( '<ul class="filelist"></ul>' )
                            .appendTo( $wrap.find( '.queueList' ) ),

            // 状态栏，包括进度和控制按钮
                    $statusBar = $wrap.find( '.statusBar' ),

            // 文件总体选择信息。
                    $info = $statusBar.find( '.info' ),

            // 上传按钮
                    $upload = $wrap.find( '.uploadBtn' ),

            // 没选择文件之前的内容。
                    $placeHolder = $wrap.find( '.placeholder' ),

                    $progress = $statusBar.find( '.progress' ).hide(),

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
                    isSupportBase64 = ( function() {
                        var data = new Image();
                        var support = true;
                        data.onload = data.onerror = function() {
                            if( this.width != 1 || this.height != 1 ) {
                                support = false;
                            }
                        }
                        data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                        return support;
                    } )(),

            // 检测是否已经安装flash，检测flash的版本
                    flashVersion = ( function() {
                        var version;

                        try {
                            version = navigator.plugins[ 'Shockwave Flash' ];
                            version = version.description;
                        } catch ( ex ) {
                            try {
                                version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
                                        .GetVariable('$version');
                            } catch ( ex2 ) {
                                version = '0.0';
                            }
                        }
                        version = version.match( /\d+/g );
                        return parseFloat( version[ 0 ] + '.' + version[ 1 ], 10 );
                    } )(),

                    supportTransition = (function(){
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

            if ( !WebUploader.Uploader.support('flash') && WebUploader.browser.ie ) {

                // flash 安装了但是版本过低。
                if (flashVersion) {
                    (function(container) {
                        window['expressinstallcallback'] = function( state ) {
                            switch(state) {
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
                                'x-shockwave-flash" data="' +  swf + '" ';

                        if (WebUploader.browser.ie) {
                            html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                        }

                        html += 'width="100%" height="100%" style="outline:0">'  +
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
                alert( 'Web Uploader 不支持您的浏览器！');
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
            uploader.on( 'dndAccept', function( items ) {
                var denied = false,
                        len = items.length,
                        i = 0,
                // 修改js类型
                        unAllowed = 'text/plain;application/javascript ';

                for ( ; i < len; i++ ) {
                    // 如果在列表里面
                    if ( ~unAllowed.indexOf( items[ i ].type ) ) {
                        denied = true;
                        break;
                    }
                }

                return !denied;
            });

            uploader.on('dialogOpen', function() {
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

            uploader.on('ready', function() {
                window.uploader = uploader;
            });

            // 当有文件添加进来时执行，负责view的创建
            function addFile( file ) {
                var $li = $( '<li id="' + file.id + '">' +
                                '<p class="title">' + file.name + '</p>' +
                                '<p class="imgWrap"></p>'+
                                '<p class="progress"><span></span></p>' +
                                '</li>' ),

                        $btns = $('<div class="file-panel">' +
                                '<span class="cancel">删除</span>' +
                                '<span class="rotateRight">向右旋转</span>' +
                                '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
                        $prgress = $li.find('p.progress span'),
                        $wrap = $li.find( 'p.imgWrap' ),
                        $info = $('<p class="error"></p>'),

                        showError = function( code ) {
                            switch( code ) {
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

                            $info.text( text ).appendTo( $li );
                        };

                if ( file.getStatus() === 'invalid' ) {
                    showError( file.statusText );
                } else {
                    // @todo lazyload
                    $wrap.text( '预览中' );
                    uploader.makeThumb( file, function( error, src ) {
                        var img;

                        if ( error ) {
                            $wrap.text( '不能预览' );
                            return;
                        }

                        if( isSupportBase64 ) {
                            img = $('<img src="'+src+'">');
                            $wrap.empty().append( img );
                        } else {
                            $.ajax('lib/webuploader/0.1.5/server/preview.php', {
                                method: 'POST',
                                data: src,
                                dataType:'json'
                            }).done(function( response ) {
                                if (response.result) {
                                    img = $('<img src="'+response.result+'">');
                                    $wrap.empty().append( img );
                                } else {
                                    $wrap.text("预览出错");
                                }
                            });
                        }
                    }, thumbnailWidth, thumbnailHeight );

                    percentages[ file.id ] = [ file.size, 0 ];
                    file.rotation = 0;
                }

                file.on('statuschange', function( cur, prev ) {
                    if ( prev === 'progress' ) {
                        $prgress.hide().width(0);
                    } else if ( prev === 'queued' ) {
                        $li.off( 'mouseenter mouseleave' );
                        $btns.remove();
                    }

                    // 成功
                    if ( cur === 'error' || cur === 'invalid' ) {
                        console.log( file.statusText );
                        showError( file.statusText );
                        percentages[ file.id ][ 1 ] = 1;
                    } else if ( cur === 'interrupt' ) {
                        showError( 'interrupt' );
                    } else if ( cur === 'queued' ) {
                        percentages[ file.id ][ 1 ] = 0;
                    } else if ( cur === 'progress' ) {
                        $info.remove();
                        $prgress.css('display', 'block');
                    } else if ( cur === 'complete' ) {
                        $li.append( '<span class="success"></span>' );
                    }

                    $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
                });

                $li.on( 'mouseenter', function() {
                    $btns.stop().animate({height: 30});
                });

                $li.on( 'mouseleave', function() {
                    $btns.stop().animate({height: 0});
                });

                $btns.on( 'click', 'span', function() {
                    var index = $(this).index(),
                            deg;

                    switch ( index ) {
                        case 0:
                            uploader.removeFile( file );
                            return;

                        case 1:
                            file.rotation += 90;
                            break;

                        case 2:
                            file.rotation -= 90;
                            break;
                    }

                    if ( supportTransition ) {
                        deg = 'rotate(' + file.rotation + 'deg)';
                        $wrap.css({
                            '-webkit-transform': deg,
                            '-mos-transform': deg,
                            '-o-transform': deg,
                            'transform': deg
                        });
                    } else {
                        $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
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

                $li.appendTo( $queue );
            }

            // 负责view的销毁
            function removeFile( file ) {
                var $li = $('#'+file.id);

                delete percentages[ file.id ];
                updateTotalProgress();
                $li.off().find('.file-panel').off().end().remove();
            }

            function updateTotalProgress() {
                var loaded = 0,
                        total = 0,
                        spans = $progress.children(),
                        percent;

                $.each( percentages, function( k, v ) {
                    total += v[ 0 ];
                    loaded += v[ 0 ] * v[ 1 ];
                } );

                percent = total ? loaded / total : 0;


                spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
                spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
                updateStatus();
            }

            function updateStatus() {
                var text = '', stats;

                if ( state === 'ready' ) {
                    text = '选中' + fileCount + '张图片，共' +
                            WebUploader.formatSize( fileSize ) + '。';
                } else if ( state === 'confirm' ) {
                    stats = uploader.getStats();
                    if ( stats.uploadFailNum ) {
                        text = '已成功上传' + stats.successNum+ '张照片至XX相册，'+
                                stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
                    }

                } else {
                    stats = uploader.getStats();
                    text = '共' + fileCount + '张（' +
                            WebUploader.formatSize( fileSize )  +
                            '），已上传' + stats.successNum + '张';

                    if ( stats.uploadFailNum ) {
                        text += '，失败' + stats.uploadFailNum + '张';
                    }
                }

                $info.html( text );
            }

            function setState( val ) {
                var file, stats;

                if ( val === state ) {
                    return;
                }

                $upload.removeClass( 'state-' + state );
                $upload.addClass( 'state-' + val );
                state = val;

                switch ( state ) {
                    case 'pedding':
                        $placeHolder.removeClass( 'element-invisible' );
                        $queue.hide();
                        $statusBar.addClass( 'element-invisible' );
                        uploader.refresh();
                        break;

                    case 'ready':
                        $placeHolder.addClass( 'element-invisible' );
                        $( '#filePicker2' ).removeClass( 'element-invisible');
                        $queue.show();
                        $statusBar.removeClass('element-invisible');
                        uploader.refresh();
                        break;

                    case 'uploading':
                        $( '#filePicker2' ).addClass( 'element-invisible' );
                        $progress.show();
                        $upload.text( '暂停上传' );
                        break;

                    case 'paused':
                        $progress.show();
                        $upload.text( '继续上传' );
                        break;

                    case 'confirm':
                        $progress.hide();
                        $( '#filePicker2' ).removeClass( 'element-invisible' );
                        $upload.text( '开始上传' );

                        stats = uploader.getStats();
                        if ( stats.successNum && !stats.uploadFailNum ) {
                            setState( 'finish' );
                            return;
                        }
                        break;
                    case 'finish':
                        stats = uploader.getStats();
                        if ( stats.successNum ) {
                            alert( '上传成功' );
                        } else {
                            // 没有成功的图片，重设
                            state = 'done';
                            location.reload();
                        }
                        break;
                }

                updateStatus();
            }

            uploader.onUploadProgress = function( file, percentage ) {
                var $li = $('#'+file.id),
                        $percent = $li.find('.progress span');

                $percent.css( 'width', percentage * 100 + '%' );
                percentages[ file.id ][ 1 ] = percentage;
                updateTotalProgress();
            };

            uploader.onFileQueued = function( file ) {
                fileCount++;
                fileSize += file.size;

                if ( fileCount === 1 ) {
                    $placeHolder.addClass( 'element-invisible' );
                    $statusBar.show();
                }

                addFile( file );
                setState( 'ready' );
                updateTotalProgress();
            };

            uploader.onFileDequeued = function( file ) {
                fileCount--;
                fileSize -= file.size;

                if ( !fileCount ) {
                    setState( 'pedding' );
                }

                removeFile( file );
                updateTotalProgress();

            };

            uploader.on( 'all', function( type ) {
                var stats;
                switch( type ) {
                    case 'uploadFinished':
                        setState( 'confirm' );
                        break;

                    case 'startUpload':
                        setState( 'uploading' );
                        break;

                    case 'stopUpload':
                        setState( 'paused' );
                        break;

                }
            });

            uploader.onError = function( code ) {
                alert( 'Eroor: ' + code );
            };

            $upload.on('click', function() {
                if ( $(this).hasClass( 'disabled' ) ) {
                    return false;
                }

                if ( state === 'ready' ) {
                    uploader.upload();
                } else if ( state === 'paused' ) {
                    uploader.upload();
                } else if ( state === 'uploading' ) {
                    uploader.stop();
                }
            });

            $info.on( 'click', '.retry', function() {
                uploader.retry();
            } );

            $info.on( 'click', '.ignore', function() {
                alert( 'todo' );
            } );

            $upload.addClass( 'state-' + state );
            updateTotalProgress();
        });

    })( jQuery );
</script>
</body>
</html>


<script>
    jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable( {
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,2,3,4,5,8,9]}// 制定列不参与排序
            ] } );


        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                    .each(function(){
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

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    });
    laydate({
        elem: '#start',
        event: 'focus'
    });
    $(function() {
        $("#products_style").fix({
            float : 'left',
            //minStatue : true,
            skin : 'green',
            durationTime :false,
            spacingw:30,//设置隐藏时的距离
            spacingh:260,//设置显示时间距
        });
    });
</script>
