package com.baizhi.entity;

import java.util.Date;

public class User {
    private String id;
    private String headPic;
    private String phoneNum;
    private String username;
    private String password;
    private String nickName;
    private String sex;
    private String addr;
    private String sign;
    private String status;
    private Date createDate;
    private String salt;

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", headPic='" + headPic + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickName='" + nickName + '\'' +
                ", sex='" + sex + '\'' +
                ", addr='" + addr + '\'' +
                ", sign='" + sign + '\'' +
                ", status='" + status + '\'' +
                ", createDate=" + createDate +
                ", salt='" + salt + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public User(String headPic, String phoneNum, String username, String password, String nickName, String sex, String addr, String sign, String status) {
        this.headPic = headPic;
        this.phoneNum = phoneNum;
        this.username = username;
        this.password = password;
        this.nickName = nickName;
        this.sex = sex;
        this.addr = addr;
        this.sign = sign;
        this.status = status;
    }

    public User(String id, String headPic, String phoneNum, String username, String password, String nickName, String sex, String addr, String sign, String status, Date createDate, String salt) {
        this.id = id;
        this.headPic = headPic;
        this.phoneNum = phoneNum;
        this.username = username;
        this.password = password;
        this.nickName = nickName;
        this.sex = sex;
        this.addr = addr;
        this.sign = sign;
        this.status = status;
        this.createDate = createDate;
        this.salt = salt;
    }

    public User() {
    }
}
