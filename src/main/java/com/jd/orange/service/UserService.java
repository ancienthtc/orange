package com.jd.orange.service;

import com.jd.orange.model.User;
import com.jd.orange.util.pagehelper.PagedResult;

import java.util.List;
import java.util.Map;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface UserService {

    //用户列表
    PagedResult<User> getUsers(Integer pageNo, Integer pageSize, String keys,String start_c,String end_c,String start_u,String end_u);

    //更新个人信息
    int UserUpdate(User user);

    //用户注册
    int register(User user);

    //用户注销
    int UserOff(Integer uid);

    //用户统计
    int getUserAmount();

    List<User> getUsers(String keys, String start_c, String end_c, String start_u, String end_u);

    User getUser(Integer uid);

    int UserInfoUpdate(User user);

    Map<String,Integer> getUserOrderCount(Integer uid);

    Map<String,Object> alterPass(Integer uid , String oldPass ,String newPass);
}
