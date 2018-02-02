package com.jd.orange.timer;

import com.jd.orange.dao.OrderMapper;
import com.jd.orange.dao.UserMapper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by ThinkPad on 2017/11/29.
 */
@Component  //import org.springframework.stereotype.Component;
public class TimerServiceImpl implements TimerService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private OrderMapper orderMapper;

//    @Scheduled(cron="0 0/30 * * * ? ")   //cron="0/59 * *  * * ? " 每59秒执行一次
//    @Override
//    public void myTest(){
//        System.out.println("定时任务(半小时):"+new Date());
//    }

    @Scheduled(cron = "0 0 0/2 * * ? ")
    @Override
    public void myTest() {
        System.out.println("定时任务(2小时):"+new Date());
    }

    @Scheduled(cron = "0 0 0 * * ?")    //每天0点执行
    @Override
    public void ScoreClear() {
        System.out.println("执行积分清除任务:"+new Date());
        userMapper.ScoreInvalid();
    }

    @Scheduled(cron = "0 0 1 * * ?")    //每天凌晨1点
    @Override
    public void AutoReceive() {
        System.out.println("执行自动收货任务:"+new Date());
        orderMapper.AutoReceiveInOnline();
    }

    @Scheduled(cron = "0 0 2 * * ?")    //每天凌晨2点
    @Override
    public void AutoCancel() {
        System.out.println("执行自动取消任务:"+new Date());
        orderMapper.CancelOrderWithNoPay();
    }
}
/*
CRON表达式    含义
"0 0 23 * * ?"    每天23点执行一次
"0 0 1 * * ?"    每天凌晨1点执行一次
"0 0 12 * * ?"    每天中午十二点触发
"0 15 10 ? * *"    每天早上10：15触发
"0 15 10 * * ?"    每天早上10：15触发
"0 15 10 * * ? *"    每天早上10：15触发
"0 15 10 * * ? 2005"    2005年的每天早上10：15触发
"0 * 14 * * ?"    每天从下午2点开始到2点59分每分钟一次触发
"0 0/5 14 * * ?"    每天从下午2点开始到2：55分结束每5分钟一次触发
"0 0/5 14,18 * * ?"    每天的下午2点至2：55和6点至6点55分两个时间段内每5分钟一次触发
"0 0-5 14 * * ?"    每天14:00至14:05每分钟一次触发
"0 10,44 14 ? 3 WED"    三月的每周三的14：10和14：44触发
"0 15 10 ? * MON-FRI"    每个周一、周二、周三、周四、周五的10：15触发

0 0/2 * * * ?       2分钟执行一次
 */