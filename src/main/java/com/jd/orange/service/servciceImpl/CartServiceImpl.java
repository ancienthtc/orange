package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.CartMapper;
import com.jd.orange.dao.FormatMapper;
import com.jd.orange.model.Cart;
import com.jd.orange.model.Format;
import com.jd.orange.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CartServiceImpl implements CartService{

    @Resource
    private CartMapper cartMapper;

    @Resource
    private FormatMapper formatMapper;

    @Override
    public List<Cart> getCartList(Integer uid) {
        return cartMapper.getUserCart(uid);
    }

    @Override
    public int AddCart(Cart cart) {
        Format format=formatMapper.selectByPrimaryKey(cart.getFormat());
        if(format==null)
        {
            return 0;
        }
        cart.setPrice(format.getPrice());
        cart.setAll( cart.getAmount()*cart.getPrice() );
        return cartMapper.insertSelective(cart);
    }
}
