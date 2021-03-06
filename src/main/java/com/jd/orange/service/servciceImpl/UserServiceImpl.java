package com.jd.orange.service.servciceImpl;

import com.github.pagehelper.PageHelper;
import com.jd.orange.dao.OrderMapper;
import com.jd.orange.dao.UserMapper;
import com.jd.orange.model.User;
import com.jd.orange.service.UserService;
import com.jd.orange.util.date.DateExample;
import com.jd.orange.util.pagehelper.BeanUtil;
import com.jd.orange.util.pagehelper.PagedResult;
import com.jd.orange.util.password.Secret;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{

    @Resource
    private UserMapper userMapper;

    @Resource
    private OrderMapper orderMapper;

    @Override
    public int register(User user) {
        return 0;
    }

    @Override
    public PagedResult<User> getUsers(Integer pageNo, Integer pageSize, String keys,String start_c,String end_c,String start_u,String end_u) {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);
        if(start_c!=null && end_c!=null)
        {
            if(DateExample.CompareDate(start_c,end_c)==1)
            {
                String s=end_c;
                end_c=start_c;
                start_c=s;
            }
        }
        if(start_u!=null && end_u!=null)
        {
            if(DateExample.CompareDate(start_u,end_u)==1)
            {
                String s=end_u;
                end_u=start_u;
                start_u=s;
            }
        }
        return BeanUtil.toPagedResult( userMapper.getUserList(keys,start_c,end_c,start_u,end_u) );
    }

    @Override
    public List<User> getUsers(String keys, String start_c, String end_c, String start_u, String end_u) {
        if(start_c!=null && end_c!=null)
        {
            if(DateExample.CompareDate(start_c,end_c)==1)
            {
                String s=end_c;
                end_c=start_c;
                start_c=s;
            }
        }
        if(start_u!=null && end_u!=null)
        {
            if(DateExample.CompareDate(start_u,end_u)==1)
            {
                String s=end_u;
                end_u=start_u;
                start_u=s;
            }
        }
        return  userMapper.getUserList(keys,start_c,end_c,start_u,end_u) ;
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

    @Override
    public User getUser(Integer uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

    @Override
    public User getUserByTel(String tel) {
        User user;
        try {
            user = userMapper.selectUserByTel(tel);
        }catch (Exception e)
        {
            return null;
        }
        return user;

    }

    @Override
    public int UserInfoUpdate(User user) {
        if(user.getEmail()=="")
        {
            user.setEmail(null);
        }
        if(user.getRealname()=="")
        {
            user.setRealname(null);
        }
        if(user.getPhone()=="")
        {
            user.setPhone(null);
        }
        if(user.getGender() != "男" || user.getGender() != "女" )
        {
            user.setGender(null);
        }
        user.setUpdatetime(DateExample.getNowTimeByDate());
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public Map<String, Integer> getUserOrderCount(Integer uid) {

        return orderMapper.getUserOrderCount(uid);
    }

    @Override
    public Map<String, Object> alterPass(Integer uid, String oldPass, String newPass) {
        User user = userMapper.selectByPrimaryKey(uid);
        Map<String,Object> m = new HashMap<String, Object>();
        if ( Secret.enPass(oldPass).equals(user.getPassword()) )
        {
            user.setPassword( Secret.enPass(newPass) );
            if ( userMapper.updateByPrimaryKeySelective(user) > 0 )
            {
                m.put("status",0);
                m.put("msg","旧密码错误");
            }
            else {
                m.put("status",2);
                m.put("msg","修改失败");
            }
        }
        else
        {
            m.put("status",3);
            m.put("msg","旧密码错误");
        }
        return m;
    }

    @Override
    public int resetPass(Integer uid, String pass) {
        User user = userMapper.selectByPrimaryKey(uid);
        if(user == null)
        {
            return 0;
        }
        user.setPassword(Secret.enPass(pass));
        return userMapper.updateByPrimaryKeySelective(user);
    }

}
