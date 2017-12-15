package com.jd.orange.util;

public enum PictureType {

    //规定图片存储的类型
    Goods("goods"),Part("part"),User("user"),Other("other");

    private String value;

    PictureType(String value) {
        this.value = value;
    }

    public String getVal() {
        return value;
    }

}
