package com.jd.orange.controller;

import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.common.UserCheck;
import com.jd.orange.model.Cart;
import com.jd.orange.model.User;
import com.jd.orange.service.CartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {

    private static final Logger log = LoggerFactory.getLogger(CartController.class);

    private ValueFilter filter = new ValueFilter() {
        @Override
        public Object process(Object obj, String s, Object v) {
            if(v==null)
                return "";
            return v;
        }
    };

    @Autowired
    private CartService cartService;

    //进入购物车
    @UserCheck
    @RequestMapping("/toCart")
    public String toCart(HttpSession session, Model model)
    {
        User user=(User) session.getAttribute("user");

        return "user/gouwuche";
    }

    //添加购物车
    @RequestMapping("/add")
    @ResponseBody
    public String addCart(HttpSession session, Cart cart)
    {
        User user= (User)session.getAttribute("user");
        if(user==null)
        {
            return "false";
        }
        cart.setUser(user.getId());
        if(cartService.AddCart(cart) > 0)
        {
            return "true";
        }
        return "false";
    }

}
