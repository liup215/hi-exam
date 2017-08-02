package com.hidear.exam.modular.questionDb.model;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/8/2.
 */

@Entity
@Table(name="tm_question_db")
public class QuestionDB {

    @Id
    @GeneratedValue
    @Column(name="id",nullable = false,length = 65)
    private Integer id;

    @Column(name="name",nullable = false,length = 65)
    private String name;

    @Column(name="logo",nullable = false,length = 65)
    private String logo;

    @Column(name="grade_leve",nullable = false,length = 65)
    private Integer gradeLevel;

    @Column(name="subject",nullable = false,length = 65)
    private Integer subject;

    @Column(name="status",nullable = false,length = 65)
    private Integer status;

    @Column(name="poster",nullable = false,length = 65)
    private String poster;

    @Column(name="c_date",nullable = false,length = 65)
    private Long cDate;

    @Column(name="last_modifyor",nullable = false,length = 65)
    private String lastModifyor;

    @Column(name="last_m_date",nullable = false,length = 65)
    private Long lastModifyDate;

    public QuestionDB() {
    }

    public QuestionDB(String name, String logo, Integer status, String poster, Long cDate, String lastModifyor, Long lastModifyDate, Integer gradeLevel, Integer subject) {
        this.name = name;
        this.logo = logo;
        this.status = status;
        this.poster = poster;
        this.cDate = cDate;
        this.lastModifyor = lastModifyor;
        this.lastModifyDate = lastModifyDate;
        this.gradeLevel = gradeLevel;
        this.subject = subject;
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

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public Long getcDate() {
        return cDate;
    }

    public void setcDate(Long cDate) {
        this.cDate = cDate;
    }

    public String getLastModifyor() {
        return lastModifyor;
    }

    public void setLastModifyor(String lastModifyor) {
        this.lastModifyor = lastModifyor;
    }

    public Long getLastModifyDate() {
        return lastModifyDate;
    }

    public void setLastModifyDate(Long lastModifyDate) {
        this.lastModifyDate = lastModifyDate;
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

    @Override
    public String toString() {
        return "QuestionDB{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", logo='" + logo + '\'' +
                ", status=" + status +
                ", poster='" + poster + '\'' +
                ", cDate=" + cDate +
                ", lastModifyor='" + lastModifyor + '\'' +
                ", lastModifyDate=" + lastModifyDate +
                ", gradeLevel=" + gradeLevel +
                ", subject=" + subject +
                '}';
    }
}
