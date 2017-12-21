package com.jd.orange.controller;

import com.jd.orange.common.AdminCheck;
import com.jd.orange.model.Admin;
import com.jd.orange.model.User;
import com.jd.orange.service.LoginService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

/**
 * Created by ThinkPad on 2017/11/28.
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    private static final Logger log = LoggerFactory.getLogger(LoginController.class);

    @Resource
    private LoginService loginService;

    @RequestMapping("/AdminSignIn")
    public String AdminToLogin()
    {
        return "manager/login";
    }

    @RequestMapping("/AdminLogin")
    @ResponseBody
    public String AdminLogin(Admin admin, HttpSession session)
    {
        if( ( admin=loginService.AdminLogin(admin.getAdmin(),admin.getPassword()) )!= null)
        {
            session.setAttribute("admin",admin);
            return "true";
        }
        else
        {
            return "false";
        }
    }

    //管理员登录成功后跳转/跳转到后台首页
    @AdminCheck()
    @RequestMapping("/ToAdminIndex")
    public String AdminLoginSucess()
    {
        return "manager/index";
    }

}
