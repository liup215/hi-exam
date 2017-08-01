package com.hidear.exam.modular.questionDb.controller;

import com.hidear.exam.common.constant.tip.SuccessTip;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * 题库管理控制器
 *
 * @author fengshuonan
 * @Date 2017-08-01 23:32:10
 */
@Controller
@RequestMapping("/questionDb")
public class QuestionDbController {

    private String PREFIX = "/questionDb/questionDb/";

    /**
     * 跳转到题库管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "questionDb.html";
    }

    /**
     * 跳转到添加题库管理
     */
    @RequestMapping("/questionDb_add")
    public String questionDbAdd() {
        return PREFIX + "questionDb_add.html";
    }

    /**
     * 跳转到修改题库管理
     */
    @RequestMapping("/questionDb_update/{questionDbId}")
    public String questionDbUpdate(@PathVariable Integer questionDbId, Model model) {
        return PREFIX + "questionDb_edit.html";
    }

    /**
     * 获取题库管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return null;
    }

    /**
     * 新增题库管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add() {
        return new SuccessTip();
    }

    /**
     * 删除题库管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete() {
        return new SuccessTip();
    }


    /**
     * 修改题库管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update() {
        return new SuccessTip();
    }

    /**
     * 题库管理详情
     */
    @RequestMapping(value = "/detail")
    @ResponseBody
    public Object detail() {
        return null;
    }
}
