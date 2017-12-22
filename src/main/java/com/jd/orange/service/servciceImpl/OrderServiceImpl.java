package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.OrderMapper;
import com.jd.orange.model.Order;
import com.jd.orange.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService{

    @Resource
    private OrderMapper orderMapper;

    @Override
    public int orderAmount() {
        return orderMapper.orderAmount();
    }

    @Override
    public Map<String, Integer> getOrderCount(Integer way) {
        return orderMapper.countOrderStatus(way);
    }

    @Override
    public List<Order> getOrderListByStatus(Integer orderStatus,Integer shopStatus,Integer way) {
        return orderMapper.selectOrderByOrderStatus(orderStatus,shopStatus,way);
    }

    @Override
    public Order getOrderDetail(String sequence) {
        return orderMapper.selectOrderWithDetail(sequence);
    }

}
