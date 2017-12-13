package com.jd.orange.util.date;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateExample {
    public static Calendar getNowTimeByCalendar()
    {
        return Calendar.getInstance();
    }

    public static Date getNowTimeByDate()
    {
        // Calendar转为Date
        Date d =(Date) DateExample.getNowTimeByCalendar().getTime();
        return d;
    }

    public static Timestamp getLocalTimeFormat()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        return Timestamp.valueOf( sdf.format(DateExample.getNowTimeByCalendar().getTime()) );
    }

    public static long getTimestamp()
    {
        //return new Timestamp(new Date().getTime());
        return getNowTimeByCalendar().getTimeInMillis();
    }

    /**
     * return 1: date1 > date2 || date1 == null && date2 != null
     * return 0: date1 == date2 || date1 == null && date2 == null
     * return -1: date1 < date2 || date1 != null && date2 == null
     * @param date1
     * @param date2
     * @return -1 0 1
     */
    public static int CompareDate(String date1,String date2)
    {
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        if (date1==null && date2!=null)
        {
            return 1;
        }
        else if (date2==null && date1!=null)
        {
            return -1;
        }
        else if(date1==null && date2==null)
        {
            return 0;
        }
        try {
            Date dt1 = sdf.parse(date1);
            Date dt2 = sdf.parse(date2);
            if (dt1.getTime() > dt2.getTime()) {
                //System.out.println("dt1 在dt2后");
                return 1;
            } else if (dt1.getTime() < dt2.getTime()) {
                //System.out.println("dt1在dt2前");
                return -1;
            } else {
                return 0;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return 0;
    }

}
