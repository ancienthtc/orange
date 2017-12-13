package com.jd.orange.service;

import com.jd.orange.model.Goods;
import com.jd.orange.util.pagehelper.PagedResult;

import java.util.List;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface GoodsService {

    //获取分类下所有商品

    //查询全部商品
    PagedResult<Goods> getGoodsList(Integer pageNo, Integer pageSize,String key,String start ,String end);

    //上架 下架

    /**
     * 商品上架/下架
     * @param goods
     * @param status 0-下架  1-上架
     * @return
     */
    int GoodsShelf(Goods goods,Integer status);

    int getGoodsCount();

    //test
    List<Goods> getGoodsList(String key,String start ,String end);
}
