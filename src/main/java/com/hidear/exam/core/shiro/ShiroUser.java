package com.hidear.exam.core.shiro;

import java.io.Serializable;

/**
 * Created by acer on 2017/11/27.
 */
public class ShiroUser extends BaseShiro implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;          // 主键ID
    private String username;      // 账号
    private String nickname;         // 姓名
    private String truename;//真实姓名
    private String phoneNumber;//手机号码
    private String password;
    private Integer userType;//用户所属类型
    private String avatar;//头像地址
    private Long lastLoginTime;//上次登录时间
    private Double coin;//金币数
    private String salt;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Long getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Long lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Double getCoin() {
        return coin;
    }

    public void setCoin(Double coin) {
        this.coin = coin;
    }

    @Override
    public String toString() {
        return "ShiroUser{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", nickname='" + nickname + '\'' +
                ", truename='" + truename + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", password='" + password + '\'' +
                ", userType='" + userType + '\'' +
                ", avatar='" + avatar + '\'' +
                ", lastLoginTime=" + lastLoginTime +
                ", coin=" + coin +
                ", salt='" + salt + '\'' +
                '}';
    }
}
