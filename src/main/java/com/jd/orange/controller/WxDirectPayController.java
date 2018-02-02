package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jd.orange.model.Order;
import com.jd.orange.service.OrderService;
import com.jd.orange.service.WxJSAPIPayService;
import com.jd.orange.util.StringUtil.CommonUtil;
import com.jd.orange.util.api.wx2.GlobalConfig;
//import net.sf.json.JSONObject;
import com.jd.orange.util.api.wx2.ResponseHandler;
import com.jd.orange.util.api.wx2.TenpayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

@Controller
@RequestMapping("/mp/direct")
public class WxDirectPayController {

    @Autowired
    private OrderService orderService;

//    @RequestMapping("/t1")
//    public String t1(Model model)
//    {
//        model.addAttribute("test","111");
//        return "test/prep";
//    }
//
//    @RequestMapping("/toChoose/{sequence}")
//    public String t2(Model model,@PathVariable String sequence)
//    {
//        model.addAttribute("AppId", GlobalConfig.APPID);
//        model.addAttribute("AppSecret",GlobalConfig.APPSECRET);
//        model.addAttribute("Sequence",sequence);
//        return "test/choose";
//    }

    @RequestMapping("/result/{sequence}")
    public String prepare(HttpServletRequest request , HttpServletResponse response, @PathVariable String sequence,Model model)
    {
        //验证sequence
        Order order = orderService.getOrder(sequence);
        if(order==null || order.getShopstatus()==1)
        {
            return "redirect:/order/toMyOrder";
        }
        String price = String.valueOf( new Double(order.getAllprice()*100 ).intValue()  );
        String code = request.getParameter("code");
        String state = request.getParameter("STATE");
//        System.out.println("----CODE----");
//        System.out.println("code:"+code+" state:"+state+" sequence:"+sequence);
//        System.out.println("----CODE----");
        String oauth2_url = GlobalConfig.oauth2_url.replace("APPID", GlobalConfig.APPID).replace("SECRET", GlobalConfig.APPSECRET).replace("CODE", code);
//        System.out.println("----URL----");
//        System.out.println(oauth2_url);
//        System.out.println("----URL----");
        //JSONObject jsonObject = CommonUtil.httpsRequestToJsonObject("url","POST",null);
        String s = CommonUtil.loadJSON(oauth2_url);
        System.out.println("----JSON----");
        System.out.println(s);
        System.out.println("----JSON----");
        JSONObject o = JSON.parseObject(s);
        Object errorCode = o.get("errcode");

        String openId="";
        //Object errorCode = jsonObject.get("errcode");
        //model.addAttribute("appid",GlobalConfig.APPID);
        //model.addAttribute("secret",GlobalConfig.APPSECRET);
        if(errorCode != null) {
            System.out.println("----ERROR----");
            System.out.println(errorCode);
            System.out.println("----ERROR----");
        }else{
            openId = o.getString("openid");
            model.addAttribute("openid",openId);
            System.out.println("----OPENID----");
            System.out.println(openId + "  len:"+openId.length());
            System.out.println("----OPENID----");
        }
        if(openId=="")
        {
            return "redirect:/order/toChoose";
        }
        System.out.println("TO: "+"redirect:/mp/direct/toPay?body=OrangeStore Shopping&&orderid="+sequence+"&&price="+price+"&&openid="+openId );
        return "redirect:/mp/direct/toPay?body=OrangeStore Shopping&&orderid="+sequence+"&&price="+price+"&&openid="+openId;
    }

