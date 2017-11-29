package com.jd.orange.dao;

import com.jd.orange.model.Format;
import org.springframework.stereotype.Repository;

@Repository
public interface FormatMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Format record);

    int insertSelective(Format record);

    Format selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Format record);

    int updateByPrimaryKey(Format record);
}