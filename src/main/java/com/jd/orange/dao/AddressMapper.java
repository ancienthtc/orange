package com.jd.orange.dao;

import com.jd.orange.model.Address;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
}