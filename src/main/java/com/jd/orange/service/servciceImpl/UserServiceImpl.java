package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.UserMapper;
import com.jd.orange.model.User;
import com.jd.orange.service.UserService;
import com.jd.orange.util.pagehelper.PagedResult;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService{

    @Resource
    private UserMapper userMapper;

    @Override
    public int register(User user) {
        return 0;
    }

    @Override
    public PagedResult<User> getUsers(Integer pageNo, Integer pageSize) {
        return null;
    }

    @Override
    public int UserUpdate(User user) {
        return 0;
    }

    @Override
    public int UserOff(Integer uid) {
        return 0;
    }

    @Override
    public int getUserAmount() {
        return userMapper.userAmoumt();
    }
}
