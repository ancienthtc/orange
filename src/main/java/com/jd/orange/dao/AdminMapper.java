package com.jd.orange.dao;

import com.jd.orange.model.Admin;
import com.jd.orange.model.advanced.CountInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin adminLogin(@Param("admin") String admin, @Param("password")String password);

    List<Admin> getAdminListByLevel(@Param("key") String key,@Param("start") String start,@Param("end") String end ,@Param("level") Integer level);

    Integer adminCheck(@Param("admin") String admin);

    CountInfo goodsCal();

    CountInfo formatCal();

    CountInfo orderCal();


}