package com.jd.orange.service;

import com.jd.orange.model.Part;
import com.jd.orange.util.pagehelper.PagedResult;

import java.util.List;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface PartService {

    //获取所有父分类
    List<Part> getFatherPart();

    //获取子分类
    List<Part> getChildPart(Integer fpid);

    //获取所有分类(分页)
    PagedResult<Part> getParts(Integer pageNo, Integer pageSize,String key);

    //分类创建
    int PartAdd(Part part);

    //分类修改
    int PartAlter(Part part);

    int PartDel(Integer pid);

}
