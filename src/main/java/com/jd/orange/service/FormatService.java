package com.jd.orange.service;

import com.jd.orange.model.Format;

import java.util.List;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface FormatService {

    //商品规格集
    List<Format> formatList(Integer gid);

    //规格添加
    int formatAdd(Format format);

    //规格修改
    int formatUpdate(Format format);

    //规格删除
    int formatDel(Integer fid);
}
