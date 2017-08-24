package com.hidear.exam.modular.teacher.model;

import org.hibernate.annotations.Type;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/8/24.
 */
@Entity
@Table(name="tm_teacher")
public class Teacher {

    @Id
    @GeneratedValue
    @Column(name="id",nullable = false,length = 65)
    private Integer id;

    @Column(name="name",nullable = false,length = 65)
    private String name;

    @Column(name="phone",nullable = false,length = 65)
    private String phone;

    @Type(type = "text")
    @Column(name="info",nullable = false)
    private String info;

    @Column(name="photo",nullable = false,length = 65)
    private String photo;

    @Column(name="status",nullable = false,length = 65)
    private Integer status;

    @Column(name="c_time",nullable = false,length = 65)
    private Long cTime;

    @Column(name="m_time",nullable = false,length = 65)
    private Long mTime;

    public Teacher() {
    }

    public Teacher(String name, String phone, String info, String photo, Integer status, Long cTime, Long mTime) {

        this.name = name;
        this.phone = phone;
        this.info = info;
        this.photo = photo;
        this.status = status;
        this.cTime = cTime;
        this.mTime = mTime;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getcTime() {
        return cTime;
    }

    public void setcTime(Long cTime) {
        this.cTime = cTime;
    }

    public Long getmTime() {
        return mTime;
    }

    public void setmTime(Long mTime) {
        this.mTime = mTime;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", info='" + info + '\'' +
                ", photo='" + photo + '\'' +
                ", status=" + status +
                ", cTime=" + cTime +
                ", mTime=" + mTime +
                '}';
    }
}
