package com.jd.orange.dao;

import com.jd.orange.model.Address;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);

    List<Address> getAddressByUser(Integer uid);

    int setNoMainByUser(Integer uid);

    int setMainById(Integer id);

    int getAddressCountByUser(Integer uid);

    Address getUserMain(Integer uid);
}