package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.ValueFilter;
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

@Controller
@RequestMapping("/goods")
public class GoodsController {

    private static final Logger log = LoggerFactory.getLogger(PartController.class);

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
    @RequestMapping("/toGoodsList")
    public String toGoodsList(Model model)
    {
        model.addAttribute("count",goodsService.getGoodsCount());
        return "manager/chanpinliebiao";
    }

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

    //测试页面
    @RequestMapping("/tp")
    public String testPage()
    {
        return "manager/test";
    }

    @RequestMapping("/tp2")
    @ResponseBody
    public String testFile(@RequestParam("file") MultipartFile file)
    {
        log.info(file.getName());
        return "t";
    }


    //商品添加
    @RequestMapping("/add")
    public String GoodsInsert(HttpServletRequest request, Goods goods ,@RequestParam("file1") MultipartFile file1
            ,@RequestParam("file2") MultipartFile file2,@RequestParam("file3") MultipartFile file3)
    {
        String filePath=null;
        //request.getSession().getServletContext().getRealPath("/") + "goods/"+ title
        //request.getSession().getServletContext().getRealPath("/") + "upload/"+ title


        return "";
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

    //获取列表
    @RequestMapping(value = "/getGoodsList" , method = RequestMethod.POST)
    @ResponseBody
    public String getGoodsList(Integer pageNo, Integer pageSize, String key,String start,String end)
    {
        PagedResult<Goods> goodsPagedResult=goodsService.getGoodsList(pageNo,pageSize,key,start,end);
        //log.info( JSON.toJSONString(goodsPagedResult, filter) );
        return JSON.toJSONString(goodsPagedResult, filter);
    }

    //商品修改
    @RequestMapping("/update")
    @ResponseBody
    public String goodsUpdate(Goods goods)
    {
        return "";
    }

    //商品上架
    @RequestMapping("/load")
    @ResponseBody
    public String goodsLoad()
    {
        return "";
    }

    //商品下架
    @RequestMapping("/under")
    @ResponseBody
    public String goodsUnder()
    {
        return "";
    }

    //商品删除
    @RequestMapping("/del")
    @ResponseBody
    public String goodsDel()
    {
        return "";
    }

    //规格添加
    public String formatAdd()
    {
        return "";
    }

    //规格修改
    public String formatUpdate()
    {
        return "";
    }

    //规格删除
    public String formatDel()
    {
        return "";
    }


}
