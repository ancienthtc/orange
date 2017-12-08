package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.OrderMapper;
import com.jd.orange.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OrderServiceImpl implements OrderService{

    @Resource
    private OrderMapper orderMapper;

    @Override
    public int orderAmount() {
        return orderMapper.orderAmount();
    }
}
