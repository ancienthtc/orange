package com.jd.orange.util;

public enum Folder {

    //规定图片资源文件夹

    GoodsDetail("/description"),Upload("/upload"),Default("/images");

    private String value;

    Folder(String value) {
        this.value = value;
    }

    public String getVal() {
        return value;
    }

}
