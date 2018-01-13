package com.jd.orange.service;

import com.jd.orange.model.Address;

import java.util.List;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface AddressService {

    //查询用户所有地址
    List<Address> getAddressByUser(Integer uid);

    //查询单一地址
    Address getAddressById(Integer aid);

    //设为默认
    int setMain(Integer aid,Integer status,Integer uid);

    //新增地址
    int addAddress(Address address);

    //修改地址
    int updateAddress(Address address);

    //删除地址
    int addressDel(Integer aid);

    //获取默认地址
    Address getUserMain(Integer uid);
}
