package com.hidear.exam.modular.base.model;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/8/18.
 */

@Entity
@Table(name="tm_chapter")
public class Chapter {

    @Id
    @GeneratedValue
    @Column(name="id",nullable = false,length = 65)
    private Integer id;

    @Column(name="name",nullable = false,length = 65)
    private Integer name;

    @Column(name="text_book_id",nullable = false,length = 65)
    private Integer textBookId;

    @Column(name="code",nullable = false,length = 65)
    private String code;

    @Column(name="pcode",nullable = false,length = 65)
    private String pcode;

    @Column(name="pcodes",nullable = false,length = 65)
    private String pcodes;

    @Column(name="num",nullable = false,length = 65)
    private Integer num;

    @Column(name="levels",nullable = false,length = 65)
    private Integer levels;

    @Column(name="tips",nullable = false,length = 65)
    private String tips;

    @Column(name="status",nullable = false,length = 65)
    private Integer status;

    public Chapter() {
    }

    public Chapter(Integer name, Integer textBookId, String code, String pcode, String pcodes, Integer num, Integer levels, String tips, Integer status) {

        this.name = name;
        this.textBookId = textBookId;
        this.code = code;
        this.pcode = pcode;
        this.pcodes = pcodes;
        this.num = num;
        this.levels = levels;
        this.tips = tips;
        this.status = status;
    }

    public Integer getId() {

        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getName() {
        return name;
    }

    public void setName(Integer name) {
        this.name = name;
    }

    public Integer getTextBookId() {
        return textBookId;
    }

    public void setTextBookId(Integer textBookId) {
        this.textBookId = textBookId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public String getPcodes() {
        return pcodes;
    }

    public void setPcodes(String pcodes) {
        this.pcodes = pcodes;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getLevels() {
        return levels;
    }

    public void setLevels(Integer levels) {
        this.levels = levels;
    }

    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Chapter{" +
                "id=" + id +
                ", name=" + name +
                ", textBookId=" + textBookId +
                ", code='" + code + '\'' +
                ", pcode='" + pcode + '\'' +
                ", pcodes='" + pcodes + '\'' +
                ", num=" + num +
                ", levels=" + levels +
                ", tips='" + tips + '\'' +
                ", status=" + status +
                '}';
    }
}
