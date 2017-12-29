package com.jd.orange.service.servciceImpl;

import com.github.pagehelper.PageHelper;
import com.jd.orange.dao.OrderMapper;
import com.jd.orange.model.Order;
import com.jd.orange.service.OrderService;
import com.jd.orange.util.pagehelper.BeanUtil;
import com.jd.orange.util.pagehelper.PagedResult;
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
    public PagedResult<Order> getOrderListByStatus(Integer pageNo, Integer pageSize, String key, String start, String end,
                                                   Integer orderStatus, Integer shopStatus ,Integer way) {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);

        return BeanUtil.toPagedResult(orderMapper.selectOrderByOrderStatusWithPage(key,start,end,orderStatus,shopStatus,way));
    }

    @Override
    public Order getOrderDetail(String sequence) {
        return orderMapper.selectOrderWithDetail(sequence);
    }

}
