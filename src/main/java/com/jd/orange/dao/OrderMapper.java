package com.jd.orange.dao;

import com.jd.orange.model.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    int orderAmount();

    Map<String,Integer> countOrderStatus();

    /**
     * @param orderStatus 0-未确认 1-未发货 2-待收货 3-已完成 4-未确认退货 5-等待退货 6-完成退货 7-取消
     * @param shopStatus 0-未付款	1-已付款  2-未退款  3-已退款
     * @param way 0-线上 1-线下
     * @return
     */
    List<Order> selectOrderByOrderStatus(@Param("orderStatus") Integer orderStatus,@Param("shopStatus") Integer shopStatus,@Param("way") Integer way);

    Order selectOrderWithDetail(String sequence);

}