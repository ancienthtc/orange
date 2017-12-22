package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.model.Admin;
import com.jd.orange.model.Picture;
import com.jd.orange.service.AdminService;
import com.jd.orange.service.ImageService;
import com.jd.orange.service.OrderService;
import com.jd.orange.service.UserService;
import com.jd.orange.util.PictureType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger log = LoggerFactory.getLogger(AdminController.class);

    private ValueFilter filter = new ValueFilter() {
        @Override
        public Object process(Object obj, String s, Object v) {
            if(v==null)
                return "";
            return v;
        }
    };

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private AdminService adminService;

    /*
       page part:
     */
    @RequestMapping("/home")
    public String page_home(Model model)
    {
        //商城用户数量
        model.addAttribute("userAmount",userService.getUserAmount());
        //商城订单数量
        model.addAttribute("orderAmount",orderService.orderAmount());
        //
        return "manager/home";
    }

    //进入轮播图管理
    @RequestMapping("/toFigure")
    public String to_page_show(Model model)
    {
        model.addAttribute("pics",imageService.pictures(PictureType.Other,null));
        return "manager/lunbotuguanli";
    }

    //进入轮播图添加
    @RequestMapping("/toFigureAdd")
    public String to_figure_add()
    {
        return "manager/picture-add";
    }

    //进入管理员管理
    @RequestMapping("/toAdminManager")
    public String toAdminManager(HttpSession session,Model model)
    {
//        Admin admin=(Admin) session.getAttribute("admin");
//        if(admin == null)
//        {
//            return "redirect:/login/AdminSignIn";
//        }
//        model.addAttribute("admin",adminService.getAdminListByLevel(admin.getLevel()));

        return "manager/administrator";
    }

    //获得管理员列表
    @RequestMapping(value = "/getAdminListByLevel" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getAdminListByLevel(HttpSession session,Integer pageNo, Integer pageSize, String key, String start , String end)
    {
        Admin admin=(Admin) session.getAttribute("admin");
        if(admin == null)
        {
            return "{}";
        }
        log.info(JSON.toJSONString(adminService.getAdminListByLevel(pageNo,pageSize,key,start,end,admin.getLevel() ),filter ));
        return JSON.toJSONString(adminService.getAdminListByLevel(pageNo,pageSize,key,start,end,admin.getLevel() ),filter );
    }


    //添加轮播图
    @RequestMapping("/FigureAdd")
    @ResponseBody
    public String FigureAdd(HttpServletRequest request , @RequestParam(value = "file") MultipartFile file)
    {
        if(imageService.getOtherCount()>=6)
        {
            return "false";
        }
        if (imageService.pictureAdd(file,request.getSession().getServletContext().getRealPath("/"), PictureType.Other,null) >0 )
        {
            return "true";
        }
        return "false";
    }

}
