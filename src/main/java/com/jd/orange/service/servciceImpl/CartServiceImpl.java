package com.jd.orange.service.servciceImpl;

import com.jd.orange.common.LogAnnotation;
import com.jd.orange.dao.CartMapper;
import com.jd.orange.dao.FormatMapper;
import com.jd.orange.model.Cart;
import com.jd.orange.model.Format;
import com.jd.orange.service.CartService;
import com.jd.orange.util.date.DateExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class CartServiceImpl implements CartService{

    @Resource
    private CartMapper cartMapper;

    @Resource
    private FormatMapper formatMapper;

    @Override
    public List<Cart> getCartList(Integer uid) {
        //更新CartItem

        return cartMapper.getUserCart(uid);
    }

    @Override
    public int AddCart(Cart cart) {
        Format format=formatMapper.selectByPrimaryKey(cart.getFormat());
        if(format==null)//规格不存在
        {
            return 0;
        }
        if( cartMapper.getUserCartItemCount(cart.getUser()) >= 99 ) //购物车上限
        {
            return 0;
        }

        //已存在相同的在购物车中 规格，用户(如果价格变动,更新价格)
        Cart oldCart=cartMapper.getOldCartItem(cart.getUser(),format.getId());
        if(oldCart!=null)//已存在
        {
            oldCart.setAmount( oldCart.getAmount() + cart.getAmount() );//数量叠加
            if(format.getPrice()!=oldCart.getPrice())//价格变动后
            {
                oldCart.setPrice(format.getPrice());
            }
            oldCart.setAll(oldCart.getAmount()*oldCart.getPrice());
            oldCart.setDetail(cart.getDetail());//更新留言
            return cartMapper.updateByPrimaryKeySelective(oldCart);
        }
        else//不存在
        {
            cart.setPrice(format.getPrice());
            cart.setAll( cart.getAmount()*cart.getPrice() );
            cart.setCreatetime(DateExample.getNowTimeByDate());
            return cartMapper.insertSelective(cart);
        }
    }

    @Override
    public int CartItemDel(Integer cid) {
        return cartMapper.deleteByPrimaryKey(cid);
    }

    @Override
    public int CartClear(Integer uid) {
        return cartMapper.clearCartByUser(uid);
    }

    @Override
    public Map<String, Object> getCal(List<HashMap> carts) {
        Double cost=0.0;
        Cart cart;
        Map<String,Object> map=new HashMap<String, Object>();
        try {
            for(HashMap<String,Object> m:carts)
            {
                cart=cartMapper.selectByPrimaryKey( Integer.valueOf(m.get("id").toString()) );
                cost+=cart.getAll();
            }
            map.put("all",cost);
            map.put("msg","success");
            return map;
        }catch (Exception e)
        {
            map.put("all",cost);
            map.put("msg","exception");
            return map;
        }
    }

    @Override
    public Map<String, Object> cartDel(List<HashMap> carts) {
        List<Integer> ids=new ArrayList<Integer>();
        Map<String,Object> map=new HashMap<String, Object>();
        for(HashMap<String,Object> m:carts)
        {
            ids.add( Integer.valueOf(m.get("id").toString()) );
        }
        int i=cartMapper.delCartItems(ids);
        if(carts.size() ==  i)
        {
            map.put("msg","success");
        }
        else if( carts.size() > i && i>0 )
        {
            map.put("msg","some");
        }
        else if(i==0)
        {
            map.put("msg","error");
        }
        else
        {
            map.put("msg","");
        }
        return map;
    }

    @Override
    public List<Map<String, Object>> itemDetail(List<HashMap> carts) {
        List<Integer> ids=new ArrayList<Integer>();
        for(HashMap<String,Object> m:carts)
        {
            ids.add( Integer.valueOf(m.get("id").toString()) );
        }
        List<Map<String,Object>> result=cartMapper.getCommitItems(ids);
        //过滤pic1地址
        for(Map<String,Object> m:result)
        {
            if(m.get("pic1")==null)
            {
                continue;
            }
            m.put("pic1",m.get("pic1").toString().substring( m.get("pic1").toString().lastIndexOf("\\")+1 )  );
        }
        return result;
    }

    @Override
    public List<Map<String, Object>> itemDetail(Integer fid, Double amount, String detail) {
        List<Map<String, Object>> result=new ArrayList<Map<String, Object>>();
        //cid,amount,all,detail,fid,fname,fclass,price,gid,gname,freight,pic1
        Map<String,Object> map=new HashMap<String, Object>();
        //fid,fname,fclass,price,gid,gname,freight,pic1
        Format format=formatMapper.formatDetail(fid);
        map.put("cid",null);
        map.put("amount",amount);
        map.put("all",format.getPrice()*amount);
        map.put("detail",detail);
        map.put("fid",fid);
        map.put("fname",format.getFname());
        map.put("fclass",format.getFclass());
        map.put("price",format.getPrice());
        map.put("gid",format.getGoods());
        map.put("gname",format.getGname());
        map.put("freight",format.getFreight());
        if(format.getPic1()==null)
        {
            map.put("pic1",null );
        }
        else
        {
            map.put("pic1",format.getPic1().substring( format.getPic1().lastIndexOf("\\")+1 ) );
        }

        result.add(map);
        return result;
    }

    //Cart更新
    @LogAnnotation
    @Override
    public void UserCartRefresh(Integer uid)
    {
        List<Cart> oldCarts=cartMapper.getUserCart(uid);
        for(Cart cart:oldCarts)
        {
            Integer fid=cart.getFormat();
            Format format=formatMapper.selectByPrimaryKey(fid);
            if( cart.getPrice() != format.getPrice() )
            {
                cart.setPrice(format.getPrice());
                cart.setAll(format.getPrice() * cart.getAmount() );
                cartMapper.updateByPrimaryKeySelective(cart);
            }
        }
    }

    //计算价格(参照上面的list方法)
    @Override
    public Map<String, Double> CalculatePrice(List<Map<String, Object>> list) {
        Map<String, Double> map=new HashMap<String, Double>();
        Double allprice=0.0;
        Double otherprcie=0.0;
        Iterator it = list.iterator();
        while (it.hasNext())
        {
            Map<String,Object> m=(Map<String,Object>) it.next();
            allprice += Double.valueOf( m.get("all").toString() )  ;
            otherprcie += Double.valueOf( m.get("freight").toString() );
        }
        map.put("AP",allprice);
        map.put("OP",otherprcie);
        return map;
    }

    @Override
    public Map<String, Double> CalculatePrice2(List<HashMap> list) {
        Map<String, Double> map=new HashMap<String, Double>();
        Double allprice=0.0;
        Double otherprcie=0.0;
        Iterator it = list.iterator();
        while (it.hasNext())
        {
            Map<String,Object> m=(Map<String,Object>) it.next();
            Format format = formatMapper.formatDetail( Integer.valueOf(m.get("fid").toString()) );
            Double amount = Double.valueOf(m.get("amount").toString());
            allprice += amount*format.getPrice();
            otherprcie += format.getFreight();
        }
        map.put("AP",allprice);
        map.put("OP",otherprcie);
        return map;
    }

}
