package com.jd.orange.service.servciceImpl;

import com.github.pagehelper.PageHelper;
import com.jd.orange.dao.FormatMapper;
import com.jd.orange.dao.GoodsMapper;
import com.jd.orange.model.Goods;
import com.jd.orange.service.GoodsService;
import com.jd.orange.service.ImageService;
import com.jd.orange.util.Folder;
import com.jd.orange.util.StringUtil.GenerateString;
import com.jd.orange.util.date.DateExample;
import com.jd.orange.util.pagehelper.BeanUtil;
import com.jd.orange.util.pagehelper.PagedResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService{

    @Resource
    private ImageService imageService;

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private FormatMapper formatMapper;

    @Override
    @Transactional
    public int GoodsAdd(Goods goods, MultipartFile file1, MultipartFile file2, MultipartFile file3, String ServerPath) {
        //goods
        ServerPath = ServerPath + Folder.GoodsDetail.getVal();
        String filename1 = new GenerateString().getFileName("goods")+getOriginal(file1);
        String filename2 = new GenerateString().getFileName("goods")+getOriginal(file2);
        String filename3 = new GenerateString().getFileName("goods")+getOriginal(file3);
        //创建时间
        goods.setCreatetime(DateExample.getNowTimeByDate());
        //文件名
        if(imageService.pictureAdd(file1,ServerPath,filename1 )>0)
        {
            goods.setPic1(ServerPath+filename1);
        }
        if(imageService.pictureAdd(file2,ServerPath,filename2 )>0)
        {
            goods.setPic2(ServerPath+filename2);
        }
        if(imageService.pictureAdd(file3,ServerPath,filename3 )>0)
        {
            goods.setPic3(ServerPath+filename3);
        }
        if(goodsMapper.insertSelective(goods) > 0 )
            return 1;
        else
            return 0;
    }


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

        return BeanUtil.toPagedResult(goodsMapper.getGoodsList(key,start,end));

//        if(start!=null && end!=null)
//        {
//            switch (DateExample.CompareDate(start,end))
//            {
//                case 1:
//                    return BeanUtil.toPagedResult(goodsMapper.getGoodsList(key,end,start));
//                //break;
//                default:
//                    return BeanUtil.toPagedResult(goodsMapper.getGoodsList(key,start,end));
//                //break;
//            }
//        }
//        else
//            return BeanUtil.toPagedResult(goodsMapper.getGoodsList(key,start,end));
    }

    @Override
    public List<Goods> getGoodsList(String key,String start ,String end) {
//        if(start!=null && end!=null)
//        {
//            switch (DateExample.CompareDate(start,end))
//            {
//                case 1:
//                    return goodsMapper.getGoodsList(key,end,start);
//                //break;
//                default:
//                    return goodsMapper.getGoodsList(key,start,end);
//                //break;
//            }
//        }
//        else
            return goodsMapper.getGoodsList(key,start,end);

    }

    @Override
    public Goods getGoods(Integer gid) {
        Goods goods=goodsMapper.selectByPrimaryKey(gid);
        if( goods.getPic1() !=null )
        {
            goods.setPic1( goods.getPic1().substring( goods.getPic1().lastIndexOf("\\") + 1 ) );
        }
        if( goods.getPic2() !=null )
        {
            goods.setPic2( goods.getPic2().substring( goods.getPic2().lastIndexOf("\\") + 1 ) );
        }
        if( goods.getPic3() !=null )
        {
            goods.setPic3( goods.getPic3().substring( goods.getPic3().lastIndexOf("\\") + 1 ) );
        }
        return goods;
    }

    public String getOriginal(MultipartFile file)
    {
        return  "." + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
    }

    @Override
    public int picUpdate(String ServerPath, Integer gid, int i, MultipartFile file) {
        ServerPath = ServerPath + Folder.GoodsDetail.getVal();
        String filename = new GenerateString().getFileName("goods")+getOriginal(file);
        Goods goods=goodsMapper.selectByPrimaryKey(gid);
        //修改时间
        goods.setUpdatetime(DateExample.getNowTimeByDate());
        switch (i)
        {
            case 1:
                //更新pic1
                if(goods.getPic1()==null)
                {
                    if(imageService.pictureAdd(file,ServerPath,filename )>0)
                    {
                        goods.setPic1(ServerPath+filename);
                    }
                    return goodsMapper.updateByPrimaryKeySelective(goods);
                }
                else
                    return 0;
            case 2:
                if(goods.getPic2()==null)
                {
                    if(imageService.pictureAdd(file,ServerPath,filename )>0)
                    {
                        goods.setPic2(ServerPath+filename);
                    }
                    return goodsMapper.updateByPrimaryKeySelective(goods);
                }
                else
                    return 0;
            case 3:
                if(goods.getPic3()==null)
                {
                    if(imageService.pictureAdd(file,ServerPath,filename )>0)
                    {
                        goods.setPic3(ServerPath+filename);
                    }
                    return goodsMapper.updateByPrimaryKeySelective(goods);
                }
                else
                    return 0;
            default:return 0;
        }
    }

    @Override
    public int goodsUpdate(Goods goods)
    {
        //修改时间
        goods.setUpdatetime(DateExample.getNowTimeByDate());
        return goodsMapper.updateByPrimaryKeySelective(goods);
    }

    @Override
    public int GoodsShelf(Integer gid, Integer status) {
        //status 0-下架  1-上架
        Goods goods=goodsMapper.selectByPrimaryKey(gid);
        if(status==0 )
        {
            if( goods.getShelf()!=null )
            {
                return goodsMapper.goodsstatus(gid,status,DateExample.getLocalTimeFormat());
            }
        }
        else if(status==1)
        {
            if( goods.getShelf()==null && formatMapper.goodsShelfCondition(gid) > 0 )
            {
                return goodsMapper.goodsstatus(gid,status,DateExample.getLocalTimeFormat());
            }
        }
        return 0;
    }


    @Override
    public int goodsPicDel(Integer gid , String detail) {
        Goods goods=goodsMapper.selectByPrimaryKey(gid);
        if(detail.equalsIgnoreCase("pic1") )
        {
            if( imageService.fileDel(goods.getPic1())  )
            {
                goods.setPic1(null);
            }
        }
        if(detail.equalsIgnoreCase("pic2") )
        {
            if( imageService.fileDel(goods.getPic2())  )
            {
                goods.setPic2(null);
            }
        }
        if(detail.equalsIgnoreCase("pic3") )
        {
            if( imageService.fileDel(goods.getPic3())  )
            {
                goods.setPic3(null);
            }
        }
        return goodsMapper.dropGoodsPic(goods);
    }

    @Override
    public List<Goods> GoodsListPage(Integer pid) {
        return goodsMapper.selectGoodsWithFormatsByPart(pid);
    }

    @Override
    public Goods getGoodsDetail(Integer id) {
        Goods goods=goodsMapper.selectGoodsWithFormatById(id);
        if( goods.getPic1()!=null && goods.getPic1().contains("\\"))
        {
            goods.setPic1( goods.getPic1().substring( goods.getPic1().lastIndexOf("\\") + 1 ) );
        }
        if( goods.getPic2()!=null && goods.getPic2().contains("\\"))
        {
            goods.setPic2( goods.getPic2().substring( goods.getPic2().lastIndexOf("\\") + 1 ) );
        }
        if( goods.getPic3()!=null && goods.getPic3().contains("\\"))
        {
            goods.setPic3( goods.getPic3().substring( goods.getPic3().lastIndexOf("\\") + 1 ) );
        }
        return goods;
    }
}
