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

}
