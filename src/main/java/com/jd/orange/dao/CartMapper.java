package com.jd.orange.dao;

import com.jd.orange.model.Cart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    List<Cart> getUserCart(Integer id);

    Cart getOldCartItem(@Param("uid") Integer uid,@Param("format") Integer format);

    //int delCartByUser(@Param("uid") Integer uid,@Param("cid") Integer cid);

    int clearCartByUser(@Param("uid") Integer uid);

    int delCartItems(List<Integer> ids);

    //int test(List<Integer> ids);

    List<Map<String,Object>> getCommitItems(List<Integer> cid);

    int getUserCartItemCount(Integer uid);
}