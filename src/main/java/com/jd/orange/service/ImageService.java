package com.jd.orange.service;

import com.jd.orange.model.Picture;
import com.jd.orange.util.Folder;
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
    int pictureAdd(MultipartFile file , String serverPath , PictureType type, Integer id);

    int pictureAdd(MultipartFile file , String folderPath , String filename);

    /**
     * id: t_picture  pictype: t_goods
     * @param absolutePath
     * @param id
     * @param pictype
     * @return
     */
    boolean imageDelete(String absolutePath,Integer id , String pictype);

    boolean fileDel(String absolutePath);

    boolean figureDel(Integer pid);

    int getOtherCount();

    Picture ImageCopy(String absolutePath ,String ServerPath, Folder folder, PictureType type);

    Picture getPictureById(Integer pid);
}
