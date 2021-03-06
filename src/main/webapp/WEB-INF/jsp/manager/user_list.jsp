<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/x-icon" href="<%=basePath%>favicon.ico">
    <link href="<%=basePath%>backpage/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath%>backpage/css/style.css"/>
    <link href="<%=basePath%>backpage/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=basePath%>backpage/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/admin/other.css"/>

    <script src="<%=basePath%>backpage/assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='<%=basePath%>backpage/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>
    <script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='<%=basePath%>backpage/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <script src="<%=basePath%>backpage/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>backpage/assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <%--<script src="<%=basePath%>backpage/assets/js/jquery.dataTables.min.js"></script>--%>
    <%--<script src="<%=basePath%>backpage/assets/js/jquery.dataTables.bootstrap.js"></script>--%>

    <script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.js"></script>
    <script type="text/javascript" src="<%=basePath%>backpage/js/H-ui.admin.js"></script>
    <script src="<%=basePath%>backpage/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="<%=basePath%>backpage/assets/laydate/laydate.js" type="text/javascript"></script>
<title>用户列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
    <div class="search_style">
     
      <ul class="search_content clearfix">
       <li><label class="l_f">会员名称</label><input name="" type="text"  class="text_add" placeholder="输入会员名称、电话、邮箱"  style=" width:300px"/></li>
       <li><label class="l_f">创建开始时间</label><input class="inline laydate-icon" id="start1" style=" margin-left:10px;"></li>
       <li><label class="l_f">创建结束时间</label><input class="inline laydate-icon" id="start2" style=" margin-left:10px;"></li>
       <li><label class="l_f">修改开始时间</label><input class="inline laydate-icon" id="start3" style=" margin-left:10px;"></li>
       <li><label class="l_f">修改结束时间</label><input class="inline laydate-icon" id="start4" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="button" class="btn_search"><i class="icon-search"></i>查询</button></li>
      </ul>
    </div>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
        <%--<a href="javascript:;" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加用户</a>--%>
       </span>
       <span class="r_f">共：<b>${count}</b>条</span>
     </div>
     <!---->
     <div class="table_menu_list">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80">ID</th>
				<th width="100">中文昵称</th>
                <th width="100">日文昵称</th>
                <th width="100">中文姓名</th>
                <th width="100">日文姓名</th>
				<th width="80">性别</th>
                <th width="150">邮箱</th>
				<th width="120">手机</th>
                <th width="120">电话</th>
				<th width="120">生日</th>
                <th width="120">上次登录时间</th>
                <th width="120">创建时间</th>
				<%--<th width="70">状态</th>--%>
				<th width="250">操作</th>
			</tr>
		</thead>
	<tbody id="tbody">

		<%--<tr>--%>
          <%--<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>--%>
          <%--<td>1</td>--%>
          <%--<td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','500','400')">张三</u></td>--%>
          <%--<td>男</td>--%>
          <%--<td>13000000000</td>--%>
          <%--<td>admin@mail.com</td>--%>
          <%--<td class="text-l">北京市 海淀区</td>--%>
          <%--<td>2014-6-11 11:11:42</td>--%>
          <%--<td>普通用户</td>--%>
          <%--<td class="td-status"><span class="label label-success radius">已启用</span></td>--%>
          <%--<td class="td-manage">--%>
          <%--<a title="编辑" onclick="member_edit('550')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> --%>
          <%--<a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>--%>
          <%--</td>--%>
		<%--</tr>--%>


      </tbody>
	</table>
            <div id="pagehere"></div>
            <div>
                <input type="hidden" id="pageNo" value=""/>
                <input type="hidden" id="pages" value=""/>
            </div>
   </div>
  </div>
 </div>
</div>
<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
  
    <ul class=" page-content">
     <li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input value="" name="用户名" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">真实姓名：</label><span class="add_name"><input name="真实姓名" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
     <label><input name="form-field-radio" type="radio" checked="checked" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">保密</span></label>
     </span>
     <div class="prompt r_f"></div>
     </li>
     <li><label class="label_name">固定电话：</label><span class="add_name"><input name="固定电话" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">移动电话：</label><span class="add_name"><input name="移动电话" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">电子邮箱：</label><span class="add_name"><input name="电子邮箱" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li class="adderss"><label class="label_name">家庭住址：</label>
         <span class="add_name">
         <input name="家庭住址" type="text"  class="text_add" style=" width:350px"/>
     </span><div class="prompt r_f"></div></li>
     <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
     <label><input name="form-field-radio1" type="radio" checked="checked" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio1"type="radio" class="ace"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>
    </ul>
 </div>
