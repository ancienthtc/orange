package utilTest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jd.orange.util.StringUtil.GenerateString;
import com.jd.orange.util.api.wx.WXPayUtil;
import com.jd.orange.util.date.DateExample;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

public class TestString {

    @Test
    public void test1()
    {
        System.out.println(  String.valueOf(DateExample.getTimestamp() ) );
        System.out.println( new GenerateString().getUUID() );
        System.out.println(  String.valueOf(DateExample.getTimestamp() ).substring(0,10) );
        System.out.println(  String.valueOf(DateExample.getTimestamp()/1000 ) );
    }

    @Test
    public void test2()
    {
        int values[] = new int[100];
        int temp1,temp2,temp3;
        Random r = new Random();
        //初始化数组
        for(int i = 0;i < values.length;i++){
            values[i] = i + 1;
        }

        //随机交换values.length次
        for(int i = 0;i < values.length;i++){
            temp1 = Math.abs(r.nextInt()) % (values.length-1); //随机产生一个位置
            temp2 = Math.abs(r.nextInt()) % (values.length-1); //随机产生另一个位置
            if(temp1 != temp2){
                temp3 = values[temp1];
                values[temp1] = values[temp2];
                values[temp2] = temp3;
            }
        }
        // 遍历数组并打印数据
        for(int i = 0;i < 20;i++){
            System.out.print(values[i] + "\t");
        }
    }


    @Test
    public void test3()
    {
        System.out.println( new GenerateString().getOrderid() );
    }

    @Test
    public void test4()
    {
        System.out.println(DateExample.CompareDate("1995-11-12 15:21","1999-12-11 09:59"));
    }

    @Test
    public void test5()
    {
        String pathandname="E:/Project/Intellij1/OrangeHouse/target/OrangeHouse/description/goods1513588975204bke2qpz9.jpg";
        int start = pathandname.lastIndexOf("/");
        if (start != -1 ) {
            System.out.println( pathandname.substring(start + 1) );
        } else {
            System.out.println( "xx" );
    }

    }

    @Test
    public void test6()
    {
        String s="{\"reason\":\"操作成功\",\"result\":{\"sid\":\"180103105338103011100003\",\"fee\":1,\"count\":1},\"error_code\":0}";
        String t="{\"reason\":\"错误的短信模板ID,请通过后台确认!!\",\"result\":null,\"error_code\":205402}";
        //String z="{}";
        net.sf.json.JSONObject object1 = net.sf.json.JSONObject.fromObject(s);
        net.sf.json.JSONObject object2 = net.sf.json.JSONObject.fromObject(t);
        //net.sf.json.JSONObject object3 = net.sf.json.JSONObject.fromObject(z);
        System.out.println(object1.get("result").toString()+object1.get("error_code").toString());
        System.out.println(object2.get("result").toString()+object2.get("error_code").toString());
        //System.out.println(object3.get("result").toString());
    }

    @Test
    public void test7()
    {
        System.out.println( DateExample.getLocalTimeFormat() );
    }

    @Test
    public void test8()
    {
        List<String> lstr = new ArrayList<String>();
        lstr.add("23");
        lstr.add("g42");
        lstr.add("2");
        lstr.add("er");
        lstr.add("ere");
        List<Integer> lint = new ArrayList<Integer>();
        for(String str:lstr){
            if(!str.matches("^([0-9])+$")){
                continue;
            }
            int i = Integer.parseInt(str);
            lint.add(i);
        }

        for(int i:lint){
            System.out.println(i);
        }

    }

    @Test
    public void test9()
    {
        String openid = "oUP8NwNCA0EOTF7LhxZw0jPwWTjo,oUP8NwNCA0EOTF7LhxZw0jPwWTjo";
        System.out.println( "new:"+openid.substring(0,28) + "  len:"+openid.substring(0,28).length() );
    }

    @Test
    public void test10()
    {
        String x = "<xml><return_code><![CDATA[SUCCESS]]></return_code>" +
                "<return_msg><![CDATA[OK]]></return_msg>" +
                "<appid><![CDATA[wx9e179bc3ebf0c798]]></appid>" +
                "<mch_id><![CDATA[1382668802]]></mch_id>" +
                "<nonce_str><![CDATA[4sB4qXuyMBp6VxnJ]]></nonce_str>" +
                "<sign><![CDATA[C08CF0CD75854742F56C9C48C8E78186]]></sign>" +
                "<result_code><![CDATA[SUCCESS]]></result_code>" +
                "<prepay_id><![CDATA[wx2018013109291073d51ac6f50883751246]]></prepay_id>" +
                "<trade_type><![CDATA[JSAPI]]></trade_type>" +
                "</xml>";
        try {

            System.out.println( JSON.toJSON( WXPayUtil.xmlToMap(x)));
        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }

}
