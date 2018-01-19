package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.PictureMapper;
import com.jd.orange.model.Picture;
import com.jd.orange.service.GoodsService;
import com.jd.orange.service.ImageService;
import com.jd.orange.util.Folder;
import com.jd.orange.util.PictureType;
import com.jd.orange.util.StringUtil.GenerateString;
import com.jd.orange.util.date.DateExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Service
public class ImageServiceImpl implements ImageService{

    @Resource
    private PictureMapper pictureMapper;


    @Override
    public List<Picture> pictures(PictureType type, Integer id) {
        //type+id
        if(id==null)
        {
            return pictureMapper.getPictureList(type.getVal());
        }
        else
        {
            return pictureMapper.getPictureList(type.getVal()+id);
        }
    }

    @Override
    @Transactional
    public int pictureAdd(MultipartFile file , String serverPath , PictureType type, Integer id) {
        String title=new GenerateString().getUUID() +"."+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        String folderPath=serverPath+Folder.Upload + "\\" ;


        if (!file.isEmpty()) {
            try {
                // 文件夹不存在就创建
                File saveDir = new File(folderPath);
                if (!saveDir.exists() && !saveDir.isDirectory()) {
                    saveDir.mkdir();
                }
                // 转存文件
                file.transferTo(new File(folderPath + title));
                Picture picture=new Picture();
                picture.setCreatetime(DateExample.getNowTimeByDate());//创建时间
                picture.setFilename(title);//文件名
                picture.setRoute(folderPath);//文件夹路径
                if(id==null)
                {
                    picture.setPictype(type.getVal());//设置"外键"
                }
                else
                {
                    picture.setPictype(type.getVal()+id);//设置"外键"
                }

                return pictureMapper.insertSelective(picture);
            } catch (Exception e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    //(商品模块使用)
    @Override
    public int pictureAdd(MultipartFile file, String folderPath , String filename) {
        if (!file.isEmpty()) {
            try {
                //
                File saveDir = new File(folderPath);
                if (!saveDir.exists() && !saveDir.isDirectory()) { // 文件夹不存在就创建
                    saveDir.mkdir();
                }
                // 转存文件
                file.transferTo(new File(folderPath + filename ));
                return 1;
            } catch (Exception e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    @Override
    @Transactional
    public boolean imageDelete(String absolutePath, Integer id, String pictype) {
        if(id!=null && pictype==null)    //Picture表
        {
            if( pictureMapper.deleteByPrimaryKey(id) > 0 )
            {
                return fileDel(absolutePath);
            }
        }
        if(pictype!=null && id==null)   //轮播图片
        {

        }
        if(pictype!=null && id!=null)   //type+id
        {

        }
        return false;
    }

    //项目图片删除
    @Override
    public boolean fileDel(String absolutePath) {
        //imagePath = request.getSession().getServletContext().getRealPath("/")+ "upload/" + pic;
        if(absolutePath==null)
        {
            return false;
        }
        File file = new File(absolutePath);
        if (file.exists()){
            return file.delete();
        }else{
            return false;
        }
    }

    @Override
    public boolean figureDel(Integer pid) {
        Picture picture=pictureMapper.selectByPrimaryKey(pid);
        String absolutePath=picture.getRoute()+picture.getFilename();
        int i=pictureMapper.deleteByPrimaryKey(pid);
        if( fileDel(absolutePath) && i > 0  )
        {
            return true;
        }
        else
            return false;
    }

    @Override
    public int getOtherCount() {
        return pictureMapper.getOtherPicCount();
    }

    //订单(复制商品图片)
    @Override
    public Picture ImageCopy(String absolutePath ,String ServerPath, Folder folder, PictureType type)
    {
        if(absolutePath==null || ServerPath==null)
        {
            return null;
        }
        Picture picture=new Picture();
        picture.setRoute(ServerPath+folder.getVal());
        picture.setFilename(new GenerateString().getFileName(type.getVal())+"."+absolutePath.substring(absolutePath.lastIndexOf(".")+1) );
        picture.setPictype(type.toString());
        picture.setCreatetime(DateExample.getNowTimeByDate());
        try {
            // 打开输入流
            FileInputStream fis = new FileInputStream(absolutePath);

            //判断文件夹
            File saveDir = new File(ServerPath+folder.getVal());
            if (!saveDir.exists() && !saveDir.isDirectory()) { // 文件夹不存在就创建
                saveDir.mkdir();
            }
            // 打开输出流
            FileOutputStream fos = new FileOutputStream(picture.getRoute()+picture.getFilename());

            // 读取和写入信息
            int len = 0;
            // 创建一个字节数组，当做缓冲区
            byte[] b = new byte[1024];
            while ((len = fis.read(b)) != -1) {
                fos.write(b, 0, len);
            }

            // 关闭流  先开后关  后开先关
            fos.close(); // 后开先关
            fis.close(); // 先开后关
            pictureMapper.insertSelective(picture);

            return picture;
        }catch (IOException e)
        {
            return null;
        }
    }


    @Override
    public Picture getPictureById(Integer pid) {
        return pictureMapper.selectByPrimaryKey(pid);
    }
}
