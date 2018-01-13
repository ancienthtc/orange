package com.jd.orange.service;

import com.jd.orange.model.Cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface CartService {

    List<Cart> getCartList(Integer uid);

    int AddCart(Cart cart);

    int CartItemDel(Integer cid);

    int CartClear(Integer uid);

    Map<String,Object> getCal(List<HashMap> carts);

    Map<String,Object> cartDel(List<HashMap> carts);

    List<Map<String,Object>> itemDetail(List<HashMap> carts);

    List<Map<String,Object>> itemDetail(Integer fid,Double amount,String detail);

    void UserCartRefresh(Integer uid);

    //cart
    Map<String,Double> CalculatePrice( List<Map<String, Object>> list );

    //order
    Map<String,Double> CalculatePrice2( List<HashMap> list );
}
