package com.jd.orange.dao;

import com.jd.orange.model.Part;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Part record);

    int insertSelective(Part record);

    Part selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Part record);

    int updateByPrimaryKey(Part record);

    List<Part> getFatherParts();

    List<Part> getChildPart(@Param("belong") Integer fpid);

    List<Part> partsList(@Param("key") String key);

    Part getPartById(Integer id);

}