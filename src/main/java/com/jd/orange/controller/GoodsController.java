package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.common.AdminCheck;
import com.jd.orange.model.Format;
import com.jd.orange.model.Goods;
import com.jd.orange.service.FormatService;
import com.jd.orange.service.GoodsService;
import com.jd.orange.service.ImageService;
import com.jd.orange.util.Folder;
import com.jd.orange.util.PictureType;
import com.jd.orange.util.StringUtil.GenerateString;
import com.jd.orange.util.pagehelper.PagedResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    private static final Logger log = LoggerFactory.getLogger(GoodsController.class);

    private ValueFilter filter = new ValueFilter() {
        @Override
        public Object process(Object obj, String s, Object v) {
            if(v==null)
                return "";
            return v;
        }
    };

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private FormatService formatService;

    @Autowired
    private ImageService imageService;

    //跳转到产品列表(后台管理)
    @AdminCheck
    @RequestMapping("/toGoodsList")
    public String toGoodsList(Model model)
    {
        model.addAttribute("count",goodsService.getGoodsCount());
        return "manager/chanpinliebiao";
    }

    //跳转商品详情
    @AdminCheck
    @RequestMapping("/toGoodsDetail/{gid}")
    public String toGoodsDetail(Model model,@PathVariable Integer gid)
    {
        //商品详情
        model.addAttribute("goods",goodsService.getGoods(gid));
        //商品规格
        model.addAttribute("fomats",formatService.formatList(gid));
        //其他商品图片
        model.addAttribute("pictures",imageService.pictures(PictureType.Goods,gid));

        return "manager/goodsDetail";
    }

    //跳转商品添加
    @AdminCheck
    @RequestMapping("/toGoodsAdd")
    public String toGoodsAdd()
    {
        return "manager/goodsAdd";
    }

    //跳转到商品修改
    @AdminCheck
    @RequestMapping("/toGoodsAlter/{gid}")
    public String toGoodsAlter(@PathVariable Integer gid,Model model)
    {
        model.addAttribute("goods",goodsService.getGoods(gid));
        model.addAttribute("formats",formatService.formatList(gid));
        return "manager/goodsAlter";
    }


    //测试页面
    @RequestMapping("/tp")
    public String testPage()
    {
        return "manager/test";
    }

    @RequestMapping("/tp2")
    @ResponseBody
    public String testFile(@RequestParam("file") MultipartFile file )
    {
        log.info(file.getName() + "/" );
        return "t";
    }


    //商品添加
    @RequestMapping("/add")
    @ResponseBody
    public String GoodsInsert(HttpServletRequest request, Goods goods ,@RequestParam("file1") MultipartFile file1
            ,@RequestParam("file2") MultipartFile file2,@RequestParam("file3") MultipartFile file3)
    {
        String ServerPath=null;
        //request.getSession().getServletContext().getRealPath("/") + "goods/"+ title + ".jpg"
        ServerPath=request.getSession().getServletContext().getRealPath("/");
        String[] str = request.getParameterValues("part");
        if(str.length<2)
        {
            return "false";
        }
        else if(str.length==2)
        {
            if(Integer.valueOf(str[1])<0) {
                return "false";
            }
            goods.setPart(Integer.valueOf(str[1]));
        }
        else if(str.length==3)
        {
            if(Integer.valueOf(str[2])<0)
                goods.setPart(Integer.valueOf(str[1]));
            else
                goods.setPart(Integer.valueOf(str[2]));
        }
        else
        {
            return "false";
        }

        if (goodsService.GoodsAdd(goods,file1,file2,file3,ServerPath) > 0)
        {
            return "true";
        }
        return "false";
    }

    //商品其他图片添加
    @RequestMapping("/addOtherPicture")
    @ResponseBody
    public String addGoodsPicture(@RequestParam("file") MultipartFile file,HttpServletRequest request)
    {
        String title= new GenerateString().getUUID() +"."+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        String filepath=request.getSession().getServletContext().getRealPath("/") + Folder.Upload + "/" + title;

        log.info(title+"  "+filepath);

        return "";
    }


    //商品图片删除
    @RequestMapping("/deletePic")
    @ResponseBody
    public String deletePic(Integer gid,String detail)
    {
        //detail:pic1 pic2 pic3
        if( goodsService.goodsPicDel(gid,detail) > 0 )
        {
            return "true";
        }
        return "false";
    }

    //商品图片添加(商品修改)
    @RequestMapping("/updatePic")
    @ResponseBody
    public String updatePic(HttpServletRequest request ,@RequestParam(value = "file") MultipartFile file ,@RequestParam Integer id ,@RequestParam Integer i)
    {
        //i : 第几个图片(i=1 ,i=2 ,i=3)
        String ServerPath=null;
        //request.getSession().getServletContext().getRealPath("/") + "goods/"+ title + ".jpg"
        ServerPath=request.getSession().getServletContext().getRealPath("/");
        if( goodsService.picUpdate(ServerPath,id,i,file) > 0 )
        {
            return "true";
        }
        return "false";
    }

    //获取列表
    @RequestMapping(value = "/getGoodsList" , method = RequestMethod.POST , produces = "text/html;charset=UTF-8;")
    @ResponseBody
    public String getGoodsList(Integer pageNo, Integer pageSize, String key,String start,String end)
    {
        PagedResult<Goods> goodsPagedResult=goodsService.getGoodsList(pageNo,pageSize,key,start,end);
        log.info( JSON.toJSONString(goodsPagedResult, filter) );
        return JSON.toJSONString(goodsPagedResult, filter);
    }

    //商品修改
    @RequestMapping("/update")
    @ResponseBody
    public String goodsUpdate(Goods goods)
    {
        goods.setPic1(null);
        goods.setPic2(null);
        goods.setPic3(null);
        if(goodsService.goodsUpdate(goods) > 0 )
        {
            return "true";
        }
        return "false";
    }

    //商品上架
    @RequestMapping("/load/{gid}")
    @ResponseBody
    public String goodsLoad(@PathVariable Integer gid)
    {
        if( goodsService.GoodsShelf(gid,1) > 0 )
        {
            return "true";
        }
        return "false";
    }

    //商品下架
    @RequestMapping("/under/{gid}")
    @ResponseBody
    public String goodsUnder(@PathVariable Integer gid)
    {
        if( goodsService.GoodsShelf(gid,0) > 0 )
        {
            return "true";
        }
        return "false";
    }

    //商品删除
    @RequestMapping("/del")
    @ResponseBody
    public String goodsDel()
    {
        return "";
    }

    //规格添加
    @RequestMapping("/formatAdd")
    @ResponseBody
    public String formatAdd(Format format)
    {
        //log.info(JSON.toJSONString(format));
        if ( formatService.formatAdd(format) > 0 )
        {
            return "true";
        }
        return "false";
    }

    //规格修改
    public String formatUpdate(Format format)
    {
        if( formatService.formatUpdate(format) > 0 )
        {
            return "true";
        }
        return "false";
    }

    //规格删除
    public String formatDel()
    {
        return "";
    }


}
