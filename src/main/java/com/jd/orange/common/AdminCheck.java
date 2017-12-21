package com.jd.orange.common;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)//注解会在class中存在，运行时可通过反射获取
@Target(ElementType.METHOD)//目标是方法
@Documented//文档生成时，该注解将被包含在javadoc中，可去掉
public @interface AdminCheck {
    /**
     * 模块名字
     */
    //String modelName() default "";

    /**
     * 操作类型
     */
    //String option();

    //等级
    //int level();
}