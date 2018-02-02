package com.jd.orange.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.*;
import java.security.cert.CertificateException;
import java.util.*;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.jd.orange.util.api.wx2.GlobalConfig;
import com.jd.orange.util.api.wx2.MD5Util;
import com.jd.orange.util.api.wx2.XMLUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.ClientPNames;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import org.jdom2.JDOMException;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.SSLContext;

public class WxJSAPIPayService {

	public static String url = "https://api.mch.weixin.qq.com/pay/unifiedorder";

	private HttpClientBuilder httpClientBuilder;
	@SuppressWarnings("unused")
	private CloseableHttpClient httpClient;
	private String responseMessage;

	RestTemplate restTemplate = new RestTemplate();

	public WxJSAPIPayService() {
		httpClientBuilder = HttpClientBuilder.create();
		httpClient = httpClientBuilder.build();
	}

	public Map<String, String> getUrlCode(SortedMap<String, String> packageParams)
			throws ClientProtocolException, IOException, JDOMException {
		String sign = createSign(packageParams);
//		String xml = "<xml>"
//				+ "<appid>" + packageParams.get("appid") + "</appid>" + "<mch_id>"
//				+ packageParams.get("mch_id") + "</mch_id>" + "<nonce_str>" + packageParams.get("nonce_str")
//				+ "</nonce_str>" + "<sign>" + sign + "</sign>" + "<body><![CDATA[" + packageParams.get("body")
//				+ "]]></body>" + "<out_trade_no>" + packageParams.get("out_trade_no") + "</out_trade_no>"
//				+ "<total_fee>" + packageParams.get("total_fee") + "</total_fee>" + "<spbill_create_ip>"
//				+ packageParams.get("spbill_create_ip") + "</spbill_create_ip>" + "<notify_url>"
//				+ packageParams.get("notify_url") + "</notify_url>" + "<trade_type>" + packageParams.get("trade_type")
//				+ "</trade_type>" + "<openid>" + "<![CDATA[" + packageParams.get("openid") + "]]" + "</openid>"
//				+ "</xml>";

		/*

	<xml>
	<appid><![CDATA[wx9e179bc3ebf0c798]]></appid>
	<body><![CDATA[测试1]]></body>
	<mch_id><![CDATA[1382668802]]></mch_id>
	<nonce_str><![CDATA[1732391057]]></nonce_str>
	<notify_url><![CDATA[http://orangestore.com.cn/WxPay/result]]></notify_url>
	<openid><![CDATA[oUP8NwNCA0EOTF7LhxZw0jPwWTjo]]></openid>
	<out_trade_no><![CDATA[1516949502228I07R9YG]]></out_trade_no>
	<spbill_create_ip><![CDATA[112.81.21.217]]></spbill_create_ip>
	<total_fee><![CDATA[1]]></total_fee>
	<trade_type><![CDATA[JSAPI]]></trade_type>
	<sign>48AAE4CCD5C39233760D2A7B85FEC06C</sign>
	</xml>
		*/

		String xml = "<xml>"
				+ "<appid>" + "<![CDATA[" + packageParams.get("appid") + "]]>" + "</appid>"
				+ "<body>" + "<![CDATA[" + packageParams.get("body") + "]]>" + "</body>"
				+ "<mch_id>" + "<![CDATA[" + packageParams.get("mch_id") + "]]>" + "</mch_id>"
				+ "<nonce_str>" + "<![CDATA[" + packageParams.get("nonce_str") + "]]>" + "</nonce_str>"
				+ "<notify_url>" + "<![CDATA[" + packageParams.get("notify_url") + "]]>" + "</notify_url>"
				+ "<openid>" + "<![CDATA[" + packageParams.get("openid") + "]]>" + "</openid>"
				+ "<out_trade_no>" + "<![CDATA[" + packageParams.get("out_trade_no") + "]]>" + "</out_trade_no>"
				+ "<spbill_create_ip>" + "<![CDATA[" + packageParams.get("spbill_create_ip") + "]]>" + "</spbill_create_ip>"
				+ "<total_fee>" + "<![CDATA[" + packageParams.get("total_fee") + "]]>" + "</total_fee>"
				+ "<trade_type>" + "<![CDATA[" + packageParams.get("trade_type") + "]]>" + "</trade_type>"
				+ "<sign>" + sign + "</sign>"
				+ "</xml>";

		HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
		CloseableHttpClient httpClient = httpClientBuilder.build();
		HttpPost httpPost = new HttpPost(url);
		httpPost.setEntity(new StringEntity(xml, "UTF-8"));

		System.out.println("Method-->getUrlCode:"+xml);

		CloseableHttpResponse response = httpClient.execute(httpPost);
		responseMessage = EntityUtils.toString(response.getEntity(), "UTF-8");

		System.out.println("responseMessage:"+JSON.toJSON(responseMessage));

		Map<String, String> map = XMLUtil.doXMLParse(responseMessage);

		//String codeUrl = map.get("code_url").toString();

		response.close();
		httpClient.close();
		return map;
	}

