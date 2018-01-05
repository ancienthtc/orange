package com.jd.orange.service;

import com.jd.orange.model.Cart;

import java.util.List;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface CartService {

    List<Cart> getCartList(Integer uid);

    int AddCart(Cart cart);

}
