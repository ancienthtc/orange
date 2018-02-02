package com.jd.orange.util.api.wx2;

import org.apache.commons.lang3.StringUtils;

import java.util.Calendar;
import java.util.Date;

public class GlobalConfig {

    public GlobalConfig() {
    }

    public static final String APPID = "wx9e179bc3ebf0c798";  //已设
    public static final String APPSECRET = "638bf90ddb83b7253314c4da03d20d24"; // appsecret  //已设
    public static final String MCH_ID = "1382668802"; // 商业号        //已设
    public static final String KEY = "P3huR3cB1JrVD6hliKEQ4SvWar41xsKA"; // key
    public static final String URL = "http://orangestore.com.cn/";
    public static final String TRADE_TYPE = "NATIVE";//JSAPI，NATIVE，APP

    public static final String TRADE_TYPE2 = "JSAPI";//JSAPI，NATIVE，APP

    //获取openId
    public static final String oauth2_url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";

    //  access_token API
    public static String TOKEN_API = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential";
    // 临时票据API
    public static String TICKET_API = "https://api.weixin.qq.com/cgi-bin/ticket/getticket";
    // 微信OPENID API
    public static String OPENID_API = "https://api.weixin.qq.com/sns/oauth2/access_token";

    private static String token = null;
    private static Date tokenTime = null;
    private static String jsapiTicket = null;
    private static Date jsapiTicketTime = null;

    public static String getToken() {
        return token;
    }

    public static void setToken(String token) {
        GlobalConfig.token = token;
        GlobalConfig.tokenTime = new Date();
    }

    public static String getJsapiTicket() {
        return jsapiTicket;
    }

    public static void setJsapiTicket(String jsapiTicket) {
        GlobalConfig.jsapiTicket = jsapiTicket;
        GlobalConfig.jsapiTicketTime = new Date();
    }

    public static boolean checkToken() {
        if (!StringUtils.isEmpty(GlobalConfig.token)) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(tokenTime);
            calendar.add(Calendar.SECOND, 7200);
            return calendar.before(new Date());
        }
        return true;
    }

    public static boolean checkJsapiTicket() {
        if (!StringUtils.isEmpty(GlobalConfig.jsapiTicket)) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(jsapiTicketTime);
            calendar.add(Calendar.SECOND, 7200);
            return calendar.before(new Date());
        }
        return true;
    }

}
