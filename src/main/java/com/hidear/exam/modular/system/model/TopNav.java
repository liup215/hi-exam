package com.hidear.exam.modular.system.model;

import javax.persistence.*;

/**
 * Created by acer on 2017/11/26.
 */
@Entity
@Table(name="tm_topnav")
public class TopNav {

    @Id
    @GeneratedValue
    @Column(name="id",nullable = false)
    private Integer id;

    @Column(name="name",nullable = false)
    private String name;

    @Column(name="UserType",nullable = false)
    private Integer userType;

    @Column(name="url",nullable = false)
    private String url;

    public TopNav() {
    }

    public TopNav(String name, Integer userType, String url) {
        this.name = name;
        this.userType = userType;
        this.url = url;
    }

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
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "TopNav{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", UserType=" + userType +
                ", url='" + url + '\'' +
                '}';
    }
}
