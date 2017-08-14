package com.hidear.exam.modular.base.controller;

import com.alibaba.druid.sql.visitor.functions.Bin;
import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.common.exception.BussinessException;
import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.core.util.ToolUtil;
import com.hidear.exam.modular.base.dao.SubjectRepository;
import com.hidear.exam.modular.base.model.Subject;
import com.hidear.exam.modular.base.status.GradeLevel;
import com.hidear.exam.modular.base.status.GradeStatus;
import com.hidear.exam.modular.base.wrapper.SubjectWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 科目管理控制器
 *
 * @author fengshuonan
 * @Date 2017-08-01 16:38:46
 */
@Controller
@RequestMapping("/subject")
public class SubjectController {

    private String PREFIX = "/base/subject/";

    @Autowired
    SubjectRepository subjectRepository;

    /**
     * 跳转到科目管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "subject.html";
    }

    /**
     * 跳转到添加科目管理
     */
    @RequestMapping("/subject_add")
    public String subjectAdd(Model model) {
        GradeStatus[] statuses = GradeStatus.values();
        GradeLevel[] levels = GradeLevel.values();
        model.addAttribute("statuses",statuses);
        model.addAttribute("levels",levels);
        return PREFIX + "subject_add.html";
    }

    /**
     * 跳转到修改科目管理
     */
    @RequestMapping("/subject_edit/{subjectId}")
    public String subjectUpdate(@PathVariable Integer subjectId, Model model) {
        if (ToolUtil.isEmpty(subjectId)) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        Subject subject = subjectRepository.findOne(subjectId);
        Map<String,Object> map = BeanKit.beanToMap(subject);

        GradeStatus[] statuses = GradeStatus.values();
        GradeLevel[] levels = GradeLevel.values();
        model.addAttribute("statuses",statuses);
        model.addAttribute("levels",levels);
        model.addAttribute("subject",map);

        return PREFIX + "subject_edit.html";
    }

    /**
     * 获取科目管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String gradeName, @RequestParam(required = false) Integer level) {
        List<Subject> subjects = subjectRepository.findAll();
        List<Map<String,Object>> maps = new ArrayList<>();
        for(Subject subject:subjects){
            Map<String,Object> subjectMap = BeanKit.beanToMap(subject);
            maps.add(subjectMap);
        }

        return (new SubjectWrapper(maps)).warp();
    }

    /**
     * 新增科目管理
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Tip add(@Valid Subject subject, BindingResult result) {
        if (result.hasErrors()) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        subjectRepository.save(subject);
        return new SuccessTip();
    }

    /**
     * 删除科目管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Tip delete(@RequestParam Integer subjectId) {

        if (ToolUtil.isEmpty(subjectId)) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        subjectRepository.delete(subjectId);
        return new SuccessTip();
    }


    /**
     * 修改科目管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Tip update(@Valid Subject subject, BindingResult result) {
        if(result.hasErrors()){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        subjectRepository.save(subject);
        return new SuccessTip();
    }

    /**
     * 科目管理详情
     */
    @RequestMapping(value = "/detail")
    @ResponseBody
    public Object detail() {
        return null;
    }
}
