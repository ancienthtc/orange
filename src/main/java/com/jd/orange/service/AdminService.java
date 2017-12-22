package com.jd.orange.service;

import com.jd.orange.model.Admin;
import com.jd.orange.util.pagehelper.PagedResult;

import java.util.List;
import java.util.Map;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface AdminService {

    int AdminCount();

    List<Admin> getAdminListByLevel(int level);

    PagedResult<Admin> getAdminListByLevel(Integer pageNo, Integer pageSize, String key, String start , String end , int level);

    Map<String,Number> getHomeCount();
}
