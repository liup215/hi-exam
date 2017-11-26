package com.hidear.exam.modular.base.model;

import javax.persistence.*;

/**
 * Created by acer on 2017/11/26.
 */

@Entity
@Table(name="tm_testing_point")
public class TestingPoint {

    @Id
    @GeneratedValue
    @Column(name = "id",nullable = false)
    private Integer id;

    @Column(name = "name",nullable = false)
    private String name;

    @Column(name = "grade_level",nullable = false)
    private Integer gradeLevel;

    @Column(name = "subject",nullable = false)
    private Integer subject;

    public TestingPoint() {
    }

    public TestingPoint(String name, Integer gradeLevel, Integer subject) {
        this.name = name;
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
        return "TestingPoint{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gradeLevel=" + gradeLevel +
                ", subject=" + subject +
                '}';
    }
}
