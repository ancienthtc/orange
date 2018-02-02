package wxpay2;

import com.alibaba.fastjson.JSON;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;  
import java.io.InputStreamReader;  
import java.net.MalformedURLException;  
import java.net.URL;  
import java.net.URLConnection;  

  
  
public class read_json {  
  
    /** 
     * @链接请求获取json数据并进行key和value利用 
     */  
    public static void main(String[] args) {  
        //声明变量存储变量  
        String accessToken = "*************";  
        String openid = "******************";  
        String url = "https://******.com/*****?access_token="  
                + accessToken + "&openid=" + openid + "";
        String url2 = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx9e179bc3ebf0c798&secret=638bf90ddb83b7253314c4da03d20d24&code=071ssEc001MtBE1sYRa00YhYc00ssEck&grant_type=authorization_code";
        String json = loadJSON(url2);
        com.alibaba.fastjson.JSONObject o = JSON.parseObject(json);

        System.out.println(json);

  
    }  
  
    private static String loadJSON(String url) {  
        //处理字符串  
        StringBuilder json = new StringBuilder();  
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
                json.append(inputLine);  
            }  
            in.close();  
        } catch (MalformedURLException e) {  
        } catch (IOException e) {  
        }  
        return json.toString();  
    }  
  
}  