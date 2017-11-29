package com.jd.orange.service;

import com.jd.orange.model.User;
import com.jd.orange.util.pagehelper.PagedResult;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface UserService {

    //用户列表
    PagedResult<User> getUsers(Integer pageNo, Integer pageSize);

    //更新个人信息
    int UserUpdate(User user);

    //用户注册
    int register(User user);

    //用户注销
    int UserOff(Integer uid);

}
