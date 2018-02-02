package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.AdminMapper;
import com.jd.orange.dao.UserMapper;
import com.jd.orange.model.Admin;
import com.jd.orange.model.User;
import com.jd.orange.service.LoginService;
import com.jd.orange.util.StringUtil.GenerateString;
import com.jd.orange.util.date.DateExample;
import com.jd.orange.util.password.Secret;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ThinkPad on 2017/11/28.
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    private AdminMapper adminMapper;

    @Resource
    private UserMapper userMapper;

    @Override
    public User UserLogin(String name , String password) {
        User user=userMapper.userLogin(name,password);
        if(user!=null)
        {
            //user.setLogintime(DateExample.getNowTimeByDate());
            userMapper.updateLoginTime(user.getId(),DateExample.getLocalTimeFormat());
            return user;
        }
        return null;
    }

    @Override
    public Admin AdminLogin(String aname, String password) {
        Admin admin=adminMapper.adminLogin(aname, Secret.enPass(password));
        if(admin!=null)
        {
            admin.setAlogin( DateExample.getNowTimeByDate() );

            adminMapper.updateByPrimaryKeySelective(admin);
        }
        return admin;
    }

    @Override
    public int userRegister(User user) {
        user.setNickname( "新用户"+String.valueOf(DateExample.getTimestamp() ).substring(0,10)+new GenerateString().getRandomString(4) );
        user.setNicknameJ("新しいユーザー"+String.valueOf(DateExample.getTimestamp() ).substring(0,10)+new GenerateString().getRandomString(4));
        user.setCreatetime(DateExample.getNowTimeByDate());
        user.setPassword( Secret.enPass(user.getPassword()) );
        return userMapper.insertSelective(user);
    }

    @Override
    public Map<String, Object> checkRepeat(String phone) {
        Map<String, Object> m = new HashMap<String, Object>();
        if( userMapper.checkTel(phone) == null )
        {
            m.put("msg","可以注册");//手机号不存在
            m.put("status",0);
        }
        else
        {
            m.put("msg","手机号已被注册");
            m.put("status",1);
        }
        return m;
    }



}
