package com.jd.orange.service.servciceImpl;

import com.github.pagehelper.PageHelper;
import com.jd.orange.dao.PartMapper;
import com.jd.orange.model.Part;
import com.jd.orange.service.PartService;
import com.jd.orange.util.pagehelper.BeanUtil;
import com.jd.orange.util.pagehelper.PagedResult;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PartServiceImpl implements PartService {

    @Resource
    private PartMapper partMapper;

    @Override
    public List<Part> getFatherPart() {
        return partMapper.getFatherParts();
    }

    @Override
    public List<Part> getChildPart(Integer fpid) {
        return partMapper.getChildPart(fpid);
    }

    @Override
    public PagedResult<Part> getParts(Integer pageNo, Integer pageSize,String key) {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);
        return BeanUtil.toPagedResult( partMapper.partsList(key) );
    }

    @Override
    public int PartAdd(Part part) {
        //处理part

        return partMapper.insertSelective(part);
    }

    @Override
    public int PartAlter(Part part) {
        return 0;
    }

}
