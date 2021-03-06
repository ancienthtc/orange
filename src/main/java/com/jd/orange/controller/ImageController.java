package com.jd.orange.controller;

import com.jd.orange.model.Picture;
import com.jd.orange.service.ImageService;
import com.jd.orange.util.Folder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Controller
@RequestMapping("/image")
public class ImageController {

    @Autowired
    private ImageService imageService;

    /*
     *  资源文件夹:images
     *  上传文件夹一:description
     *  上传文件夹二:upload
     *  默认图片:images/default.png
     */

    @ResponseBody
    @RequestMapping(value = "/show")
    public void showCommonPicture(HttpServletRequest request, HttpServletResponse response, @RequestParam String pic)
    {
        String imagePath;
        if(pic==null)
        {
            pic="";
        }
        if(pic.equals("undefined") || pic.equals("") || pic.equals("null") || pic.equals("default")) //默认图片
        {
            imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Default.getVal() + "default.png";
        }
        else
        {
            imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Upload.getVal() + pic;
        }
        //System.out.println(imagePath);
        OutPutAgain(imagePath,request,response,0);
    }

    @ResponseBody
    @RequestMapping(value = "/goods")
    public void showGoodsPicture(HttpServletRequest request, HttpServletResponse response, @RequestParam String pic)
    {
        String imagePath;
        if(pic==null)
        {
            pic="";
        }
        if(pic.equals("undefined") || pic.equals("") || pic.equals("null")) //默认图片
        {
            imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Default.getVal() + "default.png";
        }
        else
        {
            if( pic.contains("/")  )    //判断是地址还是文件名
            {
                pic=pic.substring( pic.lastIndexOf("/") + 1 );
                imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.GoodsDetail.getVal() + pic;
            }
            else if( pic.contains("\\"))
            {
                pic=pic.substring( pic.lastIndexOf("\\") + 1 );
                imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.GoodsDetail.getVal() + pic;
            }
            else
            {
                imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.GoodsDetail.getVal() + pic;
            }
        }
        //System.out.println(imagePath);
        OutPutAgain(imagePath,request,response,0);
    }

    @ResponseBody
    @RequestMapping(value = "/order")
    public void showOrderPicture(HttpServletRequest request, HttpServletResponse response,
                                 @RequestParam(required = false) String pic ,@RequestParam(required = false) Integer pid )
    {
        String imagePath="";
        if(pic==null && pid==null)  //使用默认
        {
            pic="";
            if(pic.equals("undefined") || pic.equals("") || pic.equals("null") || pic.equals("default")) //默认图片
            {
                imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Default.getVal() + "default.png";
            }
        }
        else if( pic==null && pid!=null )   //使用pid
        {
            Picture picture = imageService.getPictureById(pid);
            //imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Order.getVal() + picture.getFilename() ;
            imagePath = picture.getRoute() + picture.getFilename() ;
        }
        else if( pic!=null && pid==null )   //使用pic
        {
            imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Order.getVal() + pic ;
        }
        else
        {
            imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Order.getVal() + pic;
        }
        //System.out.println(imagePath);
        OutPutAgain(imagePath,request,response,0);
    }

//    @ResponseBody
//    @RequestMapping(value = "/goods")
//    public void showGoodsPictureDefault(HttpServletRequest request, HttpServletResponse response)
//    {
//        String imagePath;
//        imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Default.getVal() + "default.png";
//        OutPutAgain(imagePath,request,response,0);
//    }
//
//    @ResponseBody
//    @RequestMapping(value = "/show")
//    public void showGoodsPictureDefault(HttpServletRequest request, HttpServletResponse response,String imagePath)
//    {
//        imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Default.getVal() + "default.png";
//        OutPutAgain(imagePath,request,response,0);
//    }


    private void OutPutAgain(String imagePath,HttpServletRequest request, HttpServletResponse response,Integer value)
    {
        FileInputStream in;
        response.setContentType("application/octet-stream;charset=UTF-8");
        try {
            // 图片读取路径
            in = new FileInputStream(imagePath);
            int i = in.available();
            byte[] data = new byte[i];
            in.read(data);
            in.close();

            // 写图片
            OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
            outputStream.write(data);
            outputStream.flush();
            outputStream.close();
        }
        catch (FileNotFoundException e)
        {
            imagePath = request.getSession().getServletContext().getRealPath("/")+ "images/" + "default.png";
            if(value==0)
            {
                OutPutAgain(imagePath,request,response,1);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }




}
