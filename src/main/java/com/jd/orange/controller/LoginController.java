package com.jd.orange.controller;

import com.jd.orange.common.AdminCheck;
import com.jd.orange.model.Admin;
import com.jd.orange.model.User;
import com.jd.orange.service.LoginService;
import com.jd.orange.util.StringUtil.GenerateString;
import com.jd.orange.util.api.Juhe;
import com.jd.orange.util.password.Secret;
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


    //进入用户登录
    @RequestMapping("/login")
    public String toUserSignIn()
    {
        return "user/denglu";
    }

    //进入用户注册
    @RequestMapping("/toRegister")
    public String toUserSignUp()
    {
        return "user/zuce";
    }

    //注册
    @RequestMapping("/register")
    @ResponseBody
    public String register(HttpSession session,User user)
    {
        //log.info(user.getPassword()+" "+user.getCheckcode());
        String code=(String)session.getAttribute("textcode");
        if(user.getCheckcode().equalsIgnoreCase(code) )
        {
            session.removeAttribute("textcode");
            if( !(loginService.userRegister(user) > 0) )
            {
                return "false";
            }

            return "true";
        }
        else
        {
            session.removeAttribute("textcode");
            return "false";
        }

    }

    //手机验证码
    @RequestMapping("/sendCode")
    @ResponseBody
    public String send(HttpSession session,String phone)
    {
        String result="";
        //String code=(String)session.getAttribute("textcode");

//        if(code==null)
//        {
//            session.setAttribute("textcode",new GenerateString().getRandomString(4));
//            result= Juhe.sendCode(phone,(String)session.getAttribute("textcode"));
//        }

        session.setAttribute("textcode",new GenerateString().getRandomString(4));
        result= Juhe.sendCode(phone,(String)session.getAttribute("textcode"));


        if( Integer.valueOf(result) == 0 )
        {
            return "{\"Statu\":1,\"Msg\":\"成功\"}";
        }
        else
        {
            return "{\"Statu\":0,\"Msg\":\"失败\"}";
        }
    }

    //检查手机号是否合法
    @RequestMapping("/checkPhone")
    @ResponseBody
    public String check(String phone)
    {
        if(phone.length()==11)
            return "true";
        else
            return "false";
    }

    //登录
    @RequestMapping("/UserLogin")
    @ResponseBody
    public String UserLogin(String name,String password, HttpSession session)
    {
        User user=loginService.UserLogin(name, Secret.enPass(password) );
        if(user!=null)
        {
            session.setAttribute("user",user);
            return "true";
        }
        return "false";
    }

}
