package com.hidear.exam.modular.base.model;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/8/3.
 */

@Entity
@Table(name="tm_text_book")
public class TextBook {

    @Id
    @GeneratedValue
    @Column(name="id",nullable = false,length = 65)
    private Integer id;

    @Column(name="name",nullable = false,length = 65)
    private String name;

    @Column(name="grade_level",nullable = false,length = 65)
    private Integer gradeLevel;

    @Column(name="subject",nullable = false,length = 65)
    private Integer subject;

    @Column(name="logo",nullable = false,length = 65)
    private String logo;

    @Column(name="status",nullable = false,length = 65)
    private Integer status;

    public TextBook() {
    }

    public TextBook(String name, Integer gradeLevel, Integer subject, String logo, Integer status) {
        this.name = name;
        this.gradeLevel = gradeLevel;
        this.subject = subject;
        this.logo = logo;
        this.status = status;
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

    public Integer getGradeLevel() {
        return gradeLevel;
    }

    public void setGradeLevel(Integer gradeLevel) {
        this.gradeLevel = gradeLevel;
    }

    public Integer getSubject() {
        return subject;
    }

    public void setSubject(Integer subject) {
        this.subject = subject;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "TextBook{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gradeLevel=" + gradeLevel +
                ", subject=" + subject +
                ", logo='" + logo + '\'' +
                ", status=" + status +
                '}';
    }
}
