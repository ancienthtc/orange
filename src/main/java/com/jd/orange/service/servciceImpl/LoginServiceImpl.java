package com.jd.orange.service.servciceImpl;

import com.jd.orange.model.Admin;
import com.jd.orange.model.User;
import com.jd.orange.service.LoginService;
import org.springframework.stereotype.Service;

/**
 * Created by ThinkPad on 2017/11/28.
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Override
    public User UserLogin(String nickname, String email, String tel, String password) {
        return null;
    }

    @Override
    public Admin AdminLogin(String admin, String password) {
        return null;
    }


}
