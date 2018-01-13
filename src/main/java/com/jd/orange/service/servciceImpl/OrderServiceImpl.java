package com.jd.orange.service.servciceImpl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.jd.orange.dao.*;
import com.jd.orange.model.*;
import com.jd.orange.service.CartService;
import com.jd.orange.service.ImageService;
import com.jd.orange.service.OrderService;
import com.jd.orange.util.Folder;
import com.jd.orange.util.PictureType;
import com.jd.orange.util.StringUtil.GenerateString;
import com.jd.orange.util.date.DateExample;
import com.jd.orange.util.pagehelper.BeanUtil;
import com.jd.orange.util.pagehelper.PagedResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService{

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private OrderDetailMapper orderDetailMapper;

    @Resource
    private AddressMapper addressMapper;

    @Resource
    private FormatMapper formatMapper;

    @Resource
    private CartService cartService;

    @Resource
    private UserMapper userMapper;

    @Resource
    private ImageService imageService;

    @Override
    public int orderAmount() {
        return orderMapper.orderAmount();
    }

    @Override
    public Map<String, Integer> getOrderCount(Integer way) {
        return orderMapper.countOrderStatus(way);
    }

    @Override
    public List<Order> getOrderListByStatus(Integer orderStatus,Integer shopStatus,Integer way) {
        return orderMapper.selectOrderByOrderStatus(orderStatus,shopStatus,way);
    }

    @Override
    public PagedResult<Order> getOrderListByStatus(Integer pageNo, Integer pageSize, String key, String start, String end,
                                                   Integer orderStatus, Integer shopStatus ,Integer way) {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);

        return BeanUtil.toPagedResult(orderMapper.selectOrderByOrderStatusWithPage(key,start,end,orderStatus,shopStatus,way));
    }

    @Override
    public Order getOrderDetail(String sequence) {
        return orderMapper.selectOrderWithDetail(sequence);
    }


    //订单检查
    public boolean OrderCheckAddress(Address address)
    {
        if(address.getDetail()==null || address.getRecipient()==null || (address.getTel()==null && address.getPhone()==null ) )
        {
            return false;
        }
        return true;
    }



    @Override
    @Transactional
    public Map<String, Object> create(String json,User user,String ServerPath) {
        //定义变量
        Map<String, Object> m = new HashMap<String, Object>();
        Order order=new Order();
        //参数获取
        //解析json
        JSONObject object = JSON.parseObject(json);
        JSONArray jsonArray = object.getJSONArray("goods");
        List<HashMap> goodslist = JSON.parseArray(jsonArray.toJSONString(), HashMap.class);

        //外部参数
        Integer aid = object.getInteger("aid");
        Integer buyway = object.getInteger("buyway");
        Integer cost = object.getInteger("cost");
        Map<String,Double> prices = cartService.CalculatePrice2(goodslist);
        Double AP=prices.get("AP");
        Double OP=prices.get("OP");
        Address address=addressMapper.selectByPrimaryKey(aid);//aid(存在地址)

        try {
            //1.检查必要参数 fid,amount(stock),aid(存在地址)
            if (!OrderCheckAddress(address)) {
                m.put("order", null);
                m.put("msg", "存在错误参数");
                m.put("status", 2);
                //return m;
                throw new Exception();
            }
            //2.积分扣除
            if (cost == 1) {
                if (user.getScore() > 100) //可以抵扣
                {
                    if (user.getScore() > AP * 0.05 * 100)   //最大抵扣
                    {
                        user.setScore(user.getScore() - new Double(AP * 0.05 * 100).intValue());
                        order.setScorecost(AP * 0.05 * 100);
                    } else {   //全部抵扣
                        order.setScorecost((double) user.getScore());
                        user.setScore(0);
                    }
                    userMapper.updateByPrimaryKeySelective(user);
                } else {
                    m.put("order", null);
                    m.put("msg", "积分错误");
                    m.put("status", 3);
                    throw new Exception();
                }
            } else   //cost==0
            {
                order.setScorecost(0.0);
            }

            //3.创建订单
            order.setSequence(new GenerateString().getOrderid());
            order.setBuyway(buyway);
            order.setShopstatus(0);
            order.setOrderstatus(0);
            order.setGoodsprice(AP);
            order.setFreight(0.0);
            order.setOtherprice(OP);
            order.setAllprice(AP + OP);
            //目前没有省份/城市等
            order.setAddress(address.getDetail() + " / " + address.getZip());
            order.setRecipient(address.getRecipient());
            order.setContact(address.getTel() + " / " + address.getPhone());
            order.setCreatetime(DateExample.getNowTimeByDate());
            order.setUser(user.getId());//用户
            int i = orderMapper.insertSelective(order);
            if (i == 0) {
                m.put("order", null);
                m.put("msg", "订单创建异常");
                m.put("status", 4);
                throw new Exception();
            }

            for (HashMap<String, Object> item : goodslist) {
                OrderDetail orderDetail = new OrderDetail();
                if (order.getId() == null) {
                    m.put("order", null);
                    m.put("msg", "订单创建异常");
                    m.put("status", 5);
                    throw new Exception();
                }
                orderDetail.setOrder(order.getId());//关联
                //4.获取商品，规格信息
                Integer fid = Integer.valueOf(item.get("fid").toString());
                Format format = formatMapper.formatDetail(fid);
                //5.购物车
                String cid = item.get("cid").toString();
                if (cid != null) {
                    if (cartService.CartItemDel(Integer.valueOf(cid)) == 0) {
                        m.put("order", null);
                        m.put("msg", "购物车删除失败");
                        m.put("status", 6);
                        throw new Exception();
                    }
                }
                //6.goodslist验证


                //7.设置
                orderDetail.setGoodsname(format.getGname());
                orderDetail.setFormat(format.getFname());
                orderDetail.setAmount(Double.valueOf(item.get("amount").toString()));
                orderDetail.setPrice(format.getPrice());
                orderDetail.setFclass(format.getFclass());
                orderDetail.setMessage(item.get("detail").toString());

                if(item.get("pic1")==null)
                {
                    //商品图片转存订单图片
                    Picture picture = imageService.ImageCopy(item.get("pic1").toString(), ServerPath, Folder.Order, PictureType.Order);
                    if (picture != null) {
                        orderDetail.setPicture(picture.getId());
                    }
                }



                int j = orderDetailMapper.insertSelective(orderDetail);
                if (j == 0) {
                    m.put("order", null);
                    m.put("msg", "详情创建异常");
                    m.put("status", 7);
                    throw new Exception();
                }
            }
        }catch (Exception e)
        {
            return m;
        }
        m.put("order",order);
        m.put("msg","创建成功");
        m.put("status",0);
        return m;
    }


}
