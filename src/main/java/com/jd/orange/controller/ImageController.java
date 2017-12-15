package com.jd.orange.controller;

import com.jd.orange.util.Folder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Controller
@RequestMapping("/image")
public class ImageController {

    /*
     *  资源文件夹:images
     *  上传文件夹一:description
     *  上传文件夹二:upload
     *  默认图片:images/default.png
     */

    @ResponseBody
    @RequestMapping(value = "/show/{pic}")
    public void showCommonPicture(HttpServletRequest request, HttpServletResponse response, @PathVariable String pic)
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
    @RequestMapping(value = "/goods/{pic}")
    public void showGoodsPicture(HttpServletRequest request, HttpServletResponse response, @PathVariable String pic)
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
            imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.GoodsDetail.getVal() + pic;
        }
        //System.out.println(imagePath);
        OutPutAgain(imagePath,request,response,0);
    }

    @ResponseBody
    @RequestMapping(value = "/goods")
    public void showGoodsPictureDefault(HttpServletRequest request, HttpServletResponse response)
    {
        String imagePath;
        imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Default.getVal() + "default.png";
        OutPutAgain(imagePath,request,response,0);
    }

    @ResponseBody
    @RequestMapping(value = "/show")
    public void showGoodsPictureDefault(HttpServletRequest request, HttpServletResponse response,String imagePath)
    {
        imagePath = request.getSession().getServletContext().getRealPath("/")+ Folder.Default.getVal() + "default.png";
        OutPutAgain(imagePath,request,response,0);
    }


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
