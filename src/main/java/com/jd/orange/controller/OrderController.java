package com.jd.orange.controller;

import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    private static final Logger log = LoggerFactory.getLogger(PartController.class);

    private ValueFilter filter = new ValueFilter() {
        @Override
        public Object process(Object obj, String s, Object v) {
            if(v==null)
                return "";
            return v;
        }
    };

    //页面跳转部分
    //进入线上订单管理
    @RequestMapping(value = "/toAdminOrderOnline")
    public String toAdminOrderOnline(Model model)
    {
        model.addAttribute("OrderStatus",orderService.getOrderCount());
        model.addAttribute("Os0",orderService.getOrderListByStatus(0,0,0));
        model.addAttribute("Os1",orderService.getOrderListByStatus(1,0,0));
        model.addAttribute("Os2",orderService.getOrderListByStatus(1,1,0));
        model.addAttribute("Os3",orderService.getOrderListByStatus(2,1,0));
        model.addAttribute("Os4",orderService.getOrderListByStatus(3,1,0));
        model.addAttribute("Os5",orderService.getOrderListByStatus(4,1,0));
        model.addAttribute("Os6",orderService.getOrderListByStatus(5,2,0));
        model.addAttribute("Os7",orderService.getOrderListByStatus(6,3,0));
        model.addAttribute("Os8",orderService.getOrderListByStatus(7,null,0));
        return "manager/Orderform";
    }

    //进入线下订单管理
    @RequestMapping(value = "/toAdminOrderOffline")
    public String toAdminOrderOffline()
    {
        return "manager/xianxiaguanli";
    }

    //进入订单统计
    @RequestMapping(value = "/toAdminOrderCount")
    public String toAdminOrderCount()
    {
        return "manager/Shops_Audit";
    }

    //进入订单详情
    @RequestMapping(value = "/toOrderDetail/{sequence}")
    public String toOrderDetail(@PathVariable String sequence,Model model)
    {
        model.addAttribute("order",orderService.getOrderDetail(sequence));
        return "manager/order_detailed";
    }

    //AJAX部分
    public String orderStatusUpdate()
    {
        return "";
    }


}
