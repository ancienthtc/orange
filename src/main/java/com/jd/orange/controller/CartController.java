package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.common.UserCheck;
import com.jd.orange.model.Cart;
import com.jd.orange.model.User;
import com.jd.orange.service.AddressService;
import com.jd.orange.service.CartService;
import com.jd.orange.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Autowired
    private AddressService addressService;



    //进入购物车
    @UserCheck
    @RequestMapping("/toCart")
    public String toCart(HttpSession session, Model model)
    {
        User user=(User) session.getAttribute("user");
        model.addAttribute("carts",cartService.getCartList(user.getId()));
        return "user/gouwuche";
    }

    //添加购物车
    @RequestMapping(value = "/add" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String addCart(HttpSession session, Cart cart)
    {
        User user= (User)session.getAttribute("user");
        if(user==null)
        {
            return "请先登录";
        }
        cart.setUser(user.getId());
        if(cartService.AddCart(cart) > 0)
        {
            return "true";
        }
        return "添加失败";
    }

    //购物车删除
    @RequestMapping("/delItem")
    @ResponseBody
    public String delCartItem(HttpSession session,Integer cid)
    {
        User user= (User)session.getAttribute("user");
        if(user==null)
        {
            return "false";
        }
        if(cartService.CartItemDel(cid) >0 )
        {
            return "true";
        }
        return "false";
    }

    //购物车清空
    @RequestMapping("/clear")
    @ResponseBody
    public String clearCart(HttpSession session)
    {
        User user= (User)session.getAttribute("user");
        if(user==null)
        {
            return "false";
        }
        if(cartService.CartClear(user.getId()) > 0 )
        {
            return "true";
        }
        return "false";
    }

    //结算购物车(总价/收货地址)
    @RequestMapping("/getCal")
    @ResponseBody
    public String CartCal(@RequestBody String json)
    {
        //解析JSON
        JSONObject object = JSON.parseObject(json);
        //取得JSON中的数组
        JSONArray jsonArray = object.getJSONArray("Cart");
        //转换List<Map<>>
        List<HashMap> cartList = JSON.parseArray(jsonArray.toJSONString(), HashMap.class);// getString("id")

        Map<String,Object> result=cartService.getCal(cartList);

        return JSON.toJSONString(result);
    }

    //批量删除
    @RequestMapping("/cartDel")
    @ResponseBody
    public String CartDel(@RequestBody String json)
    {
        //解析JSON
        JSONObject object = JSON.parseObject(json);
        //取得JSON中的数组
        JSONArray jsonArray = object.getJSONArray("Cart");
        //转换List<Map<>>
        List<HashMap> cartList = JSON.parseArray(jsonArray.toJSONString(), HashMap.class);// getString("id")

        return JSON.toJSONString( cartService.cartDel(cartList) );
    }

    @UserCheck
    @RequestMapping("/commit")
    public String CartCommit(String json,Integer type,Model model,HttpSession session)
    {
        if(json==null)
        {
            return "redirect:/cart/toCart";
        }
        User user=(User) session.getAttribute("user");
        List<Map<String,Object>> show;//cid,amount,price,all,detail,fid,fname,fclass,price,gid,gname,freight,pic1
        //type:0 直接购买 type:1 购物车提交
        //解析JSON
        JSONObject object = JSON.parseObject(json);
        if(type==1)
        {
            //取得JSON中的数组
            JSONArray jsonArray = object.getJSONArray("Cart");
            //转换List<Map<>>
            List<HashMap> cartList = JSON.parseArray(jsonArray.toJSONString(), HashMap.class);// getString("id")
            show = cartService.itemDetail(cartList);
        }
        else if(type==0)
        {
            Double amount=Double.valueOf( object.getString("amount") ) ;
            Integer fid=Integer.valueOf( object.getString("format") );
            String detail = object.getString("detail");
            show = cartService.itemDetail(fid,amount,detail);
        }
        else
        {
            return "redirect:/login/login";
        }

        //收货地址
        model.addAttribute("address",addressService.getUserMain(user.getId()));
        //商品显示
        model.addAttribute("goodsList",show);
        //总价
        model.addAttribute("all",cartService.CalculatePrice(show));
        //用户可用积分 session获取
        //可用积分最高抵1/10价
        log.info(JSON.toJSONString(show,filter));
        session.setAttribute("toOrder",JSON.toJSONString(show,filter) );
        return "user/lijigoumai";
    }

}
