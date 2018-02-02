package com.jd.orange.timer;

/**
 * Created by ThinkPad on 2017/11/29.
 */
public interface TimerService {
    void myTest();

    //积分清除 (1年有效)  //每天凌晨12点
    void ScoreClear();

    //自动收货  (大于7天未收货自动收货)   //每天凌晨1点
    void AutoReceive();

    //自动取消  (大于7天未付款自动取消)   //每天凌晨2点
    void AutoCancel();

}
