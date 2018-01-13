package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.AddressMapper;
import com.jd.orange.model.Address;
import com.jd.orange.service.AddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {

    @Resource
    private AddressMapper addressMapper;

    @Override
    public List<Address> getAddressByUser(Integer uid) {
        return addressMapper.getAddressByUser(uid);
    }

    @Override
    public Address getAddressById(Integer aid) {
        return addressMapper.selectByPrimaryKey(aid);
    }

    @Override
    public int setMain(Integer id, Integer status,Integer uid) {
        if (status==0)  //取消
        {
            return addressMapper.setNoMainByUser(uid);
        }
        else if(status==1)  //设默认
        {
            addressMapper.setNoMainByUser(uid);
            return addressMapper.setMainById(id);
        }
        else
        {
            return 0;
        }
    }

    @Override
    public int addAddress(Address address) {
        //上限5个
        if( addressMapper.getAddressCountByUser(address.getUser()) >=5 )
        {
            return 0;
        }
        if(address.getIsmain()==1)
        {
            addressMapper.setNoMainByUser(address.getUser());
        }
        return addressMapper.insertSelective(address);

    }

    @Override
    public int updateAddress(Address address) {
        return addressMapper.updateByPrimaryKeySelective(address);
    }

    @Override
    public int addressDel(Integer aid) {
        return addressMapper.deleteByPrimaryKey(aid);
    }

    @Override
    public Address getUserMain(Integer uid) {
        return addressMapper.getUserMain(uid);
    }
}
