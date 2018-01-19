package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.common.AdminCheck;
import com.jd.orange.common.UserCheck;
import com.jd.orange.model.Address;
import com.jd.orange.model.User;
import com.jd.orange.service.*;
import com.jd.orange.util.PictureType;
import com.jd.orange.util.pagehelper.PagedResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger log = LoggerFactory.getLogger(UserController.class);

    private ValueFilter filter = new ValueFilter() {
        @Override
        public Object process(Object obj, String s, Object v) {
            if(v==null)
                return "";
            return v;
        }
    };

    @Autowired
    private UserService userService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private PartService partService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private AddressService addressService;

    /*  管理员模块  */
    @AdminCheck
    @RequestMapping("/toUserList")
    public String toUserPageList(Model model)
    {
        model.addAttribute("count",userService.getUserAmount());
        return "manager/user_list";
    }

    @AdminCheck
    @RequestMapping("/toUserDetail")
    public String toUserDetail(Model model,Integer uid)
    {

        return "manager/member-show";
    }

    @RequestMapping(value = "/getUserList" , method = RequestMethod.POST ,  produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getUserList(Integer pageNo, Integer pageSize, String keys,String start_c,String end_c,String start_u,String end_u)
    {
        PagedResult<User> userPagedResult=userService.getUsers(pageNo,pageSize,keys,start_c,end_c,start_u,end_u);
        log.info( JSON.toJSONString(userPagedResult) );
        return JSON.toJSONString(userPagedResult,filter);
    }


    /*  用户模块  */
    //进入商城首页
    @RequestMapping("/toShopIndex")
    public String toShopIndex(Model model)
    {
        model.addAttribute("figure",imageService.pictures(PictureType.Other,null));
        model.addAttribute("parts",partService.getFatherPart());
        //热销产品
        model.addAttribute("hot",goodsService.getHotSales());
        //推荐产品
        model.addAttribute("recommend",goodsService.getRecommend());
        //新产品
        model.addAttribute("newGoods",goodsService.getNewGoods());
        return "user/index";
    }

    //进入案内
    @RequestMapping("/toGuide")
    public String toGuide()
    {
        return "user/annei";
    }

    //进入个人中心
    @UserCheck
    @RequestMapping("/toCenter")
    public String toCenter(HttpSession session , Model model)
    {
        User user = (User) session.getAttribute("user");
        model.addAttribute("count",userService.getUserOrderCount(user.getId()));
        return "user/gerenzhongxin";
    }

    //进入修改资料
    @UserCheck
    @RequestMapping("/toInfo")
    public String toInfo()
    {
        return "user/xougaiziliao";
    }

    //进入收货地址
    @UserCheck
    @RequestMapping("/toAddress")
    public String toAddress(HttpSession session,Model model)
    {
        User user= (User)session.getAttribute("user");
        model.addAttribute("addressses",addressService.getAddressByUser(user.getId()));
        return "user/shouhuodizhi";
    }

    //进入收货地址详情
    @UserCheck
    @RequestMapping("/toAddressDetail")
    public String toAddressDetail(@RequestParam(required = false) Integer aid , HttpSession session,Model model)
    {
        if(aid!=null)   //修改
        {
            model.addAttribute("address",addressService.getAddressById(aid));
        }

        return "user/shouhuodizhi_xqy";
    }

    //进入修改密码
    @RequestMapping("/toAlterPass")
    public String toAlterPass()
    {
        return "user/xougaimima";
    }

    //进入联系我们
    @RequestMapping("/toContact")
    public String toContact()
    {
        return "user/lianxiwomen";
    }

    //进入忘记密码
    @RequestMapping("/toForgetPass")
    public String forgetPass()
    {
        return "user/zhaohuimima";
    }

    //进入重置密码
    @RequestMapping("/toResetPass")
    public String resetPass()
    {
        return "user/zhaohuimima_cz";
    }


    /* 地址模块 */
    //设置默认/取消默认
    @RequestMapping("/setMain")
    @ResponseBody
    public String mainAddressSet(Integer id,Integer status,HttpSession session)
    {
        User user = (User)session.getAttribute("user");
        if( addressService.setMain(id,status,user.getId()) > 0 )
        {
            return "true";
        }
        return "false";
    }

    //地址 增加/修改
    @RequestMapping("/addressAdd")
    @ResponseBody
    public String AddressAdd(Address address,HttpSession session)
    {
        if(address.getId()==null)   //增加
        {
            User user=(User) session.getAttribute("user");
            if(user==null)
            {
                return "false";
            }
            address.setUser(user.getId());
            if( addressService.addAddress(address) > 0 )
            {
                return "true";
            }

        }
        else    //修改
        {
            if( addressService.updateAddress(address) > 0 )
            {
                return "true";
            }
        }
        return "false";
    }

    //地址 删除
    @RequestMapping("/addressDel")
    @ResponseBody
    public String AddressDel(Integer aid)
    {
        if( addressService.addressDel(aid) > 0 )
        {
            return "true";
        }
        return "false";
    }

    //个人信息
    @RequestMapping("/update")
    @ResponseBody
    public String UserInfoUpdate(User user,HttpSession session)
    {
        if(user.getNickname().length()<=0)
        {
            return "false";
        }
        if( userService.UserInfoUpdate(user) > 0 )
        {
            session.setAttribute("user",userService.getUser(user.getId()));//刷新session
            return "true";
        }
        return "false";
    }

}
