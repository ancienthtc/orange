package com.jd.orange.service;

import com.jd.orange.model.Picture;
import com.jd.orange.util.PictureType;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface ImageService {

    //获取图片
    List<Picture> pictures(PictureType type,Integer id);

    //添加图片
    int pictureAdd(MultipartFile file , String path , PictureType type, Integer id, Picture picture);

}
