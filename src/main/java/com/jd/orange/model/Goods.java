package com.jd.orange.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Transient;
import java.util.Date;

public class Goods {
    private Integer id;

    private String name;

    private Double freight;

    private String parameter1;

    private String parameter2;

    private String parameter3;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date shelf;

    private String detail;

    private String pic1;

    private String pic2;

    private String pic3;

    private Integer picture;

    private Integer recommend;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updatetime;

    private Integer part;

    private String nameJ;

    private String parameter1J;

    private String parameter2J;

    private String parameter3J;

    private String detailJ;

    private Integer jC;

    @Transient
    private String pname;//分类名称

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Double getFreight() {
        return freight;
    }

    public void setFreight(Double freight) {
        this.freight = freight;
    }

    public String getParameter1() {
        return parameter1;
    }

    public void setParameter1(String parameter1) {
        this.parameter1 = parameter1 == null ? null : parameter1.trim();
    }

    public String getParameter2() {
        return parameter2;
    }

    public void setParameter2(String parameter2) {
        this.parameter2 = parameter2 == null ? null : parameter2.trim();
    }

    public String getParameter3() {
        return parameter3;
    }

    public void setParameter3(String parameter3) {
        this.parameter3 = parameter3 == null ? null : parameter3.trim();
    }

    public Date getShelf() {
        return shelf;
    }

    public void setShelf(Date shelf) {
        this.shelf = shelf;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public String getPic1() {
        return pic1;
    }

    public void setPic1(String pic1) {
        this.pic1 = pic1 == null ? null : pic1.trim();
    }

    public String getPic2() {
        return pic2;
    }

    public void setPic2(String pic2) {
        this.pic2 = pic2 == null ? null : pic2.trim();
    }

    public String getPic3() {
        return pic3;
    }

    public void setPic3(String pic3) {
        this.pic3 = pic3 == null ? null : pic3.trim();
    }

    public Integer getPicture() {
        return picture;
    }

    public void setPicture(Integer picture) {
        this.picture = picture;
    }

    public Integer getRecommend() {
        return recommend;
    }

    public void setRecommend(Integer recommend) {
        this.recommend = recommend;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getPart() {
        return part;
    }

    public void setPart(Integer part) {
        this.part = part;
    }

    public String getNameJ() {
        return nameJ;
    }

    public void setNameJ(String nameJ) {
        this.nameJ = nameJ == null ? null : nameJ.trim();
    }

    public String getParameter1J() {
        return parameter1J;
    }

    public void setParameter1J(String parameter1J) {
        this.parameter1J = parameter1J == null ? null : parameter1J.trim();
    }

    public String getParameter2J() {
        return parameter2J;
    }

    public void setParameter2J(String parameter2J) {
        this.parameter2J = parameter2J == null ? null : parameter2J.trim();
    }

    public String getParameter3J() {
        return parameter3J;
    }

    public void setParameter3J(String parameter3J) {
        this.parameter3J = parameter3J == null ? null : parameter3J.trim();
    }

    public String getDetailJ() {
        return detailJ;
    }

    public void setDetailJ(String detailJ) {
        this.detailJ = detailJ == null ? null : detailJ.trim();
    }

    public Integer getjC() {
        return jC;
    }

    public void setjC(Integer jC) {
        this.jC = jC;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }
}