package com.jd.orange.util.StringUtil;

import com.jd.orange.util.date.DateExample;

import java.util.Random;
import java.util.UUID;

public class GenerateString {

    public String getOrderid()
    {
        return String.valueOf(DateExample.getTimestamp())+getRandomString(7);
    }

    public String getFileName(String mark)
    {
        return mark+String.valueOf(DateExample.getTimestamp())+getRandomString(8);
    }

    public String getRandomString(int length)
    {
        //String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        String base = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    public String getRandomString_Num(int length)
    {
        //String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        String base = "0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    public String getUUID()
    {
        return UUID.randomUUID().toString().replaceAll("-","");
    }


}
