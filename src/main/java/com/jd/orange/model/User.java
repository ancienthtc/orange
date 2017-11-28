package com.jd.orange.model;

import java.util.Date;

public class User {
    private Integer id;

    private String nickname;

    private String email;

    private String realname;

    private String tel;

    private String phone;

    private String gender;

    private Date birth;

    private String password;

    private String checkcode;

    private Date logintime;

    private Integer score;

    private Date invalid;

    private Integer picture;

    private Date createtime;

    private Date updatetime;

    private String nicknameJ;

    private String realnameJ;

    private String genderJ;

    private Integer jC;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getCheckcode() {
        return checkcode;
    }

    public void setCheckcode(String checkcode) {
        this.checkcode = checkcode == null ? null : checkcode.trim();
    }

    public Date getLogintime() {
        return logintime;
    }

    public void setLogintime(Date logintime) {
        this.logintime = logintime;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Date getInvalid() {
        return invalid;
    }

    public void setInvalid(Date invalid) {
        this.invalid = invalid;
    }

    public Integer getPicture() {
        return picture;
    }

    public void setPicture(Integer picture) {
        this.picture = picture;
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

    public String getNicknameJ() {
        return nicknameJ;
    }

    public void setNicknameJ(String nicknameJ) {
        this.nicknameJ = nicknameJ == null ? null : nicknameJ.trim();
    }

    public String getRealnameJ() {
        return realnameJ;
    }

    public void setRealnameJ(String realnameJ) {
        this.realnameJ = realnameJ == null ? null : realnameJ.trim();
    }

    public String getGenderJ() {
        return genderJ;
    }

    public void setGenderJ(String genderJ) {
        this.genderJ = genderJ == null ? null : genderJ.trim();
    }

    public Integer getjC() {
        return jC;
    }

    public void setjC(Integer jC) {
        this.jC = jC;
    }
}