package com.jd.orange.service.servciceImpl;

import com.github.pagehelper.PageHelper;
import com.jd.orange.dao.AdminMapper;
import com.jd.orange.model.Admin;
import com.jd.orange.model.advanced.CountInfo;
import com.jd.orange.service.AdminService;
import com.jd.orange.util.date.DateExample;
import com.jd.orange.util.pagehelper.BeanUtil;
import com.jd.orange.util.pagehelper.PagedResult;
import com.jd.orange.util.password.Secret;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public int AdminCount() {
        return 0;
    }

    @Override
    public List<Admin> getAdminListByLevel(int level) {
        return adminMapper.getAdminListByLevel(null,null,null,level);
    }

    @Override
    public PagedResult<Admin> getAdminListByLevel(Integer pageNo, Integer pageSize, String key, String start, String end ,int level) {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);
        return BeanUtil.toPagedResult( adminMapper.getAdminListByLevel(key,start,end,level) );
    }

    @Override
    public Map<String, Number> getHomeCount() {
        return null;
    }

    @Override
    public int AdminAdd(Admin admin) {
        if(admin.getLevel()==null || admin.getLevel() <0)
        {
            return 0;
        }
        if( adminMapper.adminCheck(admin.getAdmin()) != null )  //重复
        {
            return 0;
        }
        admin.setPassword(Secret.enPass(admin.getPassword()) );
        admin.setCreatetime(DateExample.getNowTimeByDate());
        return adminMapper.insertSelective(admin);
    }

    @Override
    public int AdminAlter(Admin admin) {
        System.out.println(admin.getPassword());
        if(admin.getPassword() != null && !admin.getPassword().equals("null") )
        {
            admin.setPassword( Secret.enPass(admin.getPassword()) );
        }
        admin.setUpdatetime(DateExample.getNowTimeByDate());
        return adminMapper.updateByPrimaryKeySelective(admin);
    }

    @Override
    public int AdminPassAlter(Integer id, String oldp, String newp) {
        Admin admin = adminMapper.selectByPrimaryKey(id);
        if( Secret.enPass(oldp).equals(admin.getPassword())  )
        {
            admin.setPassword( Secret.enPass(newp) );
            admin.setUpdatetime(DateExample.getNowTimeByDate());
            return adminMapper.updateByPrimaryKeySelective(admin);
        }
        else
        {
            return 0;
        }
    }

    @Override
    public int AdminDel(Integer aid) {
        return adminMapper.deleteByPrimaryKey(aid);
    }

    @Override
    public Admin getAdmin(String admin, String pass) {
        return adminMapper.adminLogin(admin,pass);
    }

    @Override
    public Admin getAdmin(Integer id) {
        Admin admin = adminMapper.selectByPrimaryKey(id);
        admin.setPassword( Secret.dePass(admin.getPassword()) );
        return admin;
    }

    @Override
    public boolean GuideDel(String absolutePath) {
        File file = new File(absolutePath);
        if (file.exists()){
            return file.delete();
        }else{
            return false;
        }
    }

    @Override
    public CountInfo getCal() {
        CountInfo info ;
        info = adminMapper.goodsCal();
        info.add( adminMapper.formatCal() );
        info.add( adminMapper.orderCal() );
        System.out.println(info.toString() );
        return info;
    }
}
