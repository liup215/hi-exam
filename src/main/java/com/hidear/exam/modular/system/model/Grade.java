package com.hidear.exam.modular.system.model;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/7/24.
 */

@Entity
@Table(name="tm_grade")
public class Grade {

    @Id
    @GeneratedValue
    @Column(name="id",nullable = false,length = 65)
    private Integer id;

    @Column(name="name",nullable = false,length = 11)
    private String name;

    @Column(name="level",nullable = false,length=11)
    private Integer level;

    @Column(name="status",nullable = false,length = 11)
    private Integer status;

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

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getStatus() {

        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", level='" + level + '\'' +
                ", status=" + status +
                '}';
    }
}
