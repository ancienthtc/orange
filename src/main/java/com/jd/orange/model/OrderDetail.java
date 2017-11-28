package com.jd.orange.model;

import java.util.Date;

public class OrderDetail {
    private Integer id;

    private Date paytime;

    private String address;

    private String recipient;

    private String contact;

    private String goodsname;

    private String format;

    private Double amount;

    private Double price;

    private Double freight;

    private Double otherprice;

    private Double scorecost;

    private String logistics;

    private String message;

    private String otherdetail;

    private Integer picture;

    private Integer order;

    private String addressJ;

    private String recipientJ;

    private String goodsnameJ;

    private String formatJ;

    private String logisticsJ;

    private String messageJ;

    private String otherdetailJ;

    private Integer jC;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getPaytime() {
        return paytime;
    }

    public void setPaytime(Date paytime) {
        this.paytime = paytime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient == null ? null : recipient.trim();
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
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

    public Double getFreight() {
        return freight;
    }

    public void setFreight(Double freight) {
        this.freight = freight;
    }

    public Double getOtherprice() {
        return otherprice;
    }

    public void setOtherprice(Double otherprice) {
        this.otherprice = otherprice;
    }

    public Double getScorecost() {
        return scorecost;
    }

    public void setScorecost(Double scorecost) {
        this.scorecost = scorecost;
    }

    public String getLogistics() {
        return logistics;
    }

    public void setLogistics(String logistics) {
        this.logistics = logistics == null ? null : logistics.trim();
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

    public String getAddressJ() {
        return addressJ;
    }

    public void setAddressJ(String addressJ) {
        this.addressJ = addressJ == null ? null : addressJ.trim();
    }

    public String getRecipientJ() {
        return recipientJ;
    }

    public void setRecipientJ(String recipientJ) {
        this.recipientJ = recipientJ == null ? null : recipientJ.trim();
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

    public String getLogisticsJ() {
        return logisticsJ;
    }

    public void setLogisticsJ(String logisticsJ) {
        this.logisticsJ = logisticsJ == null ? null : logisticsJ.trim();
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