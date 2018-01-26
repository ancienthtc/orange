package com.jd.orange.common;

public enum Alevel {

    L1(0), L2(1),L3(2),L4(3);    //    调用构造函数来构造枚举项

    private int value = 0;

    Alevel(int value) {    //    必须是private的，否则编译错误
        this.value = value;
    }

    public static Alevel valueOf(int value) {    //    手写的从int到enum的转换函数
        switch (value) {
            case 0:
                return L1;
            case 1:
                return L2;
            case 2:
                return L3;
            case 3:
                return L4;
            default:
                return null;
        }
    }

    public int value() {
        return this.value;
    }

}