</body>
</html>

<script>
    function send_post(url,info) {
        $.post(url,info,
            function(result){
                //console.log(result);
                //console.log(result.dataList);
                //获取tbody
                var tbody=$("#tbody");
                //清空tbody
                tbody.empty();
                for(var i=0;i<result.dataList.length;i++)
                {
                    var show1="";
                    var a="";
                    //生日
                    if(result.dataList[i].birth!=""&&result.dataList[i].birth!=undefined)
                    {
                        /*将时间戳转化为日期*/
                        var time = new Date(result.dataList[i].birth);
                        result.dataList[i].birth = time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
                    }else{
                        result.dataList[i].birth="";
                    }
                    //登录时间
                    if(result.dataList[i].logintime!=""&&result.dataList[i].logintime!=undefined)
                    {
                        /*将时间戳转化为日期*/
                        var time = new Date(result.dataList[i].logintime);
                        result.dataList[i].logintime = time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
                    }else{
                        result.dataList[i].logintime="";
                    }
                    //创建时间
                    if(result.dataList[i].createtime!=""&&result.dataList[i].createtime!=undefined)
                    {
                        /*将时间戳转化为日期*/
                        var time = new Date(result.dataList[i].createtime);
                        result.dataList[i].createtime = time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
                    }else{
                        result.dataList[i].createtime="";
                    }

                    tbody.append("<tr style='text-align: center'>");
                    tbody.append("<td width='25px'><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>");
                    tbody.append("<td>"+result.dataList[i].id+"</td>");
                    tbody.append("<td >"+result.dataList[i].nickname+"</td>");
                    tbody.append("<td >"+result.dataList[i].nicknameJ+"</td>");
                    tbody.append("<td >"+result.dataList[i].realname+"</td>");
                    tbody.append("<td >"+result.dataList[i].realnameJ+"</td>");
                    tbody.append("<td >"+result.dataList[i].gender+"  "+result.dataList[i].genderJ+"</td>");
                    tbody.append("<td >"+result.dataList[i].email+"</td>");
                    tbody.append("<td >"+result.dataList[i].tel+"</td>");
                    tbody.append("<td >"+result.dataList[i].phone+"</td>");
                    tbody.append("<td >"+result.dataList[i].birth+"</td>");
                    tbody.append("<td >"+result.dataList[i].logintime+"</td>");
                    tbody.append("<td >"+result.dataList[i].createtime+"</td>");
                    a+="<td class='td-manage'>";
                    a+="<a title='编辑' onclick='member_edit(\"550\")' href='javascript:;'  class='btn btn-xs btn-info' >";
                    a+="<i class='icon-edit bigger-120'></i></a>";
                    a+="<a title='删除' href='javascript:;' class='btn btn-xs btn-warning del' uid='"+result.dataList[i].id+"'>";
                    a+="<i class='icon-trash  bigger-120'></i></a></td>";
                    tbody.append(a);
                    tbody.append("</tr>");
                }
                //页码隐藏域
                var s="<div class='page'  v-show='show'>";
                s+="<div class='pagelist'>";
                s+="<span class='jump previous'>上一页</span>";
                for(var i=1 ; i<=result.pages ; i++  )
                {
                    if(i==result.pageNo)
                    {
                        s+="<span class='jump fyhover pg' value='"+i+"'>"+i+"</span>";
                    }
                    else
                    {
                        s+="<span class='jump pg' value='"+i+"'>"+i+"</span>";
                    }
                }
                s+="<span class='jump next'>下一页</span>";
                s+="<span class='jumppoint'>跳转到：</span>";
                s+="<span class='jumpinp'><input type='text' v-model='changePage' id='pg' ></span>";
                s+="<span class='jump go'>GO</span>";
                s+="<span class='jump'>当前 "+result.pageNo+" / "+result.pages+" 共</span>";
                s+="</div></div>";
                $("#pageNo").val(result.pageNo);$("#pages").val(result.pages);
                $("#pagehere").empty().append(s);
                afterLoad();//事后绑定
            },"json");
    }

    $(function(){
        var info={pageNo:1,pageSize:10}
        var url="<%=basePath%>user/getUserList"
        send_post(url,info);
    })

    $(".btn_search").click(function () {
        var keys=$(".text_add").val();
        var sc=$('#start1').val();
        var ec=$("#start2").val();
        var su=$('#start3').val();
        var eu=$("#start4").val();

        var info={pageNo:1,pageSize:10,keys:keys,start_c:sc,end_c:ec,start_u:su,end_u:eu}
        var url="<%=basePath%>user/getUserList";
        send_post(url,info);
    });

    //绑定事件
    function afterLoad() {
        $(".jump").click(function(){
            $(this).addClass("fyhover").siblings().removeClass("fyhover");
        })

        $(".del").click(function () {
            //alert( $(this).attr("pid") );
            $.ajax({
                url:"<%=basePath%> / ",
                data:{uid:$(this).attr("uid")},
                type:"get",
                dataType:"text",
                success:function(data){
                    if(data=="true")
                        alert("删除成功");
                    else
                        alert("删除失败");
                    window.location.href="<%=basePath%> / ";
                },
                error:function(){
                    alert("请求失败");
                }
            });
        });

        //上一页
        $(".previous").click(function () {
            var page= $("#pageNo").val();
            if( parseInt(page) -1 <= 0 )
            {
                return false;
            }
            var keys=$(".text_add").val();
            var sc=$('#start1').val();
            var ec=$("#start2").val();
            var su=$('#start3').val();
            var eu=$("#start4").val();
            var info={pageNo:parseInt(page)-1,pageSize:10,keys:keys,start_c:sc,end_c:ec,start_u:su,end_u:eu}
            var url="<%=basePath%>user/getUserList";
            //console.log(info);
            send_post(url,info);
        });

        //下一页
        $(".next").click(function () {
            var page=$("#pageNo").val();
            var pages=$("#pages").val();
            if( parseInt(page) + 1 > pages )
            {
                return false;
            }
            var keys=$(".text_add").val();
            var sc=$('#start1').val();
            var ec=$("#start2").val();
            var su=$('#start3').val();
            var eu=$("#start4").val();
            var info={pageNo:parseInt(page)+1,pageSize:10,keys:keys,start_c:sc,end_c:ec,start_u:su,end_u:eu}
            var url="<%=basePath%>user/getUserList";
            //console.log(info);
            send_post(url,info);
        });

        //页码
        $(".pg").click(function () {
            var page= $(this).text();
            var keys=$(".text_add").val();
            var sc=$('#start1').val();
            var ec=$("#start2").val();
            var su=$('#start3').val();
            var eu=$("#start4").val();
            var info={pageNo:page,pageSize:10,keys:keys,start_c:sc,end_c:ec,start_u:su,end_u:eu}
            var url="<%=basePath%>user/getUserList";
            //console.log(info );
            send_post(url,info);
        });

        //直接跳转
        $(".go").click(function () {
            var page=$("#pg").val();
            var keys=$(".text_add").val();
            var sc=$('#start1').val();
            var ec=$("#start2").val();
            var su=$('#start3').val();
            var eu=$("#start4").val();
            var info={pageNo:page,pageSize:10,keys:keys,start_c:sc,end_c:ec,start_u:su,end_u:eu}
            var url="<%=basePath%>user/getUserList";
            //console.log(info );
            send_post(url,info);
        });

    }



</script>


<script>
jQuery(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
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
			})
/*用户-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加用户',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  });
			   layer.close(index);	
		  }		  		     				
		}
    });
});
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url+'#?='+id,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*用户-编辑*/
function member_edit(id){
	  layer.open({
        type: 1,
        title: '修改用户信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{

		      alert("xx");

			  layer.alert('修改成功！',{
               title: '提示框',				
			icon:1,		
			  });
			   layer.close(index);	
		  }		  		     				
		}
    });
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
laydate({
    elem: '#start1',
    event: 'focus' 
});
laydate({
    elem: '#start2',
    event: 'focus'
});
laydate({
    elem: '#start3',
    event: 'focus'
});
laydate({
    elem: '#start4',
    event: 'focus'
});

</script>