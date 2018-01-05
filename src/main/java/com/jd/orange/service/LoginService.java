package com.jd.orange.service;

import com.jd.orange.model.Admin;
import com.jd.orange.model.User;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface LoginService {

    User UserLogin(String name,String password);


    Admin AdminLogin(String admin,String password);

    int userRegister(User user);

}
