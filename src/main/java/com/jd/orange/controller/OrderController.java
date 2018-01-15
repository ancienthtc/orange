package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.common.UserCheck;
import com.jd.orange.model.Order;
import com.jd.orange.model.User;
import com.jd.orange.service.OrderService;
import com.jd.orange.service.UserService;
import com.jd.orange.util.pagehelper.PagedResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    private static final Logger log = LoggerFactory.getLogger(OrderController.class);

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
        model.addAttribute("OrderStatus",orderService.getOrderCount(0));
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
    public String toAdminOrderOffline(Model model)
    {
        model.addAttribute("OrderStatus",orderService.getOrderCount(1));
        model.addAttribute("Os0",orderService.getOrderListByStatus(0,0,1));
        model.addAttribute("Os1",orderService.getOrderListByStatus(1,0,1));
        model.addAttribute("Os2",orderService.getOrderListByStatus(1,1,1));
        model.addAttribute("Os3",orderService.getOrderListByStatus(2,1,1));
        model.addAttribute("Os4",orderService.getOrderListByStatus(3,1,1));
        model.addAttribute("Os5",orderService.getOrderListByStatus(4,1,1));
        model.addAttribute("Os6",orderService.getOrderListByStatus(5,2,1));
        model.addAttribute("Os7",orderService.getOrderListByStatus(6,3,1));
        model.addAttribute("Os8",orderService.getOrderListByStatus(7,null,1));
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

    //创建订单
    @RequestMapping(value = "/create" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String CreateOrder(@RequestBody String json, HttpSession session,HttpServletRequest request)
    {
        Map<String,Object> map=new HashMap<String, Object>();
        User user=(User) session.getAttribute("user");
        if( user==null )
        {
            map.put("order",null);
            map.put("msg","未登录");
            map.put("status",1);
            return JSON.toJSONString(map);
        }
        map = orderService.create(json,user,request.getSession().getServletContext().getRealPath("/"));
        session.setAttribute("user",userService.getUser(user.getId()));//刷新session
        //必要条件: 规格号,数量,有效地址id,留言,支付方式,积分扣除
        //参数1. String: aid , buyway , score
        //参数2. List<Map<String,Object>>: fid , amount , detail

        return JSON.toJSONString(map);
    }



    @RequestMapping(value = "/getAdminOrderOnline" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getAdminOrderOnline(Integer pageNo, Integer pageSize, String key,String start,String end,Integer orderStatus,Integer shopStatus)
    {
        //PagedResult<Order> orderlists=orderService.getOrderListByStatus(pageNo,pageSize,key,start,end,orderStatus,shopStatus,0);

        return JSON.toJSONString( orderService.getOrderListByStatus(pageNo,pageSize,key,start,end,orderStatus,shopStatus,0) , filter );
    }




    /* 用户模块 */
    //进入我的订单
    @UserCheck
    @RequestMapping("/toMyOrder")
    public String toMyOrder()
    {
        return "user/wodedingdan";
    }

    @RequestMapping("/getUserNoSure")
    @ResponseBody
    public String getUserNoSure(Integer pageNo,HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        if(user==null)
        {
            return "";
        }
        return JSON.toJSONString( orderService.getUserOrderByStatus(user.getId(),pageNo,5,0,0) );
    }

    @RequestMapping("/getUserNoPay")
    @ResponseBody
    public String getUserNoPay(Integer pageNo,HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        if(user==null)
        {
            return "";
        }
        return JSON.toJSONString( orderService.getUserOrderByStatus(user.getId(),pageNo,5,0,1) );
    }

    @RequestMapping("/getUserNoReceive")
    @ResponseBody
    public String getUserNoReceive(Integer pageNo,HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        if(user==null)
        {
            return "";
        }
        return JSON.toJSONString( orderService.getUserOrderByStatus(user.getId(),pageNo,5,1,2) );
    }

    @RequestMapping("/getUserFinish")
    @ResponseBody
    public String getUserFinish(Integer pageNo,HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        if(user==null)
        {
            return "";
        }
        return JSON.toJSONString( orderService.getUserOrderByStatus(user.getId(),pageNo,5,1,3) );
    }

}
