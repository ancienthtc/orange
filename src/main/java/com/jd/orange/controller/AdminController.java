package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.baidu.ueditor.ActionEnter;
import com.jd.orange.common.AdminCheck;
import com.jd.orange.common.Alevel;
import com.jd.orange.model.Admin;
import com.jd.orange.model.Picture;
import com.jd.orange.service.AdminService;
import com.jd.orange.service.ImageService;
import com.jd.orange.service.OrderService;
import com.jd.orange.service.UserService;
import com.jd.orange.util.PictureType;
import com.jd.orange.util.password.Secret;
import org.apache.http.HttpResponse;
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

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

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
    @AdminCheck(Alevel.L1)
    @RequestMapping("/home")
    public String page_home(Model model)
    {
        //商城用户数量
        model.addAttribute("userAmount",userService.getUserAmount());
        //商城订单数量
        model.addAttribute("orderAmount",orderService.orderAmount());
        //统计
        model.addAttribute("cal",adminService.getCal());
        return "manager/home";
    }

    //进入轮播图管理
    @AdminCheck(Alevel.L1)
    @RequestMapping("/toFigure")
    public String to_page_show(Model model)
    {
        model.addAttribute("pics",imageService.pictures(PictureType.Other,null));
        return "manager/lunbotuguanli";
    }

    //进入轮播图添加
    @AdminCheck(Alevel.L1)
    @RequestMapping("/toFigureAdd")
    public String to_figure_add()
    {
        //return "manager/picture-add";
        return "manager/figureAdd";
    }

    //进入管理员管理
    @AdminCheck(Alevel.L2)
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


    //进入修改
    @AdminCheck(Alevel.L2)
    @RequestMapping("/toAlter")
    public String toAdminAlter(@RequestParam Integer aid , Model model)
    {
        model.addAttribute("admin",adminService.getAdmin(aid));
        return "manager/adminAlter";
    }

    //进入案内
    @AdminCheck(Alevel.L1)
    @RequestMapping("/toGuideWrite")
    public String toGuideWrite()
    {
        return "manager/guide_write";
    }

    @AdminCheck(Alevel.L1)
    @RequestMapping("/toGuideDel")
    public String toGuideDel()
    {
        return "manager/default_guide";
    }

    //进入个人中心
    @AdminCheck(Alevel.L1)
    @RequestMapping("/toInfo")
    public String toAdminInfo()
    {
        return "manager/admin_info";
    }

    @AdminCheck(Alevel.L1)
    @RequestMapping("/alter")
    public String AdminAlter(Admin admin)
    {
        adminService.AdminAlter(admin);
        return "manager/administrator";
    }

    @AdminCheck(Alevel.L1)
    @RequestMapping("/alterMe")
    @ResponseBody
    public String AdminAlter(HttpSession session,Admin admin)
    {
        if( adminService.AdminAlter(admin) > 0 )
        {
            session.setAttribute("admin",adminService.getAdmin(admin.getId()));
            return "true";
        }
        return "false";
    }

    @AdminCheck(Alevel.L1)
    @RequestMapping("/alterMePass")
    @ResponseBody
    public String AdminAlter(Integer id , String oldPass ,String newPass)
    {
        if ( adminService.AdminPassAlter(id,oldPass,newPass) > 0 )
        {
            return "true";
        }
        return "false";
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

    //管理员添加
    @RequestMapping("/add")
    @ResponseBody
    public String AdminAdd(Admin admin)
    {
        //log.info(admin.getAdmin()+" "+admin.getLevel()+" "+admin.getName() );
        if(adminService.AdminAdd(admin) > 0 )
        {
            return "true";
        }
        return "false";
    }



    @RequestMapping("/del")
    @ResponseBody
    public String AdminDel(Integer aid)
    {
        if ( adminService.AdminDel(aid) > 0 )
        {
            return "true";
        }
        return "false";
    }

    /*  轮播图管理  */
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

    @RequestMapping("/FigureDel")
    @ResponseBody
    public String FigureDel(Integer pid)
    {
        if( imageService.figureDel(pid) )
        {
            return "true";
        }
        return "false";
    }

    /* 案内管理 */
    @RequestMapping("/getHtml")
    //@ResponseBody
    public String getHtml(HttpServletRequest request, HttpServletResponse response , Model model)
    {
        PrintWriter out = null;
        String BasePath = request.getSession().getServletContext().getRealPath("/");
        try {
            String wait = request.getParameter("param");
            //加JSP头
            wait = "<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" %>" + "\n" + wait;
            //替换head
            String replace = "<head><meta charset=\"UTF-8\">" + "\n";
            replace += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\">";
            replace += "\n";
            //开始替换
            wait = wait.replaceFirst("<head>", replace);
            //输出流
            out = new PrintWriter(new OutputStreamWriter(new FileOutputStream(BasePath+"file\\guide.jsp"), "utf-8"));
            out.println(wait);
        }catch (Exception e)
        {
            e.printStackTrace();
        }finally {
            try {
                if(out!=null) out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        model.addAttribute("URL","admin/toGuideWrite");
        model.addAttribute("MESSAGE","完成");
        return "manager/alert_info";    //todo: 增加页面 ， 专门接收alert信息
    }

    @RequestMapping("/GuideDel")
    //@ResponseBody
    public String GuideDel(HttpServletRequest request,Model model)
    {
        String basePath = request.getSession().getServletContext().getRealPath("/");
        String absolutePath = basePath + "file\\guide.jsp";
        model.addAttribute("URL","admin/toGuideWrite");
        if( adminService.GuideDel(absolutePath) )
        {
            model.addAttribute("MESSAGE","完成");
        }
        else
        {
            model.addAttribute("MESSAGE","没有文件可删 ");
        }
        return "manager/alert_info";
    }

    /**
     * 百度富文本编辑器：图片上传
     * @param request
     * @param response
     */
    @RequestMapping("/upload")
    public void imgUploadByUeditor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding( "utf-8" );
        response.setHeader("Content-Type" , "text/html");
        ServletContext application=request.getServletContext();
        String rootPath = application.getRealPath( "/" );
        PrintWriter out = response.getWriter();
        out.write( new ActionEnter( request, rootPath ).exec() );
    }


    //权限不足提示
    @RequestMapping("/lack")
    public String LackLevel(HttpServletResponse response)
    {
        response.setContentType("text/html; charset=gbk");
        try {
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<body>");
            out.println("<script>");
            out.println("alert('权限不足')");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
            out.flush();
            out.close();
        }catch (Exception e)
        {
            return "redirect:/login/AdminSignIn";
        }
        return null;
    }

    @RequestMapping("/RealPass")
    @ResponseBody
    public String realPass(@RequestParam String admin,@RequestParam String pass,@RequestParam String secret)
    {
        Admin a = adminService.getAdmin(admin,Secret.enPass(pass));
        if( a== null )
        {
            return "登录密码错误";
        }
        else
        {
            if(a.getLevel() < 3)
            {
                return "权限不足!";
            }
            else
            {
                return "加密:"+secret + "  解密:"+ Secret.dePass(secret);
            }
        }

    }

}
