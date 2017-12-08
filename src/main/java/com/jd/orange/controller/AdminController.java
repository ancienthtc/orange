package com.jd.orange.controller;

import com.jd.orange.service.OrderService;
import com.jd.orange.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;
    /*
       page part:
     */
    @RequestMapping("/home")
    public String page_home(Model model)
    {
        //商城用户数量
        model.addAttribute("userAmount",userService.getUserAmount());
        //商城订单数量
        model.addAttribute("orderAmount",orderService.orderAmount());
        //
        return "manager/home";
    }




}
