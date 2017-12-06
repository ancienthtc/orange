package com.jd.orange.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Address {
    private Integer id;

    private String province;

    private String city;

    private String area;

    private String detail;

    private String zip;

    private String recipient;

    private String tel;

    private String phone;

    private Integer ismain;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updatetime;

    private Integer user;

    private String provinceJ;

    private String cityJ;

    private String areaJ;

    private String detailJ;

    private String recipientJ;

    private Integer jC;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip == null ? null : zip.trim();
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient == null ? null : recipient.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getIsmain() {
        return ismain;
    }

    public void setIsmain(Integer ismain) {
        this.ismain = ismain;
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

    public String getProvinceJ() {
        return provinceJ;
    }

    public void setProvinceJ(String provinceJ) {
        this.provinceJ = provinceJ == null ? null : provinceJ.trim();
    }

    public String getCityJ() {
        return cityJ;
    }

    public void setCityJ(String cityJ) {
        this.cityJ = cityJ == null ? null : cityJ.trim();
    }

    public String getAreaJ() {
        return areaJ;
    }

    public void setAreaJ(String areaJ) {
        this.areaJ = areaJ == null ? null : areaJ.trim();
    }

    public String getDetailJ() {
        return detailJ;
    }

    public void setDetailJ(String detailJ) {
        this.detailJ = detailJ == null ? null : detailJ.trim();
    }

    public String getRecipientJ() {
        return recipientJ;
    }

    public void setRecipientJ(String recipientJ) {
        this.recipientJ = recipientJ == null ? null : recipientJ.trim();
    }

    public Integer getjC() {
        return jC;
    }

    public void setjC(Integer jC) {
        this.jC = jC;
    }
}