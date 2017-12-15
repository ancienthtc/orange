package com.jd.orange.dao;

import com.jd.orange.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int userAmoumt();

    List<User> getUserList(@Param("key") String keys, @Param("sc") String start_c,@Param("ec") String end_c,@Param("su") String start_u,@Param("eu") String end_u);
    //@Param("sc") String start_c,@Param("ec") String end_c,@Param("su") String start_u,@Param("eu") String end_u
}