	/*
	public Map<String, Object> forRefund(SortedMap<String, String> packageParams) throws KeyStoreException, IOException,
			UnrecoverableKeyException, NoSuchAlgorithmException, KeyManagementException, CertificateException {
		String sign = createSign(packageParams);
		String xml = "<xml>" + "<appid><![CDATA[" + packageParams.get("appid") + "]]></appid>" + "<mch_id><![CDATA["
				+ packageParams.get("mch_id") + "]]></mch_id>" + "<nonce_str><![CDATA[" + packageParams.get("nonce_str")
				+ "]]></nonce_str>" + "<out_trade_no><![CDATA[" + packageParams.get("out_trade_no")
				+ "]]></out_trade_no>" + "<out_refund_no><![CDATA[" + packageParams.get("out_refund_no")
				+ "]]></out_refund_no>" + "<total_fee><![CDATA[" + packageParams.get("total_fee") + "]]></total_fee>"
				+ "<refund_fee><![CDATA[" + packageParams.get("refund_fee") + "]]></refund_fee>"
				+ "<op_user_id><![CDATA[" + packageParams.get("mch_id") + "]]></op_user_id>" + "<sign>" + sign
				+ "</sign>" + "</xml>";
		Map doXMLtoMap = new HashMap();
		KeyStore keyStore = KeyStore.getInstance("PKCS12");
		String P12_PASSWORD = GlobalConfig.MCH_ID;
		FileInputStream inputStream = new FileInputStream(System.getProperty("user.dir") + "//src//apiclient_cert.p12");
		try {
			keyStore.load(inputStream, P12_PASSWORD.toCharArray());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (CertificateException e) {
			e.printStackTrace();
		} finally {
			inputStream.close();
		}
		SSLContext sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore, P12_PASSWORD.toCharArray()).build();
		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, new String[] { "TLSv1" }, null,
				SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
		DefaultHttpClient client = new DefaultHttpClient();
		client.getParams().setParameter(ClientPNames.ALLOW_CIRCULAR_REDIRECTS, true);
		CloseableHttpClient httpClient = HttpClients.custom().setSSLSocketFactory(sslsf).build();
		HttpPost httpPost = new HttpPost(refundUrl);

		try {
			httpPost.setEntity(new StringEntity(xml, "UTF-8"));
			CloseableHttpResponse response = httpClient.execute(httpPost);
			String jsonStr = EntityUtils.toString(response.getEntity(), "UTF-8");
			if (jsonStr.indexOf("FAIL") >= 0) {
				return null;
			}
			doXMLtoMap = XMLUtil.doXMLParse(jsonStr);
			return doXMLtoMap;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			httpClient.close();
		}
		return null;
	}
	*/

	public String getResponseMessage() {
		return responseMessage;
	}

