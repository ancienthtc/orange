package com.jd.orange.model;

public class OrderDetail {
    private Integer id;

    private String goodsname;

    private String format;

    private Double amount;

    private Double price;

    private String message;

    private String otherdetail;

    private Integer picture;

    private Integer order;

    private String goodsnameJ;

    private String formatJ;

    private String messageJ;

    private String otherdetailJ;

    private Integer jC;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname == null ? null : goodsname.trim();
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format == null ? null : format.trim();
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    public String getOtherdetail() {
        return otherdetail;
    }

    public void setOtherdetail(String otherdetail) {
        this.otherdetail = otherdetail == null ? null : otherdetail.trim();
    }

    public Integer getPicture() {
        return picture;
    }

    public void setPicture(Integer picture) {
        this.picture = picture;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public String getGoodsnameJ() {
        return goodsnameJ;
    }

    public void setGoodsnameJ(String goodsnameJ) {
        this.goodsnameJ = goodsnameJ == null ? null : goodsnameJ.trim();
    }

    public String getFormatJ() {
        return formatJ;
    }

    public void setFormatJ(String formatJ) {
        this.formatJ = formatJ == null ? null : formatJ.trim();
    }

    public String getMessageJ() {
        return messageJ;
    }

    public void setMessageJ(String messageJ) {
        this.messageJ = messageJ == null ? null : messageJ.trim();
    }

    public String getOtherdetailJ() {
        return otherdetailJ;
    }

    public void setOtherdetailJ(String otherdetailJ) {
        this.otherdetailJ = otherdetailJ == null ? null : otherdetailJ.trim();
    }

    public Integer getjC() {
        return jC;
    }

    public void setjC(Integer jC) {
        this.jC = jC;
    }
}