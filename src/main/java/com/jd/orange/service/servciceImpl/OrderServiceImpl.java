package com.jd.orange.service.servciceImpl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.jd.orange.dao.*;
import com.jd.orange.model.*;
import com.jd.orange.service.*;
import com.jd.orange.util.Folder;
import com.jd.orange.util.PictureType;
import com.jd.orange.util.StringUtil.GenerateString;
import com.jd.orange.util.date.DateExample;
import com.jd.orange.util.pagehelper.BeanUtil;
import com.jd.orange.util.pagehelper.PagedResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.DecimalFormat;
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

    @Resource
    private GoodsService goodsService;


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

    @Override
    public Order getOrder(String sequence) {
        return orderMapper.selectBySequence(sequence);
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


    /*订单创建*/
    @Override
    @Transactional(rollbackFor=Exception.class)
    public Map<String, Object> create(String json,User user,String ServerPath) {
        //定义变量
        Map<String, Object> m = new HashMap<String, Object>();
        Order order=new Order();
        //参数获取
        //解析json
        JSONObject object;
        try {
            object = JSON.parseObject(json);
        }catch (Exception e)
        {
            m.put("order", null);
            m.put("msg", "结算异常");
            m.put("status", 8);
            return m;
        }


        JSONArray jsonArray = object.getJSONArray("goods");
        List<HashMap> goodslist = JSON.parseArray(jsonArray.toJSONString(), HashMap.class);


        try {
            //外部参数
            if(object.get("aid")==null || object.get("aid").toString().equalsIgnoreCase(":null"))
            {
                m.put("order", null);
                m.put("msg", "存在错误参数");
                m.put("status", 2);
                //return m;
                throw new Exception();
            }
            Integer aid = object.getInteger("aid");
            Integer buyway = object.getInteger("buyway");
            Integer cost = object.getInteger("cost");
            Map<String,Double> prices = cartService.CalculatePrice2(goodslist);
            Double AP=prices.get("AP");
            Double OP=prices.get("OP");
            Address address=addressMapper.selectByPrimaryKey(aid);//aid(存在地址)
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
                        order.setScorecost( new Double(new DecimalFormat("#0.0").format(AP * 0.05 * 100)) );
                    } else {   //全部抵扣
                        order.setScorecost( new Double(new DecimalFormat("#0.0").format((double) user.getScore())) );
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
            //Integer orderid = order.getId();
            //订单详情创建
            for (HashMap<String, Object> item : goodslist) {
                OrderDetail orderDetail = new OrderDetail();
                if (order.getId() == null) {    //检查Order
                    m.put("order", null);
                    m.put("msg", "订单创建异常");
                    m.put("status", 5);
                    throw new Exception();
                }
                if( Double.valueOf(item.get("amount").toString()) <= 0 && Double.valueOf(item.get("amount").toString()) > 99 )//验证amount
                {
                    m.put("order", null);
                    m.put("msg", "存在错误参数");
                    m.put("status", 2);
                    throw new Exception();
                }
                orderDetail.setOrder(order.getId());//关联
                //4.获取商品，规格信息
                if(item.get("fid")==null)   //验证fid
                {
                    m.put("order", null);
                    m.put("msg", "存在错误参数");
                    m.put("status", 2);
                    throw new Exception();
                }
                Integer fid = Integer.valueOf(item.get("fid").toString());
                Format format = formatMapper.formatDetail(fid);
                //5.购物车
                Object cid = item.get("cid");//cid
                if (cid != null) {
                    if (cartService.CartItemDel(Integer.valueOf(cid.toString())) == 0) {
                        m.put("order", null);
                        m.put("msg", "购物车删除失败");
                        m.put("status", 6);
                        throw new Exception();
                    }
                }
                //6.设置
                orderDetail.setFid(fid);//format id关联
                orderDetail.setGoodsname(format.getGname());
                orderDetail.setFormat(format.getFname());
                orderDetail.setAmount(Double.valueOf(item.get("amount").toString()));//amount
                orderDetail.setPrice(format.getPrice());
                orderDetail.setFclass(format.getFclass());
                if(item.get("detail") != null)
                {
                    orderDetail.setMessage(item.get("detail").toString());//detail
                }

                if(format.getPic1()!=null)
                {
                    //商品图片转存订单图片
                    Picture picture = imageService.ImageCopy(format.getPic1(), ServerPath, Folder.Order, PictureType.Order);
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
            if(m.get("status")==null)
            {
                m.put("status",2);
            }
            if(m.get("msg")==null)
            {
                m.put("msg","存在错误参数");
            }
            if(m.get("order") == null)
            {
                m.put("order",null);
            }
            return m;
        }
        m.put("order",order);
        m.put("msg","创建成功");
        m.put("status",0);
        return m;
    }


    @Override
    public PagedResult<Order> getUserOrderByStatus(Integer uid, Integer pageNo, Integer pageSize, Integer shopstatus, Integer orderstatus) {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?5:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);
        return BeanUtil.toPagedResult( orderMapper.getUserOrderByStatus(uid,shopstatus,orderstatus) );
    }


    //接单
    @Override
    @Transactional(rollbackFor=Exception.class)
    public Map<String,Object> accept(String sequence , Double freight) {
        Map<String,Object> m=new HashMap<String, Object>();
        Order order=orderMapper.selectOrderWithDetail(sequence);
        try {
            if( !(order.getShopstatus()==0 && order.getOrderstatus()==0)  )
            {
                m.put("status",1);
                m.put("msg","订单流程错误");
                throw new Exception();
            }
            if (order.getOrderDetails() != null) {
                //循环更新库存,销量
                for (OrderDetail orderDetail : order.getOrderDetails()) {
                    //取出orderDetail - amount , fid
                    Format format = formatMapper.selectByPrimaryKey( orderDetail.getFid() );

                    //减去库存
                    if( orderDetail.getAmount() > format.getStock() )
                    {
                        m.put("status",2);
                        m.put("msg","库存不足");
                        throw new Exception();
                    }
                    format.setStock( format.getStock() - orderDetail.getAmount() );
                    //销量增加
                    format.setSales( format.getSales() + orderDetail.getAmount() );
                    //检查下架
                    if(format.getStock()==0)
                    {
                        if( !(formatMapper.goodsShelfCondition(format.getGoods()) > 0) )
                        {
                            goodsService.GoodsShelf(format.getGoods(),0,null);
                        }
                    }
                    //更新规格表
                    format.setUpdatetime(DateExample.getNowTimeByDate());
                    formatMapper.updateByPrimaryKeySelective(format);
                }
                //订单状态更改
                order.setOrderstatus(1);
                //运费加入
                order.setFreight(freight);
                //总价变更
                order.setAllprice( order.getAllprice() + freight );
                orderMapper.updateByPrimaryKey(order);
            }
            else{
                m.put("status",3);
                m.put("msg","订单错误,请取消");
                throw new Exception();
            }
        }catch (NullPointerException e)
        {
            m.put("status",4);
            m.put("msg","空值异常");
            return m;
        }
        catch (Exception e)
        {
            if(m.get("status")==null)
            {
                m.put("status",5);
            }
            if(m.get("msg")==null)
            {
                m.put("msg","程序异常:"+e.getClass());
            }
            return m;
        }
        m.put("status",0);
        m.put("msg","已确认订单,等待用户付款");
        return m;
    }

    //付款(回调)
    @Override
    @Transactional(rollbackFor=Exception.class)
    public Map<String, Object> pay(String sequence,String rprice , Integer stauts) //订单，实付金额
    {
        //System.out.println("进入Pay方法");
        //System.out.println("sequence:"+sequence + "  rprice:"+rprice + "  stauts:"+stauts);
        Map<String,Object> m=new HashMap<String, Object>();
        Order order=orderMapper.selectBySequence(sequence);
        //Integer OS = order.getOrderstatus();
        //Integer SS = order.getShopstatus();
        //System.out.println("OS:"+OS + "  SS:"+SS);
        try {
            if(stauts!=0)   //0正确  1错误
            {
                m.put("status",1);
                m.put("msg","订单错误,请取消");
                throw new Exception();
            }
            //System.out.println("判断Order状态");
            if(order.getOrderstatus() == 1 && order.getShopstatus() == 0 )
            {
                //System.out.println(Double.valueOf(rprice));
                if (Double.valueOf(rprice)/100 < order.getAllprice() )
                {
                    m.put("status",2);
                    m.put("msg","付款金额不符");
                    throw new Exception();
                }

                order.setShopstatus(1);
                order.setUpdatetime(DateExample.getNowTimeByDate());
                int i = orderMapper.updateByPrimaryKeySelective(order) ;
                if( i<=0 )
                {
                    m.put("status",3);
                    m.put("msg","状态更新失败");
                    throw new Exception();
                }
            }
            else
            {
                System.out.println( order.getOrderstatus()+ "  " + order.getShopstatus());
                m.put("status",1);
                m.put("msg","订单错误,请取消");
                throw new Exception();
            }
            //用户积分增加
            User user = userMapper.selectByPrimaryKey(order.getUser());
            Double price = order.getAllprice();
            user.setScore( user.getScore() + price.intValue() );
            if( !( userMapper.updateByPrimaryKeySelective(user) > 0 ) )
            {
                m.put("status",4);
                m.put("msg","积分增加失败");
                throw new Exception();
            }
        }catch (Exception e)
        {
            System.out.println(e.getMessage() + " " + e.getCause() + " " +e.getStackTrace());
            System.out.println( JSON.toJSON(m) );
            return m;
        }
        m.put("status",0);
        m.put("msg","支付成功");
        System.out.println( JSON.toJSON(m) );
        return m;
    }

    @Override
    @Transactional(rollbackFor=Exception.class)
    public Map<String, Object> send(String sequence,String logistics) {  //发货
        Order order = orderMapper.selectBySequence(sequence);
        Map<String,Object> m = new HashMap<String, Object>();
        try {
            if( order.getOrderstatus() == 1 && order.getShopstatus() == 1 && order.getBuyway() == 0 )
            {
                if(logistics.length() < 15)
                {
                    m.put("status",4);
                    m.put("msg","物流信息不足");
                    throw new Exception();
                }
                order.setLogistics(logistics);
                order.setOrderstatus(2);
                order.setUpdatetime(DateExample.getNowTimeByDate());
            }
            else
            {
                m.put("status",3);
                m.put("msg","订单错误,请取消");
                throw new Exception();
            }
        }catch (Exception e)
        {
            if(m.get("status")==null)
            {
                m.put("status",5);
            }
            if(m.get("msg")==null)
            {
                m.put("msg","程序异常:"+e.getClass());
            }
            return m;
        }
        if(orderMapper.updateByPrimaryKeySelective(order) > 0)
        {
            m.put("status",0);
            m.put("msg","发货成功");
        }
        else
        {
            m.put("status",1);
            m.put("msg","发货失败");
        }
        return m;
    }

    @Override
    public Map<String, Object> getsend(String sequence) {   //取货
        Order order = orderMapper.selectBySequence(sequence);
        Map<String,Object> m = new HashMap<String, Object>();
        try {
            if( order.getOrderstatus() == 1 && order.getShopstatus() == 1 && order.getBuyway() == 1 )
            {
                order.setOrderstatus(3);    //取完货完成
                order.setUpdatetime(DateExample.getNowTimeByDate());
            }
            else
            {
                m.put("status",3);
                m.put("msg","订单错误,请取消");
                throw new Exception();
            }
        }catch (Exception e)
        {
            if(m.get("status")==null)
            {
                m.put("status",5);
            }
            if(m.get("msg")==null)
            {
                m.put("msg","程序异常:"+e.getClass());
            }
            return m;
        }
        if(orderMapper.updateByPrimaryKeySelective(order) > 0)
        {
            m.put("status",0);
            m.put("msg","发货成功");
        }
        else
        {
            m.put("status",1);
            m.put("msg","发货失败");
        }
        return m;
    }

    @Override
    public Map<String, Object> receive(String sequence) {
        Map<String,Object> m = new HashMap<String, Object>();
        Order order = orderMapper.selectBySequence(sequence);
        if (order.getShopstatus() == 1 && order.getOrderstatus() == 2 && order.getBuyway() == 1 )   //线下
        {
            m.put("status",1);
            m.put("msg","订单错误,请取消");
        }
        else if (order.getShopstatus() == 1 && order.getOrderstatus() == 2 && order.getBuyway() == 0)  //线上
        {
            order.setOrderstatus(3);//已完成
            order.setUpdatetime(DateExample.getNowTimeByDate());
            if( orderMapper.updateByPrimaryKeySelective(order) > 0 )
            {
                m.put("status",0);
                m.put("msg","收货成功");
            }
            else
            {
                m.put("status",0);
                m.put("msg","收货失败");
            }
        }
        return m;
    }

    //取消
    @Override
    @Transactional(rollbackFor=Exception.class)
    public Map<String, Object> cancel(String sequence) {
        Map<String,Object> m=new HashMap<String, Object>();
        Order order=orderMapper.selectOrderWithDetail(sequence);
        Integer orderStatus = order.getOrderstatus();
        Integer shopStatus = order.getShopstatus();
        Integer buyway = order.getBuyway();
        try {
            //线上/线下 待接单
            if (orderStatus == 0 && shopStatus == 0) {
                //接单时取消退回扣除积分
                if (order.getScorecost() > 0) {
                    User user = userMapper.selectByPrimaryKey(order.getUser());
                    user.setScore(user.getScore() + order.getScorecost().intValue());
                    user.setUpdatetime(DateExample.getNowTimeByDate());
                    userMapper.updateByPrimaryKeySelective(user);
                }
                order.setOrderstatus(7);
                order.setUpdatetime(DateExample.getNowTimeByDate());
                orderMapper.updateByPrimaryKey(order);
            }
            // 线上/线下 待付款
            else if (orderStatus == 1 && shopStatus == 0) {
                //待付款时取消 还原被扣库存和销量
                if(order.getOrderDetails() == null )
                {
                    m.put("status",2);
                    m.put("msg","订单详情异常");
                    throw new Exception();
                }
                for( OrderDetail orderDetail : order.getOrderDetails() )    //遍历orderDetail 更新
                {
                    Format format = formatMapper.selectByPrimaryKey( orderDetail.getFid() );
                    if( format!=null )  //规格还存在
                    {
                        format.setStock( format.getStock() + orderDetail.getAmount() );
                        format.setSales( format.getSales() - orderDetail.getAmount() );
                        if( format.getSales() < 0 )
                        {
                            format.setSales(0.0);
                        }
                        format.setUpdatetime(DateExample.getNowTimeByDate());
                        formatMapper.updateByPrimaryKeySelective(format);
                    }
                }
            }
            // 线上  待发货
            else if (orderStatus == 1 && shopStatus == 1 && buyway == 0) {
                m.put("status",1);
                m.put("msg","此状态不可取消");
                throw new Exception();
            }
            // 线下  待取货
            else if (orderStatus == 1 && shopStatus == 1 && buyway == 1) {
                m.put("status",1);
                m.put("msg","此状态不可取消");
                throw new Exception();
            }

            // 已取消
            else if (orderStatus == 7) {
                m.put("status",1);
                m.put("msg","此状态不可取消");
                throw new Exception();
            }
            else {
                m.put("status",7);
                m.put("msg","未知状态");
                throw new Exception();
            }
        }catch (Exception e)
        {
            if(m.get("status")==null)
            {
                m.put("status",6);
            }
            if(m.get("msg")==null)
            {
                m.put("msg","程序异常:"+e.getClass());
            }
            return m;
        }
        m.put("status",0);
        m.put("msg","取消成功");
        return m;
    }


}