	/**
	 * 创建md5摘要,规则是:按参数名称a-z排序,遇到空值的参数不参加签名。
	 */
	public String createSign(SortedMap<String, String> packageParams) {
		StringBuffer sb = new StringBuffer();
		Set es = packageParams.entrySet();
		Iterator it = es.iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			String k = (String) entry.getKey();
			String v = (String) entry.getValue();
			if (null != v && !"".equals(v) && !"sign".equals(k) && !"key".equals(k)) {
				sb.append(k + "=" + v + "&");
				System.out.println("签名时:"+k+":"+v);	//暂时加上
			}
		}
		sb.append("key=" + GlobalConfig.KEY);
		String sign = MD5Util.MD5Encode(sb.toString(), "UTF-8").toUpperCase();
		System.out.println(sign);		 //暂时加上
		return sign;
	}


	/**额外补充*/

	/**
	 * 调起微信支付
	 *
	 * @param res 预支付订单 字符串
	 * @param url 微信支付 url
	 */
	public Map<String,String> wechatPay( Map<String,String> res,String url) {
		Map<String,String> result = new HashMap<>();
		Map<String, String> start = new HashMap<>();	//appId , nonceStr , timestamp , signature
		StringBuilder startSign = new StringBuilder();

		Map<String, String> pay = new HashMap<>();		//signType , packageStr , paySign
		StringBuilder paySign = new StringBuilder();
		try {
			//XmlMapper xmlMapper = new XmlMapper();
			//JsonNode node = xmlMapper.readTree(res);

			if (StringUtils.equals(res.get("return_code").toString(), "SUCCESS")) {
				// 得到的预支付订单，重新生成微信支付参数
				String prepay_id = res.get("prepay_id").toString();
				String jsapi_ticket = jsapiTicket();
				// 生成 微信支付 config 参数
				start.put("appId", GlobalConfig.APPID);
				start.put("nonceStr", createNonceStr() );
				start.put("timestamp", createTimeStamp() );
				// 生成 config 签名
				startSign.append("jsapi_ticket=").append(jsapi_ticket);
				startSign.append("&noncestr=").append(start.get("nonceStr"));
				startSign.append("&timestamp=").append(start.get("timestamp"));
				startSign.append("&url=").append(url);
				start.put("signature", encode(startSign.toString()) );

				System.out.println("签名时:"+ start.get("signature").toString() );

				// config信息验证后会执行ready方法的参数
				pay.put("signType", "MD5");//MD5
				pay.put("packageStr", "prepay_id=" + prepay_id);
				// 生成支付签名
				paySign.append("appId=").append(start.get("appId"));
				paySign.append("&nonceStr=").append(start.get("nonceStr"));
				paySign.append("&package=").append(pay.get("packageStr"));
				paySign.append("&signType=").append(pay.get("signType"));
				paySign.append("&timeStamp=").append(start.get("timestamp"));
				paySign.append("&key=").append(GlobalConfig.KEY);
				pay.put("paySign", encode(paySign.toString()) );
				// 将微信支参数放入 model 对象中以便前端使用
				//model.addAttribute("start", start);
				//model.addAttribute("pay", pay);
			}
		} catch (Exception e) {
			result.put("status","1");//错误
			//model.addAttribute("wechatMessage", "微信授权失败!");
			e.printStackTrace();
			return result;
		}
		result.put("status","0");//正确
		//start
		result.put("appId",start.get("appId") );
		result.put("nonceStr",start.get("nonceStr") );
		result.put("timestamp",start.get("timestamp") );
		result.put("signature",start.get("signature") );
		//pay
		result.put("signType",pay.get("signType") );
		result.put("packageStr",pay.get("packageStr") );
		result.put("paySign",pay.get("paySign") );
		//
		return result;
	}


	/**
	 * 微信授权，获取 access_token
	 *
	 * @return access_token
	 */
	public String getToken() {
		if (GlobalConfig.checkToken()) {
			// 声明 获取 access_token 路径
			StringBuilder tokenBuilder = new StringBuilder();
			tokenBuilder.append(GlobalConfig.TOKEN_API);
			tokenBuilder.append("&appid=").append(GlobalConfig.APPID);
			tokenBuilder.append("&secret=").append(GlobalConfig.APPSECRET);
			// 获取 token
			Map<?, ?> token = restTemplate.getForObject(tokenBuilder.toString(), Map.class);
			GlobalConfig.setToken((String) token.get("access_token"));
		}
		return GlobalConfig.getToken();
	}

	/**
	 * 获取微信 JSAPI 支付的临时票据
	 *
	 * @return 临时票据
	 */
	public String jsapiTicket() {
		if (GlobalConfig.checkJsapiTicket()) {
			// 声明 获取临时票据路径
			StringBuilder ticketBuilder = new StringBuilder();
			ticketBuilder.append(GlobalConfig.TICKET_API);
			ticketBuilder.append("?access_token=").append(getToken());
			ticketBuilder.append("&type=jsapi");
			// 获取 临时票据
			Map<?, ?> jsapiTicket = restTemplate.getForObject(ticketBuilder.toString(), Map.class);
			GlobalConfig.setJsapiTicket((String) jsapiTicket.get("ticket"));
		}
		return GlobalConfig.getJsapiTicket();
	}

	/* 未使用 */
	/**
	 * 获取用的 OPENID
	 *
	 * @param code 微信认证回调的 code
	 * @return
	 */
	public String takeOpenId(String code) {
		// 声明 获取OPENID路径
		StringBuilder openidBuilder = new StringBuilder();
		openidBuilder.append(GlobalConfig.OPENID_API);
		openidBuilder.append("?appid=").append(GlobalConfig.APPID);
		openidBuilder.append("&secret=").append(GlobalConfig.APPSECRET);
		openidBuilder.append("&code=").append(code);
		openidBuilder.append("&grant_type=authorization_code");
		// 获取 OPENID
		String res = restTemplate.getForObject(openidBuilder.toString(), String.class);
		Map<?, ?> map = JSONArray.parseObject(res, Map.class);
		return String.valueOf(map.get("openid"));
	}

	/* MD5Util */
	public static String byteToHex(final byte[] hash) {
		Formatter formatter = new Formatter();
		for (byte b : hash) {
			formatter.format("%02x", b);
		}
		String result = formatter.toString();
		formatter.close();
		return result;
	}

	public String encode(CharSequence charSequence) {
		try {
			MessageDigest crypt = MessageDigest.getInstance("MD5");
			crypt.reset();
			crypt.update(charSequence.toString().getBytes("UTF-8"));
			return byteToHex(crypt.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "";
	}

	public String createNonceStr() {
		return UUID.randomUUID().toString().replaceAll("-","");
	}

	public String createTimeStamp() {
		return Long.toString(System.currentTimeMillis() / 1000);	//todo: 后期改
	}

}
