package com.jd.orange.dao;

import com.jd.orange.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
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

    User userLogin(@Param("name") String name,@Param("pass")String password);

    int updateLoginTime(@Param("id") Integer id,@Param("time") Timestamp time);

    List<User> getUserList(@Param("key") String keys, @Param("sc") String start_c,@Param("ec") String end_c,@Param("su") String start_u,@Param("eu") String end_u);
    //@Param("sc") String start_c,@Param("ec") String end_c,@Param("su") String start_u,@Param("eu") String end_u
    Integer checkTel(String tel);
}