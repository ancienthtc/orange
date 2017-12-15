package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.PictureMapper;
import com.jd.orange.model.Picture;
import com.jd.orange.service.ImageService;
import com.jd.orange.util.PictureType;
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
    public int pictureAdd(MultipartFile file , String path , PictureType type, Integer id, Picture picture) {

        if (!file.isEmpty()) {
            try {
                // 转存文件
                file.transferTo(new File(path));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }




        return 0;
    }


}
