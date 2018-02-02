<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/30
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
    function pay(){
        //config
        var appId = $('#appId').val();
        var timeStamp = $('#timeStamp').val();
        var nonceStr = $('#nonceStr').val();
        var signature = $('#signature').val();

        var signType = $('#signType').val();
        var pk = $('#package').val();
        var paySign = $('#paySign').val();

        var sequence = $('#sequence').val();

        wx.config({
            debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
            appId: appId, // 必填，公众号的唯一标识
            timestamp: timeStamp , // 必填，生成签名的时间戳
            nonceStr: nonceStr, // 必填，生成签名的随机串
            signature: signature,// 必填，签名，见附录1
            jsApiList: ['chooseWXPay'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
        });

        wx.ready(function(res){
            // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
            wx.chooseWXPay({
                timestamp: timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
                nonceStr: nonceStr, // 支付签名随机串，不长于 32 位
                package: pk, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
                signType: signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
                paySign: paySign, // 支付签名
                success: function (res) {
                    //alert("error:" + JSON.stringify(res));
                    location.href = '<%=basePath%>mp/direct/back?sequence='+sequence +'&&code=0';
                },
                cancel: function (res) {
                    //alert("error:" + JSON.stringify(res));
                    location.href = '<%=basePath%>mp/direct/back?sequence='+sequence +'&&code=1';//取消
                },
                fail: function (res) {
                    alert("error:" + JSON.stringify(res));
                    location.href = '<%=basePath%>mp/direct/back?sequence='+sequence +'&&code=-1';//失败
                }
            });
        });

        wx.error(function (res) {
            alert("error:" + JSON.stringify(res));
        });
    }
</script>


<html>
<head>
    <title>pay</title>
</head>
<body onload="pay()">
<h1>正在进行微信支付....
    <br/>
    <small>请不要关闭</small>
    ${result.sequence}
</h1>
    <input id="appId" type="hidden" value="${result.appId}" /><br/>
    <input id="timeStamp" type="hidden" value="${result.timestamp}" /><br/>
    <input id="nonceStr" type="hidden" value="${result.nonceStr}" /><br/>
    <input id="signature" type="hidden" value="${result.signature}" /><br/>

    <input id="signType" type="hidden" value="${result.signType}" /><br/>
    <input id="package" type="hidden" value="${result.packageStr}" /><br/>
    <input id="paySign" type="hidden" value="${result.paySign}" /><br/>
    <input id="sequence" type="hidden" value="${result.sequence}" /><br/>

</body>
</html>
