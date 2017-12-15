package com.jd.orange.service;

import com.jd.orange.model.Format;

import java.util.List;

/**
 * Created by ThinkPad on 2017/11/28.
 */
public interface FormatService {

    //商品规格集
    List<Format> formatList(Integer gid);

}
