package com.hidear.exam.core.shiro;

import java.io.Serializable;

/**
 * Created by acer on 2017/11/27.
 */
public class ShiroAdmin extends BaseShiro implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String username;
    private String password;
    private String salt;

    public ShiroAdmin() {
    }

    public ShiroAdmin(Integer id, String username, String password, String salt) {

        this.id = id;
        this.username = username;
        this.password = password;
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

    @Override
    public String toString() {
        return "ShiroAdmin{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                '}';
    }
}
