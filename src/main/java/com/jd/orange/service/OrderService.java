package com.jd.orange.service;

import com.jd.orange.model.Order;
import com.jd.orange.model.User;
import com.jd.orange.util.pagehelper.PagedResult;

import java.util.List;
import java.util.Map;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface OrderService {

    //订单数量
    int orderAmount();

    Map<String,Integer> getOrderCount(Integer way);

    List<Order> getOrderListByStatus(Integer orderStatus,Integer shopStatus,Integer way);

    PagedResult<Order> getOrderListByStatus(Integer pageNo, Integer pageSize, String key, String start, String end,
                                            Integer orderStatus, Integer shopStatus,Integer way);

    //获取订单详情
    Order getOrderDetail(String sequence);

    //获取订单基本信息
    Order getOrder(String sequence);

    //创建订单
    Map<String,Object> create(String json, User user,String ServerPath);

    PagedResult<Order> getUserOrderByStatus(Integer uid,Integer pageNo,Integer pageSize,Integer shopstatus,Integer orderstatus);

    //接单
    Map<String,Object> accept(String sequence);

    //付款(回调)
    Map<String,Object> pay(String sequence);

    //发货
    Map<String,Object> send(String sequence,String logistics);

    //取货
    Map<String,Object> getsend(String sequence);

    //取消
    Map<String,Object> cancel(String sequence);
}
