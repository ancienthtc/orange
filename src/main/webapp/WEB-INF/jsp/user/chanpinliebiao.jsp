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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="author" content="www.34580.com">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="format-detection" content="telephone=no">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta name="viewport"
          content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">
    <title>橘子屋</title>
    <link href="<%=basePath%>fontpage/css/fz.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/main.css">
    <!--   <link rel="stylesheet" href="css/jquery-impromptu.css">-->
    <link rel="stylesheet" href="<%=basePath%>fontpage/css/new_main.css">
    <!--<script src="js/jquery-1.10.1.min.js"></script>
    <script src="js/jquery-impromptu.min.js"></script>-->
</head>
<body style="">
<div class="container" id="container">
    <div class="wrapper">
        <div>
            <div class="header" style="background:#ee4b02;">
                <a href="javascript:history.back();" class="back"><img src="img/tool_back.png" alt=""></a>
                <div class="searchbar">
                    <div class="search">
                        <input class="input" type="text" placeholder="搜索商品" name="proname" id="proname" value="">
                        <input type="hidden">
                        <a >
                            <input type="button" class="submit default-cursor" value="" >
                        </a>
                    </div>
                </div>
            </div>

            <div class="main_body">
                <div class="promenu">
                    <ul class="clearfix" id="selSort">

                        <!-- 排序类型 （0默认 1正序 2 倒序）
                             排序字段 （0默认 1 销量 2 创建时间 3 价格）-->
                        <li>
                            <a href="javascript:GoodsSort(0);" class="cur" onclick="SelChange(this)">默认</a>
                        </li>
                        <li>
                            <a href="javascript:GoodsSort(1);" onclick="SelChange(this)" class="">最新↓</a>
                        </li>
                        <li>
                            <a href="javascript:GoodsSort(2);" onclick="SelChange(this)" class="">销量↓</a>
                        </li>
                        <li>
                            <a href="javascript:GoodsSort(3);" onclick="SelChange(this)" class=""
                               style="border-right: none;">价格↑</a>
                        </li>
                    </ul>
                </div>
                <div class="product">
                    <ul class="prolist clearfix" id="goodsList">
                        <c:if test="${not empty goods}">
                            <c:forEach var="i" items="${goods}">
                                <li>
                                    <a href="<%=basePath%>goods/toGoodsDetailPage?gid=${i.id}">
                                        <span class="tag tag2" style="display:none;">售罄</span>
                                        <img src="<%=basePath%>image/goods?pic=${i.pic1.substring( i.pic1.lastIndexOf("\\") + 1 )}">
                                    </a>
                                    <div class="goolist_name">
                                        <p class="title">${i.name}</p>
                                        <p>
                                            <span class="price">¥${i.formats.get(0).price}</span>
                                            <span class="kilo" style="float:right">¥ ${i.formats.get(0).price}/${i.formats.get(0).fclass}</span>
                                        </p>
                                            <%--<a href="gouwuche.php">--%>
                                            <%--<span class="addcart"  onclick="addcart($(this))">--%>
                                            <%--<img src="<%=basePath%>fontpage/img/cell_list_addcart.png">--%>
                                            <%--</span>--%>
                                            <%--</a>--%>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:if>


                    </ul>
                </div>

            </div>


            <!--<a href="/Cart/Index/" class="index-cart" style="display:block;">
                <i class="cart_num order-numbers" id="cart_sum">0</i>
                <img src="img/cell_list_floatingcart.png">
            </a>-->


            <script type="text/javascript">
                //                  $(function(){
                //                      if (is_login()) {
                //                          var url = '/Cart/GoodsCout/';
                //                          $.post(url, {},
                //                          function (data) {
                //                              if (data.Statu != 0) {
                //                                  $("#cart_sum").show();
                //                                  $("#cart_sum").html(data.Msg);
                //                              }
                //                          }, 'json');
                //                      } else {
                //                          $("#cart_sum").show();
                //                          $("#cart_sum").html("0");
                //                      }
                //
                //                      GoodsListInit(0);
                //                  })
                //
                //                  //根据搜索条件查询商品信息
                //                  function GoodsQuery() {
                //
                //                      GoodsListInit(0);
                //                  }
                //
                //                  //初始化加载商品信息
                //                  function GoodsListInit(type) {
                //
                //                      var TypeID = '7';
                //                      var ClassID = '52';
                //                      var SelName = $("#proname").val();
                //
                //                      $.post("/Goods/IndexData/", { TypeID: TypeID, ClassID: ClassID, GoodsName: SelName, Type: type }, function (data) {
                //                          $("#goodsList").html(data);
                //                      })
                //                  }
                //                  //排序
                //                  function GoodsSort(type) {
                //                      GoodsListInit(type);
                //                  }
                //
                //                  var clicktag=0;
                //                  function addcart(that,tip){
                //
                //                      if(tip!=undefined && tip!=''){
                //                          if(!confirm(tip)){
                //                              return;
                //                          }
                //                      }
                //
                //                      if (clicktag == 0) {
                //                          clicktag = 1;
                //
                //                          if(!is_login()){
                //
                //                              $.prompt("请先登陆", {
                //                                  buttons: { "确定": true },
                //                                  submit: function(e,v,m,f){
                //                                      if(v == true)
                //                                      {
                //                                          window.location.href="/User/Login/";
                //                                          return;
                //                                      }
                //                                  }
                //                              });
                //
                //                          }
                //                          else{
                //                              debugger
                //                              var id=that.attr('id');
                //                              var cart = $("#cart_sum").text() == "" ? 0 : $("#cart_sum").text();
                //                              $.ajax({
                //                                  url: '/Cart/AddGoodsToCart/',
                //                                  type:'post',
                //                                  data: { GoodsID: id },
                //                                  dataType:'json',
                //                                  success:function(data){
                //                                      if (data.Statu == 1) {
                //                                          $("#cart_sum").show();
                //                                          var val = parseInt($(".order-numbers").text() == "" ? 0 : $(".order-numbers").text()) + 1;
                //                                          if(val>99)
                //                                          {
                //                                              $("#cart_sum").css({'width':'28px','border-radius':'15px','padding':'0px'});
                //                                          }
                //                                          $("#cart_sum").css({'padding':'0px'});
                //                                          $(".order-numbers").text(val);
                //                                          $(".order-numbers").addClass("add");
                //                                          setTimeout(function () {
                //                                              clicktag = 0;
                //                                              $(".order-numbers").removeClass("add");
                //                                          },800);
                //
                //                                          /*修改商品数量js end*/
                //
                //                                      }else{
                //
                //                                          $.prompt(data.Msg, {
                //                                              buttons: { "确定": true }
                //                                          });
                //                                          setTimeout(function () {
                //                                              clicktag = 0;
                //                                              $(".order-numbers").removeClass("add");
                //                                          }, 800);
                //                                      }
                //                                  },
                //                                  error:function(){
                //
                //                                      alert('服务器太繁忙，请稍后重试');
                //                                      setTimeout(function () {
                //                                          clicktag = 0;
                //                                          $(".order-numbers").removeClass("add");
                //                                      }, 800);
                //                                  }
                //                              });
                //                          }
                //                      }/*endif_flag*/
                //                  }
                //
                //                  //判断当前是否登录
                //                  function is_login() {
                //                      var login = 'False';
                //                      if (login == "False") {
                //                          return false;
                //                      } else {
                //                          return true;
                //                      }
                //                  }

                //菜单颜色切换
                function SelChange(obj) {
                    var a = document.getElementById("selSort").getElementsByTagName("a");
                    for (var i = 0; i < a.length; i++) {
                        a[i].className = "";
                    }
                    obj.className = "cur";
                }
            </script>
            <!--<script type="text/javascript">
                $(function(){
                    var keyword = '';
                    var sort = '';
                    $("#pageSel").change(function(){
                        var page = $(this).val();
                        var type=  0;
                        window.location.href="/"+page+"?keyword="+keyword+"&type="+type;
                    })
                })
            </script>-->
        </div>
    </div>
</div>
<!--<div>
    <a href="javascript:;" class="returntop" style="">返回顶部</a>
</div>-->
<!--<script type="text/javascript">


    $(function(){

        $(".returntop").click(function(){
            $('body,html').animate({scrollTop:0},1000);
        });
        var height = document.getElementById("container").offsetHeight;
        if(height >= 568)
        {
            $("#minHeight").removeClass('minHeight');
            $(".returntop").show();
        }
    });
</script>-->

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>