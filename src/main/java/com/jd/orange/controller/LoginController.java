package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.jd.orange.common.AdminCheck;
import com.jd.orange.common.Alevel;
import com.jd.orange.common.UserCheck;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

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

    @AdminCheck(Alevel.L1)
    @RequestMapping("/AdminSignOut")
    public String AdminSignOut(HttpSession session)
    {
        session.removeAttribute("admin");
        return "redirect:login/AdminSignIn";
    }

    //管理员登录成功后跳转/跳转到后台首页
    @AdminCheck(Alevel.L1)
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
    @RequestMapping(value = "/register" , produces = "text/html;charset=UTF-8;")
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

    //手机验证码(注册)
    @RequestMapping(value = "/sendCode" , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String send(HttpSession session,String phone)
    {
        Map<String, Object> m = loginService.checkRepeat(phone) ;
        if( Integer.valueOf(m.get("status").toString()) != 0 )
        {
            return "{\"Statu\":2,\"Msg\":\"手机号已存在\"}";
        }


        String result;
        //String code=(String)session.getAttribute("textcode");

//        if(code==null)
//        {
//            session.setAttribute("textcode",new GenerateString().getRandomString(4));
//            result= Juhe.sendCode_register(phone,(String)session.getAttribute("textcode"));
//        }

        session.setAttribute("textcode",new GenerateString().getRandomString_Num(4));
        session.setMaxInactiveInterval(15 * 60);//session 15分钟时长
        result= Juhe.sendCode_register(phone,(String)session.getAttribute("textcode"));


        if( Integer.valueOf(result) == 0 )
        {
            return "{\"Statu\":0,\"Msg\":\"发送成功\"}";
        }
        else
        {
            return "{\"Statu\":1,\"Msg\":\"发送失败\"}";
        }
    }

    //检查手机号是否合法
    @RequestMapping(value = "/checkPhone" , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String check(String phone)
    {
        return JSON.toJSONString(loginService.checkRepeat(phone));
    }

    //登录
    @RequestMapping(value = "/UserLogin" , produces = "text/html;charset=UTF-8;")
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

    //找回密码
    @RequestMapping(value = "/forgetSend", produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String ForgetPassCheck(HttpSession session,@RequestParam String phone)
    {
        Map<String, Object> m = loginService.checkRepeat(phone) ;
        if( Integer.valueOf(m.get("status").toString()) == 0 )
        {
            return "{\"Statu\":2,\"Msg\":\"手机号不存在\"}";
        }
        else
        {
            if( session.getAttribute("numcode")!=null && session.getAttribute("tel")!=null )
            {
                return "{\"Statu\":1,\"Msg\":\"请勿重复发送\"}";
            }

            String result;
            session.setAttribute("numcode",new GenerateString().getRandomString_Num(4));
            session.setAttribute("tel",phone);
            session.setMaxInactiveInterval(5 * 60);//session 5分钟时长
            result= Juhe.sendCode_forget(phone,(String)session.getAttribute("numcode"));
            if( Integer.valueOf(result) == 0 )
            {
                return "{\"Statu\":0,\"Msg\":\"发送成功\"}";
            }
            else
            {
                return "{\"Statu\":1,\"Msg\":\"发送失败\"}";
            }
        }
    }

    //提交验证码(忘记密码)
    @RequestMapping(value = "/subForget", method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String submitCode(HttpSession session, @RequestParam String tel,@RequestParam String code)
    {
        String s_tel = (String) session.getAttribute("tel");
        String s_num = (String) session.getAttribute("numcode");

        if( s_tel.equals(tel) && s_num.equals(code) )
        {
            session.removeAttribute("tel");
            session.removeAttribute("numcode");
            return "{\"Statu\":0,\"Msg\":\"验证成功\"}";
        }
        return "{\"Statu\":1,\"Msg\":\"验证失败\"}";
    }


    @UserCheck
    @RequestMapping("/UserSignOut")
    public String UserSignOut(HttpSession session)
    {
        session.removeAttribute("user");
        return "redirect:/user/toShopIndex";
    }

}
