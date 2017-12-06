package com.jd.orange.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Order {
    private Integer id;

    private String sequence;

    private Integer buyway;

    private Integer shopstatus;

    private Integer orderstatus;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date paytime;

    private Double goodsprice;

    private Double freight;

    private Double otherprice;

    private Double scorecost;

    private Double allprice;

    private String address;

    private String recipient;

    private String contact;

    private String logistics;

    private String returndetail;

    private String addressJ;

    private String recipientJ;

    private String logisticsJ;

    private String returndetailJ;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updatetime;

    private Integer user;

    private Integer jC;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSequence() {
        return sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence == null ? null : sequence.trim();
    }

    public Integer getBuyway() {
        return buyway;
    }

    public void setBuyway(Integer buyway) {
        this.buyway = buyway;
    }

    public Integer getShopstatus() {
        return shopstatus;
    }

    public void setShopstatus(Integer shopstatus) {
        this.shopstatus = shopstatus;
    }

    public Integer getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(Integer orderstatus) {
        this.orderstatus = orderstatus;
    }

    public Date getPaytime() {
        return paytime;
    }

    public void setPaytime(Date paytime) {
        this.paytime = paytime;
    }

    public Double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(Double goodsprice) {
        this.goodsprice = goodsprice;
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

    public Double getAllprice() {
        return allprice;
    }

    public void setAllprice(Double allprice) {
        this.allprice = allprice;
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

    public String getLogistics() {
        return logistics;
    }

    public void setLogistics(String logistics) {
        this.logistics = logistics == null ? null : logistics.trim();
    }

    public String getReturndetail() {
        return returndetail;
    }

    public void setReturndetail(String returndetail) {
        this.returndetail = returndetail == null ? null : returndetail.trim();
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

    public String getLogisticsJ() {
        return logisticsJ;
    }

    public void setLogisticsJ(String logisticsJ) {
        this.logisticsJ = logisticsJ == null ? null : logisticsJ.trim();
    }

    public String getReturndetailJ() {
        return returndetailJ;
    }

    public void setReturndetailJ(String returndetailJ) {
        this.returndetailJ = returndetailJ == null ? null : returndetailJ.trim();
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

    public Integer getUser() {
        return user;
    }

    public void setUser(Integer user) {
        this.user = user;
    }

    public Integer getjC() {
        return jC;
    }

    public void setjC(Integer jC) {
        this.jC = jC;
    }
}