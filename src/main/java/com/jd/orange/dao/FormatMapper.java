package com.jd.orange.dao;

import com.jd.orange.model.Format;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FormatMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Format record);

    int insertSelective(Format record);

    Format selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Format record);

    int updateByPrimaryKey(Format record);

    List<Format> formatList(Integer gid);

    //上架条件 产品至少有一个规格，并且库存大于0
    int goodsShelfCondition(Integer gid);

    int formatCount(Integer gid);

    Format formatDetail(Integer fid);
}