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
    int GoodsShelf(Integer gid,Integer status ,String shelf);

    int getGoodsCount();

    //test
    List<Goods> getGoodsList(String key,String start ,String end);

    Goods getGoods(Integer gid);

    int GoodsAdd(Goods goods,MultipartFile file1,MultipartFile file2,MultipartFile file3,String ServerPath);

    int goodsPicDel(Integer gid,String detail);

    //update
    //商品图片修改

    /**
     * i=1 pic1 i=2 pic2 i=3 pic3
     * @param ServerPath
     * @param gid
     * @param i
     * @param file
     * @return
     */
    int picUpdate(String ServerPath,Integer gid,int i,MultipartFile file);

    int goodsUpdate(Goods goods);

    //商品推荐
    int goodsRecommend(Integer id,Integer recommend);

    //推荐商品
    List<Goods> getRecommend();

    //热销商品
    List<Goods> getHotSales();

    //新商品
    List<Goods> getNewGoods();

    //商品删除()

    //商品销量统计

    //全部商品销量统计


    //商品列表页面
    List<Goods> GoodsListPage(Integer pid);

    Goods getGoodsDetail(Integer id);

}
