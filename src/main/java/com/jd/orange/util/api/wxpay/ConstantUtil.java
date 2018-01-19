package com.jd.orange.util.api.wxpay;

public class ConstantUtil {
    /**
     * 微信开发平台应用ID
     */
    public static final String APP_ID="wx9e179bc3ebf0c798"; //桔子屋
    /**
     * 应用对应的凭证
     */
    public static final String APP_SECRET="638bf90ddb83b7253314c4da03d20d24";   //重置
    /**
     * 应用对应的密钥
     */
    public static final String APP_KEY="dfsfdvdfvgk32423423oGdfsfdsvBO66";      // ??
    /**
     * 微信支付商户号
     */
    public static final String MCH_ID="1382668802";     //
    /**
     * 商品描述
     */
    public static final String BODY="商城购物";
    /**
     * 商户号对应的密钥
     */
    public static final String PARTNER_key="123466";

    /**
     * 商户id
     */
    public static final String PARTNER_ID="14698sdfs402dsfdew402";  //未配置
    /**
     * 常量固定值
     */
    public static final String GRANT_TYPE="client_credential";
    /**
     * 获取预支付id的接口url
     */
    public static String GATEURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
    /**
     * 微信服务器回调通知url
     */
    public static String NOTIFY_URL="http://localhost:8080/app/notify";  //回调接收
}