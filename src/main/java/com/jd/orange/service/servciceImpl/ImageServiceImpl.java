package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.PictureMapper;
import com.jd.orange.model.Picture;
import com.jd.orange.service.ImageService;
import com.jd.orange.util.Folder;
import com.jd.orange.util.PictureType;
import com.jd.orange.util.StringUtil.GenerateString;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;

@Service
public class ImageServiceImpl implements ImageService{

    @Resource
    private PictureMapper pictureMapper;

    @Override
    public List<Picture> pictures(PictureType type, Integer id) {
        //type+id
        return pictureMapper.getPictureList(type.getVal()+id);
    }

    @Override
    public int pictureAdd(MultipartFile file , String serverPath , PictureType type, Integer id, Picture picture) {
        String title=new GenerateString().getUUID() +"."+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        if (!file.isEmpty()) {
            try {
                // 转存文件
                file.transferTo(new File(serverPath+ Folder.Upload+title));
            } catch (Exception e) {
                e.printStackTrace();
                return 0;
            }
        }




        return 1;
    }

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
    public int imageDelete(String absolutePath, Integer id, String pictype) {
        if(id!=null)
        {

        }
        if(pictype!=null)
        {

        }
        return 0;
    }

    //项目图片删除
    @Override
    public boolean fileDel(String absolutePath) {
        //imagePath = request.getSession().getServletContext().getRealPath("/")+ "upload/" + pic;
        File file = new File(absolutePath);
        if (file.exists()){
            return file.delete();
        }else{
            return false;
        }
    }


}
