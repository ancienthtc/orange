package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.common.AdminCheck;
import com.jd.orange.model.User;
import com.jd.orange.service.UserService;
import com.jd.orange.util.pagehelper.PagedResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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


}
