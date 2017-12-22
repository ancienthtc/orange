package com.jd.orange.service;

import com.jd.orange.model.Order;

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

    Order getOrderDetail(String sequence);
}
