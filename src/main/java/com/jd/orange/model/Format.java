package com.jd.orange.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Format {
    private Integer id;

    private String fname;

    private String fclass;

    private Double price;

    private Double stock;

    private Double sales;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updatetime;

    private Integer goods;

    private String fnameJ;

    private String fclassJ;

    private Integer jC;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname == null ? null : fname.trim();
    }

    public String getFclass() {
        return fclass;
    }

    public void setFclass(String fclass) {
        this.fclass = fclass == null ? null : fclass.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getStock() {
        return stock;
    }

    public void setStock(Double stock) {
        this.stock = stock;
    }

    public Double getSales() {
        return sales;
    }

    public void setSales(Double sales) {
        this.sales = sales;
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

    public Integer getGoods() {
        return goods;
    }

    public void setGoods(Integer goods) {
        this.goods = goods;
    }

    public String getFnameJ() {
        return fnameJ;
    }

    public void setFnameJ(String fnameJ) {
        this.fnameJ = fnameJ == null ? null : fnameJ.trim();
    }

    public String getFclassJ() {
        return fclassJ;
    }

    public void setFclassJ(String fclassJ) {
        this.fclassJ = fclassJ == null ? null : fclassJ.trim();
    }

    public Integer getjC() {
        return jC;
    }

    public void setjC(Integer jC) {
        this.jC = jC;
    }
}