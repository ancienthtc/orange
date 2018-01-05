package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.FormatMapper;
import com.jd.orange.dao.GoodsMapper;
import com.jd.orange.model.Format;
import com.jd.orange.service.FormatService;
import com.jd.orange.service.GoodsService;
import com.jd.orange.util.date.DateExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FormatServiceImpl implements FormatService{

    @Resource
    private FormatMapper formatMapper;

    @Resource
    private GoodsMapper goodsMapper;

    @Autowired
    private GoodsService goodsService;

    @Override
    public List<Format> formatList(Integer gid) {
        return formatMapper.formatList(gid);
    }

    @Override
    public int formatAdd(Format format) {
        format.setCreatetime(DateExample.getNowTimeByDate());
        return formatMapper.insertSelective(format);
    }

    @Override
    public int formatUpdate(Format format) {
        format.setUpdatetime(DateExample.getNowTimeByDate());
        return formatMapper.updateByPrimaryKeySelective(format);
    }

    @Override
    public int formatDel(Integer fid) {
        Format format=formatMapper.selectByPrimaryKey(fid);
        int i=formatMapper.deleteByPrimaryKey(fid);
        //商品不满足条件自动下架
        if( !(formatMapper.goodsShelfCondition(format.getGoods()) > 0) )
        {
            goodsService.GoodsShelf(format.getGoods(),0);
        }
        return i;
    }

    @Override
    public Format getFormat(Integer fid) {
        return formatMapper.selectByPrimaryKey(fid);
    }

}
