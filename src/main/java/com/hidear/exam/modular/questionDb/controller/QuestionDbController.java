package com.hidear.exam.modular.questionDb.controller;

import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.common.exception.BussinessException;
import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.core.util.ToolUtil;
import com.hidear.exam.modular.base.dao.SubjectRepository;
import com.hidear.exam.modular.base.model.Subject;
import com.hidear.exam.modular.base.status.GradeLevel;
import com.hidear.exam.modular.questionDb.dao.QuestionDBRepository;
import com.hidear.exam.modular.questionDb.model.QuestionDB;
import com.hidear.exam.modular.questionDb.wrapper.QuestionDBWrapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import javax.validation.Valid;
import java.util.*;

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

    @Autowired
    QuestionDBRepository questionDBRepository;

    @Autowired
    SubjectRepository subjectRepository;

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
    public String questionDbAdd(Model model) {

        List<Subject> subjects = subjectRepository.findAll();
        GradeLevel[] gradeLevels = GradeLevel.values();
        model.addAttribute("gradeLevels",gradeLevels);
        model.addAttribute("subjects",subjects);

        return PREFIX + "questionDb_add.html";
    }

    /**
     * 跳转到修改题库管理
     */
    @RequestMapping("/questionDb_update/{questionDbId}")
    public String questionDbUpdate(@PathVariable Integer questionDbId, Model model) {
        if(ToolUtil.isEmpty(questionDbId)){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        QuestionDB db = questionDBRepository.findOne(questionDbId);
        Map<String,Object> map = BeanKit.beanToMap(db);
        model.addAttribute("questionDb",map);

        List<Subject> subjects = subjectRepository.findAll();
        GradeLevel[] gradeLevels = GradeLevel.values();
        model.addAttribute("gradeLevels",gradeLevels);
        model.addAttribute("subjects",subjects);

        return PREFIX + "questionDb_edit.html";
    }

    /**
     * 获取题库管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String condition) {
        List<Map<String,Object>> maps = new ArrayList<>();
        List<QuestionDB> dbs = questionDBRepository.findAll();

        for(QuestionDB db:dbs){
            Map<String,Object> map = BeanKit.beanToMap(db);
            maps.add(map);
        }

        return (new QuestionDBWrapper(maps)).warp();
    }

    /**
     * 新增题库管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Tip add(@Valid QuestionDB questionDB, BindingResult result) {
        if(result.hasErrors()){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        questionDB.setPoster("admin");
        questionDB.setcDate((new Date().getTime()));
        questionDB.setLastModifyDate(new Date().getTime());
        questionDB.setLastModifyor("admin");

        questionDBRepository.save(questionDB);

        return new SuccessTip();
    }

    /**
     * 删除题库管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Tip delete(@RequestParam Integer questionDbId) {
        if(ToolUtil.isEmpty(questionDbId)){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        questionDBRepository.delete(questionDbId);

        return new SuccessTip();
    }


    /**
     * 修改题库管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Tip update(@Valid QuestionDB questionDB,BindingResult result) {

        if(result.hasErrors()){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        questionDB.setLastModifyor("admin");
        questionDB.setLastModifyDate((new Date().getTime()));
        questionDB.setcDate(questionDBRepository.findOne(questionDB.getId()).getcDate());
        questionDB.setPoster(questionDBRepository.findOne(questionDB.getId()).getPoster());
        questionDBRepository.save(questionDB);
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
