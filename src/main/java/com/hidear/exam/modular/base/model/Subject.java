package com.hidear.exam.modular.base.model;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/8/1.
 */

@Entity
@Table(name = "tm_subject")
public class Subject {

    @Id
    @GeneratedValue
    @Column(name = "id",nullable = false,length = 65)
    private Integer id;

    @Column(name = "name",nullable = false,length = 11)
    private String name;

    @Column(name = "status",nullable = false,length = 11)
    private Integer status;

    public Subject() {
    }

    public Subject(String name, Integer status) {

        this.name = name;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Subject{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", status=" + status +
                '}';
    }
}
