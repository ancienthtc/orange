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

    List<Goods> selectGoodsWithFormatsByPart(@Param("pid") Integer pid);

    List<Goods> selectGoodsWithFormatsByPartAdvance(@Param("pid") Integer pid); //(进阶) 获取一个大分类下全部商品(包含一个规格)

    Goods selectGoodsWithFormatById(@Param("id") Integer id);

    //推荐商品个数
    int getReommendCount();

    //推荐商品
    List<Goods> getRecommendGoods();

    //热销
    List<Goods> getHotSales(@Param("limit") Integer limit);

    //新商品
    List<Goods> getNewGoods(@Param("limit") Integer limit);

    List<Goods> goodsSearch(String[] key);

    //按默认排序
    List<Goods> OrderByDefault();

    //按最新排序
    List<Goods> OrderByNew();

    //按价格最低排序
    List<Goods> OrderByLowPrice();

    //按销量最高排
    List<Goods> OrderByHighSales();
}