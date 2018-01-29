package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.common.AdminCheck;
import com.jd.orange.common.Alevel;
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
    @AdminCheck(Alevel.L2)
    @RequestMapping(value = "/toAdminOrderOnline")
    public String toAdminOrderOnline(Model model)
    {
        model.addAttribute("OrderStatus",orderService.getOrderCount(0));
//        model.addAttribute("Os0",orderService.getOrderListByStatus(0,0,0));
//        model.addAttribute("Os1",orderService.getOrderListByStatus(1,0,0));
//        model.addAttribute("Os2",orderService.getOrderListByStatus(1,1,0));
//        model.addAttribute("Os3",orderService.getOrderListByStatus(2,1,0));
//        model.addAttribute("Os4",orderService.getOrderListByStatus(3,1,0));
//        model.addAttribute("Os5",orderService.getOrderListByStatus(4,1,0));
//        model.addAttribute("Os6",orderService.getOrderListByStatus(5,2,0));
//        model.addAttribute("Os7",orderService.getOrderListByStatus(6,3,0));
//        model.addAttribute("Os8",orderService.getOrderListByStatus(7,null,0));
        return "manager/Orderform";
    }

    //进入线下订单管理
    @AdminCheck(Alevel.L2)
    @RequestMapping(value = "/toAdminOrderOffline")
    public String toAdminOrderOffline(Model model)
    {
        model.addAttribute("OrderStatus",orderService.getOrderCount(1));
//        model.addAttribute("Os0",orderService.getOrderListByStatus(0,0,1));
//        model.addAttribute("Os1",orderService.getOrderListByStatus(1,0,1));
//        model.addAttribute("Os2",orderService.getOrderListByStatus(1,1,1));
//        model.addAttribute("Os3",orderService.getOrderListByStatus(2,1,1));
//        model.addAttribute("Os4",orderService.getOrderListByStatus(3,1,1));
//        model.addAttribute("Os5",orderService.getOrderListByStatus(4,1,1));
//        model.addAttribute("Os6",orderService.getOrderListByStatus(5,2,1));
//        model.addAttribute("Os7",orderService.getOrderListByStatus(6,3,1));
//        model.addAttribute("Os8",orderService.getOrderListByStatus(7,null,1));
        return "manager/xianxiaguanli";
    }

    @RequestMapping("/info")
    public String toInfo(Integer status , Model model)
    {
        if(status == 0)
        {
            model.addAttribute("info","支付成功,等待跳转");
            return "user/info_";
        }
        else
        {
            model.addAttribute("info","支付失败");
            return "user/info_";
        }
    }

    //进入订单统计
    @AdminCheck(Alevel.L2)
    @RequestMapping(value = "/toAdminOrderCount")
    public String toAdminOrderCount()
    {
        return "manager/Shops_Audit";
    }

    //进入订单详情
    //@AdminCheck
    @AdminCheck(Alevel.L2)
    @RequestMapping(value = "/toOrderDetail/{sequence}")
    public String toOrderDetail(@PathVariable String sequence,Model model)
    {
        Order order = orderService.getOrderDetail(sequence);
        model.addAttribute("order",order);


        return "manager/order_detailed";
    }


    //AJAX部分
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


    //订单确认
    @RequestMapping(value = "/accept" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String orderSure(String sequence,Object freight)
    {
        Map<String,Object> m = new HashMap<String, Object>();
        try {
            Double f = Double.parseDouble( freight.toString() );
            m = orderService.accept(sequence,f);
        }catch (Exception e)
        {
            m.put("status",-1);
            m.put("msg","运费错误!");
        }
        //Order order=orderService.getOrder(sequence);
        return JSON.toJSONString( m );
    }


    /** 支付接口回调函数 */
    //确认付款
    @RequestMapping("/pay")
    //@ResponseBody
    public String orderPay(String sequence,String price,Integer status)
    {
        System.out.println( sequence + "  "+ price + "  " + status );
        Map<String,Object> m = orderService.pay(sequence,price,status);
        if( Integer.valueOf(m.get("status").toString()) == 0 )
        {
            return "redirect:/order/info?status=0";
        }
        else
        {
            return "redirect:/order/info?status=1";
        }
    }

    //发货
    @RequestMapping(value = "/send" , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String orderSend(String sequence,String logistics)    //os:1 ss:1
    {
        //判断线上线下
        Order order=orderService.getOrder(sequence);
        if(order.getBuyway()==0)    //线上 发货
        {
            return JSON.toJSONString( orderService.send(sequence,logistics) );
        }
        else if(order.getBuyway()==1)   //线下 取货(用户到店取货，卖家发货后点击按钮)
        {
            return JSON.toJSONString( orderService.getsend(sequence) );
        }
        return "{\"status\":-1}";
    }

    //买家收货
    @RequestMapping(value = "/receive" , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String orderReceive(String sequence)
    {
        //线下无此状态
        return JSON.toJSONString( orderService.receive(sequence) );
    }


    //确认退货
    public String orderReturnSure()
    {
        return "";
    }

    //拒绝退货
    public String orderRefuse()
    {
        return "";
    }

    //退货
    public String orderReturn()
    {
        return "";
    }

    //拿退货
    public String orderOver()
    {
        return "";
    }

    //取消
    @RequestMapping("/cancel")
    @ResponseBody
    public String orderCancel(String sequence)
    {
        return JSON.toJSONString( orderService.cancel(sequence) );
    }


    public String orderStatusUpdate()
    {
        return "";
    }




    //获取线上订单
    @RequestMapping(value = "/getAdminOrderOnline" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getAdminOrderOnline(Integer pageNo, Integer pageSize, String key,String start,String end,Integer orderStatus,Integer shopStatus)
    {
        //PagedResult<Order> orderlists=orderService.getOrderListByStatus(pageNo,pageSize,key,start,end,orderStatus,shopStatus,0);

        return JSON.toJSONString( orderService.getOrderListByStatus(pageNo,pageSize,key,start,end,orderStatus,shopStatus,0) , filter );
    }

    //获取线下订单
    @RequestMapping(value = "/getAdminOrderOffline" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getAdminOrderOffline(Integer pageNo, Integer pageSize, String key,String start,String end,Integer orderStatus,Integer shopStatus)
    {
        //PagedResult<Order> orderlists=orderService.getOrderListByStatus(pageNo,pageSize,key,start,end,orderStatus,shopStatus,0);

        return JSON.toJSONString( orderService.getOrderListByStatus(pageNo,pageSize,key,start,end,orderStatus,shopStatus,1) , filter );
    }


    /* 用户模块 */
    //进入我的订单
    @UserCheck
    @RequestMapping("/toMyOrder")
    public String toMyOrder()
    {
        return "user/wodedingdan";
    }

    @UserCheck
    @RequestMapping("/toChoose")
    public String toChoosePay(HttpSession session,@RequestParam String sequence,Model model)
    {
        User user = (User) session.getAttribute("user");
        Order order = orderService.getOrder(sequence);
        if( user.getId() == order.getUser() )
        {
            model.addAttribute("sequence",sequence);
            return "user/zhifufangshi";
        }
        else
        {
            return "redirect:/order/toMyOrder";
        }
    }

    @UserCheck
    @RequestMapping("/toWxPay")
    public String toPay(@RequestParam String sequence)
    {
        Order order = orderService.getOrder(sequence);
        String body = order.getSequence()+"号订单付款";
        String orderid = order.getSequence();
        String price = String.valueOf( new Double(order.getAllprice()*100 ).intValue()  );
        return "redirect:/WxPay/pay?body="+body+"&&orderid="+orderid+"&&price="+price;
    }


    @RequestMapping(value = "/getUserNoSure" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getUserNoSure(Integer pageNo,HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        if(user==null)
        {
            return "";
        }
        return JSON.toJSONString( orderService.getUserOrderByStatus(user.getId(),pageNo,5,0,0),filter );
    }

    @RequestMapping(value = "/getUserNoPay" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getUserNoPay(Integer pageNo,HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        if(user==null)
        {
            return "";
        }
        return JSON.toJSONString( orderService.getUserOrderByStatus(user.getId(),pageNo,5,0,1),filter );
    }

    @RequestMapping(value = "/getUserNoReceive" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getUserNoReceive(Integer pageNo,HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        if(user==null)
        {
            return "";
        }
        return JSON.toJSONString( orderService.getUserOrderByStatus(user.getId(),pageNo,5,1,2),filter );
    }

    @RequestMapping(value = "/getUserFinish" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getUserFinish(Integer pageNo,HttpSession session)
    {
        User user = (User) session.getAttribute("user");
        if(user==null)
        {
            return "";
        }
        return JSON.toJSONString( orderService.getUserOrderByStatus(user.getId(),pageNo,5,1,3),filter );
    }

}
