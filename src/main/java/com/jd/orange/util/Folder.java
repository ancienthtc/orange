package com.jd.orange.util;

public enum Folder {

    //规定图片资源文件夹

    GoodsDetail("description\\"),Upload("upload\\"),Default("images\\"),Order("orders\\");
    //图片描述文件夹
    //普通图片上传
    //默认文件夹

    private String value;

    Folder(String value) {
        this.value = value;
    }

    public String getVal() {
        return value;
    }

}
