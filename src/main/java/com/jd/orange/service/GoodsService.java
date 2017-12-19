package com.jd.orange.service;

import com.jd.orange.model.Goods;
import com.jd.orange.util.pagehelper.PagedResult;
import org.springframework.web.multipart.MultipartFile;

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
     * @param gid
     * @param status 0-下架  1-上架
     * @return
     */
    int GoodsShelf(Integer gid,Integer status);

    int getGoodsCount();

    //test
    List<Goods> getGoodsList(String key,String start ,String end);

    Goods getGoods(Integer gid);

    int GoodsAdd(Goods goods,MultipartFile file1,MultipartFile file2,MultipartFile file3,String ServerPath);

    int goodsPicDel(Integer gid,String detail);

    //update
    //商品图片修改
    int picUpdate(String ServerPath,Integer gid,int i,MultipartFile file);

    int goodsUpdate(Goods goods);



}
