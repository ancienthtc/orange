package com.jd.orange.service.servciceImpl;

import com.github.pagehelper.PageHelper;
import com.jd.orange.dao.GoodsMapper;
import com.jd.orange.model.Goods;
import com.jd.orange.service.GoodsService;
import com.jd.orange.util.date.DateExample;
import com.jd.orange.util.pagehelper.BeanUtil;
import com.jd.orange.util.pagehelper.PagedResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService{

    @Override
    public int GoodsShelf(Goods goods, Integer status) {
        if(status==0)
        {

        }
        else if(status==1)
        {

        }
        return 0;
    }

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public int getGoodsCount() {
        return goodsMapper.getGoodsCount();
    }

    @Override
    public PagedResult<Goods> getGoodsList(Integer pageNo, Integer pageSize,String key,String start ,String end)
    {
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        PageHelper.startPage(pageNo,pageSize);
        if(start!=null && end!=null)
        {
            switch (DateExample.CompareDate(start,end))
            {
                case 1:
                    return BeanUtil.toPagedResult(goodsMapper.getGoodsList(key,end,start));
                //break;
                default:
                    return BeanUtil.toPagedResult(goodsMapper.getGoodsList(key,start,end));
                //break;
            }
        }
        else
            return BeanUtil.toPagedResult(goodsMapper.getGoodsList(key,start,end));
    }

    @Override
    public List<Goods> getGoodsList(String key,String start ,String end) {
        if(start!=null && end!=null)
        {
            switch (DateExample.CompareDate(start,end))
            {
                case 1:
                    return goodsMapper.getGoodsList(key,end,start);
                //break;
                default:
                    return goodsMapper.getGoodsList(key,start,end);
                //break;
            }
        }
        else
            return goodsMapper.getGoodsList(key,start,end);

    }
}
