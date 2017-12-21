package com.jd.orange.dao;

import com.jd.orange.model.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Repository
public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

    int getGoodsCount();

    List<Goods> getGoodsList(@Param("key") String key, @Param("start") String start, @Param("end") String end);

    int dropGoodsPic(Goods record);

    //shelf 也是updatetime
    int goodsstatus(@Param("id")Integer id,@Param("status")Integer status,@Param("date")Timestamp shelf);
}