    @RequestMapping("/toPay")
    //@ResponseBody
    public String getPay(HttpServletRequest request, Model model  /*, @RequestParam String body*/ , @RequestParam String orderid,
                         @RequestParam String price ,@RequestParam String openid)
    {
        //TODO:正式版去除全部System.out.println
        String currTime = TenpayUtil.getCurrTime();
        String strTime = currTime.substring(8, currTime.length());
        String strRandom = TenpayUtil.buildRandom(4) + "";
        String nonce_str = strTime + strRandom;

        System.out.println("nonce_str:"+nonce_str);

        String spbill_create_ip = getIpAddr(request);
        String notify_url = GlobalConfig.URL + "mp/direct/result";

        System.out.println("notify_url:"+notify_url);
        System.out.println("spbill_create_ip:"+spbill_create_ip);

        SortedMap<String, String> packageParams = new TreeMap<String, String>();
        packageParams.put("appid", GlobalConfig.APPID);
        packageParams.put("mch_id", GlobalConfig.MCH_ID);
        packageParams.put("nonce_str", nonce_str);
        packageParams.put("body", "OrangeStore Shopping");
        packageParams.put("out_trade_no", orderid);//订单号
        packageParams.put("total_fee", price);
        packageParams.put("spbill_create_ip", spbill_create_ip);
        packageParams.put("notify_url", notify_url);
        packageParams.put("trade_type", GlobalConfig.TRADE_TYPE2.trim());
        packageParams.put("openid", openid.substring(0,28) );

        WxJSAPIPayService wxJsapiPayService = new WxJSAPIPayService();
        Map<String,String> result_map = new HashMap<>();
        Map<String,String> return_map = new HashMap<>();
        try
        {
            System.out.println("----getUrlCode---");
            System.out.println("准备签名前openid:"+openid);
            //System.out.println( GlobalConfig.TRADE_TYPE2 + "  len:"+GlobalConfig.TRADE_TYPE2.length() );

            result_map = wxJsapiPayService.getUrlCode(packageParams);//预支付xml

            System.out.println("预支付map:"+result_map);

            //result_map = WXPayUtil.xmlToMap(result_code);

            System.out.println("result_code:"+ result_map.get("result_code")+" " +result_map.get("result_code").equals("SUCCESS") );
            System.out.println("return_code:"+ result_map.get("return_code")+" " +result_map.get("return_code").equals("SUCCESS") );
            System.out.println("prepay_id:"+ result_map.get("prepay_id") );

            if( result_map.get("result_code").equals("SUCCESS") && result_map.get("return_code").equals("SUCCESS") )
            {
                String url = "http://orangestore.com.cn/mp/direct/";
                System.out.println("URL:"+url);
                return_map = wxJsapiPayService.wechatPay(result_map,url);   //JSAPI必备参数
                return_map.put("sequence",orderid);
                System.out.println("支付map:"+return_map);
                if( return_map.get("status").equals("1") )  //map错误
                {
                    return "redirect:/order/toMyOrder";
                }
                else
                {
                    model.addAttribute("result",return_map);
                }
                //appId , timeStamp , nonceStr(随机串) , package(prepay_id) , signType(签名方式:MD5) , paySign(微信签名) , sequence
//                model.addAttribute("appId",GlobalConfig.APPID);
//                model.addAttribute("timeStamp",strTime);
//                model.addAttribute("nonceStr",result_map.get("nonce_str") );
//                model.addAttribute("prepay_id","prepay_id="+result_map.get("prepay_id").toString() );
//                model.addAttribute("signType","MD5");
//                model.addAttribute("paySign",result_map.get("sign") );
//                model.addAttribute("sequence",orderid);
//
//                System.out.println("final prepay:"+"prepay_id="+result_map.get("prepay_id").toString());
            }

        }catch (Exception e)
        {
            e.printStackTrace();
            System.out.println("result_code"+ result_map.get("result_code")+" " +result_map.get("result_code").equals("SUCCESS") );
            System.out.println("return_code"+ result_map.get("return_code")+" " +result_map.get("return_code").equals("SUCCESS") );
            //result_code="error:"+e.getCause();
            System.out.println(e.getMessage());
            return "redirect:/order/toChoose";
        }
        return "user/wxpay";
    }

    public String getIpAddr(HttpServletRequest request){
        String ipAddress = request.getHeader("x-forwarded-for");
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){
                //根据网卡取本机配置的IP
                InetAddress inet=null;
                try {
                    inet = InetAddress.getLocalHost();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
                ipAddress= inet.getHostAddress();
            }
        }
        //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15
            if(ipAddress.indexOf(",")>0){
                ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }

    @RequestMapping("/back")
    public String result(@RequestParam String sequence ,@RequestParam Integer code)
    {
        System.out.println("sequence:"+sequence);
        if(code==0) //成功
        {
            return "redirect:/order/pay?sequence="+sequence+"&price=null&status=0";
        }
        else // -1 (失败) , 1 (取消)
        {
            System.out.println("code="+code);
            if( code==-1 )
            {
                return "redirect:/order/pay?sequence="+sequence+"&price=null&status=1";
            }
        }
        return "user/wodedingdan";  //取消退回我的订单
    }

    /**
     * 微信回调接口
     */
    @RequestMapping(value = "/result")
    @ResponseBody
    public void wechatOrderBack(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("--------result--------");
        System.out.println("直接支付成功");
        System.out.println("--------result--------");
        // 创建支付应答对象
        ResponseHandler resHandler = new ResponseHandler(request, response);
        resHandler.setKey(GlobalConfig.KEY);
        // 判断签名是否正确
        if (resHandler.isTenpaySign()) {

            String resXml = "";
            if ("SUCCESS".equals(resHandler.getParameter("result_code")))
            {
                resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
                        + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
            }
            else {
                System.out.println("支付失败,错误信息：" + resHandler.getParameter("err_code"));
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
            }
            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
            out.write(resXml.getBytes());
            out.flush();
            out.close();

        } else {
            System.out.println("通知签名验证失败");
        }
    }

}
