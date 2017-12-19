package utilTest;

import com.jd.orange.util.StringUtil.GenerateString;
import com.jd.orange.util.date.DateExample;
import org.junit.Test;

import java.util.Random;

public class TestString {

    @Test
    public void test1()
    {
        System.out.println(  String.valueOf(DateExample.getTimestamp() ) );
        System.out.println( new GenerateString().getUUID() );
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

}
