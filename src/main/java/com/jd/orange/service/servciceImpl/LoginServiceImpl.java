package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.AdminMapper;
import com.jd.orange.model.Admin;
import com.jd.orange.model.User;
import com.jd.orange.service.LoginService;
import com.jd.orange.util.date.DateExample;
import com.jd.orange.util.password.Secret;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by ThinkPad on 2017/11/28.
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public User UserLogin(String nickname, String email, String tel, String password) {
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


}
