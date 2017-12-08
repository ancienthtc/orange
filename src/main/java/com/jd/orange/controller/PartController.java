package com.jd.orange.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.jd.orange.model.Part;
import com.jd.orange.service.PartService;
import com.jd.orange.util.pagehelper.PagedResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/part")
public class PartController {

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
    private PartService partService;

    //后台页面板块页面
    @RequestMapping("/toPartList")
    public String toBackPartPage()
    {
        return "manager/Products_List";
    }

    //创建分类(frame)
    @RequestMapping("/toPartAddFrame")
    public String toBackPartCreate()
    {
        return "manager/Category_Manage";
    }

    //创建分类(内容)
    @RequestMapping("/toPartAdd")
    public String toBackPartCreate2(Model model)
    {
        //获取一级联动分类列表
        List<Part> parts=partService.getFatherPart();
        model.addAttribute("parts",parts);

        return "manager/product-category-add";
    }


    //添加
    @RequestMapping("/add")
    //@ResponseBody
    public String partInsert(Part part, HttpServletRequest request)
    {
        //log.info(part.getBelong().toString());
        String[] str = request.getParameterValues("belong");    //多个同name select处理
        if(str.length>=1)
        {
            if(str.length==2) //{xx,-2}
            {
                if(str[1].equals("-2"))
                {
                    part.setBelong(Integer.valueOf(str[0]));//创建二级子类
                    part.setLevel(1);
                }
                else
                {
                    part.setBelong(Integer.valueOf(str[1]));//创建三级子类
                    part.setLevel(2);
                }
            }
            else    //{xx}
            {
                if(str[0].equals("-1"))
                {
                    part.setBelong( null );//创建一级父类
                    part.setLevel(0);
                }
            }
        }
        partService.PartAdd(part);
        return "redirect:/part/toPartAdd";
        //return "manager/product-category-add";
    }

    //获取分类(子分类)
    @RequestMapping("/getPartChoice")
    @ResponseBody
    public String getLevelPart(Integer id)
    {
        //log.info(id.toString());
        List<Part> child_parts = partService.getChildPart(id);
        //log.info(JSON.toJSONString(child_parts));
        return JSON.toJSONString(child_parts);
    }

    //获取分类列表
    @RequestMapping(value = "/getInitList" , method = RequestMethod.POST)
    @ResponseBody
    public String getPartList(Integer pageNo, Integer pageSize, String key) {
        PagedResult<Part> pagedResult=partService.getParts(pageNo,pageSize,key);
        //log.info(JSON.toJSONString(pagedResult));
        //return JSON.toJSONString(pagedResult, SerializerFeature.WriteMapNullValue);
        //        QuoteFieldNames———-输出key时是否使用双引号,默认为true
        //        WriteMapNullValue——–是否输出值为null的字段,默认为false
        //        WriteNullNumberAsZero—-数值字段如果为null,输出为0,而非null
        //        WriteNullListAsEmpty—–List字段如果为null,输出为[],而非null
        //        WriteNullStringAsEmpty—字符类型字段如果为null,输出为”“,而非null
        //        WriteNullBooleanAsFalse–Boolean字段如果为null,输出为false,而非null
        return JSON.toJSONString(pagedResult, filter);
    }

}