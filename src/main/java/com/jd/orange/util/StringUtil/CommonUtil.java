package com.jd.orange.util.StringUtil;

import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.*;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

/**
    * 通用工具类
    * @author rory.wu
    * @version 1.0
    * @since 2015年08月05日
    */
   public class CommonUtil {
       
       private static Logger log = Logger.getLogger(CommonUtil.class);
       public static JSONObject httpsRequestToJsonObject(String requestUrl, String requestMethod, String outputStr) {
           JSONObject jsonObject = null;
           try {
                StringBuffer buffer = httpsRequest(requestUrl, requestMethod, outputStr);
               jsonObject = JSONObject.fromObject(buffer.toString());
           } catch (Exception e) {
               log.error("https请求异常："+e.getMessage());
           }
           return jsonObject;
       }
       
       
       private static StringBuffer httpsRequest(String requestUrl, String requestMethod, String output)
               throws NoSuchAlgorithmException, NoSuchProviderException, KeyManagementException, MalformedURLException,
               IOException, ProtocolException, UnsupportedEncodingException {
           
           URL url = new URL(requestUrl);
           HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
           
           connection.setDoOutput(true);
           connection.setDoInput(true);
           connection.setUseCaches(false);
           connection.setRequestMethod(requestMethod);
           if (null != output) {
               OutputStream outputStream = connection.getOutputStream();
               outputStream.write(output.getBytes("UTF-8"));
               outputStream.close();
           }
   
           // 从输入流读取返回内容
           InputStream inputStream = connection.getInputStream();
           InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
           BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
           String str = null;
           StringBuffer buffer = new StringBuffer();
           while ((str = bufferedReader.readLine()) != null) {
               buffer.append(str);
           }
   
           bufferedReader.close();
           inputStreamReader.close();
           inputStream.close();
           inputStream = null;
           connection.disconnect();
           return buffer;
       }


        public static String loadJSON(String url) {
            //处理字符串
            StringBuilder builder = new StringBuilder();
            try {
                //通过一个表示URL地址的字符串可以构造一个URL对象。
                //url构造函数需要的参数。
                URL oracle = new URL(url);
                //yc是URLConnection对象，oracle.openConnection()返回的是URLConnection对象，赋值给yc。
                URLConnection yc = oracle.openConnection();

                //BufferedReader缓冲方式文本读取
                //InputStreamReader是字节流与字符流之间的桥梁，能将字节流输出为字符流，
                //并且能为字节流指定字符集，可输出一个个的字符
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        yc.getInputStream(), "utf-8"));// 防止乱码
                String inputLine = null;
                while ((inputLine = in.readLine()) != null) {
                    builder.append(inputLine);
                }
                in.close();
            }
            catch (MalformedURLException e) {

            }
            catch (IOException e) {

            }
            return builder.toString();
        }


}