package com.hidear.exam.modular.base.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.common.exception.BussinessException;
import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.core.util.ToolUtil;
import com.hidear.exam.modular.base.model.Grade;
import com.hidear.exam.modular.base.status.GradeLevel;
import com.hidear.exam.modular.base.status.GradeStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.modular.base.dao.GradeRepository;
import com.hidear.exam.modular.base.service.IGradeService;
import com.hidear.exam.modular.base.wrapper.GradeWrapper;

import javax.validation.Valid;

/**
 * Created by Administrator on 2017/7/24.
 */

@Controller
@RequestMapping("/grade")
public class GradeController {

    private static String PREFIX = "/base/grade/";

    @Autowired
    GradeRepository gradeRepository;

    @Autowired
    IGradeService gradeService;

    @RequestMapping("")
    public String gradePage(){

        return PREFIX+"grade.html";
    }

    /**
     * 获取菜单列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String gradeName, @RequestParam(required = false) Integer level) {

        List<Map<String,Object>> grades = gradeService.selectGrades(null,null);
        Map<String,Object> list = new HashMap<>();
        list.put("code",0);
        list.put("msg","");
        list.put("count",grades.size());
        list.put("data",grades);

        return list;
    }

    @RequestMapping(value="/grade_add",method = RequestMethod.GET)
    public String add(Model model){

        GradeStatus[] statuses = GradeStatus.values();
        GradeLevel[] levels = GradeLevel.values();
        model.addAttribute("statuses",statuses);
        model.addAttribute("levels",levels);
        return PREFIX+"grade_add.html";
    }
    
    @RequestMapping(value="/add",method = RequestMethod.POST)
    @ResponseBody
    public Tip addGrade(@Valid Grade grade,BindingResult result){
        if (result.hasErrors()) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

    	gradeRepository.save(grade);

    	return new SuccessTip();
    }

    @RequestMapping(value = "/grade_edit/{gradeId}")
    public String gradeEdit(@PathVariable Integer gradeId,Model model ){
        if (ToolUtil.isEmpty(gradeId)) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        Grade grade = gradeRepository.findOne(gradeId);
        Map<String,Object> map = BeanKit.beanToMap(grade);

        GradeStatus[] statuses = GradeStatus.values();
        GradeLevel[] levels = GradeLevel.values();

        model.addAttribute("grade",map);
        model.addAttribute("levels",levels);
        model.addAttribute("statuses",statuses);
        return PREFIX+"grade_edit.html";
    }

    @RequestMapping(value ="/edit",method = RequestMethod.POST)
    @ResponseBody
    public Tip edit(@Valid Grade grade,BindingResult result){
        if(result.hasErrors()){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        saveOrUpdateGrade(grade);

        return new SuccessTip();
    }

    @RequestMapping("/remove")
    @ResponseBody
    public Tip remove(@RequestParam Integer gradeId){
        if (ToolUtil.isEmpty(gradeId)) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        gradeService.deleteGradeById(gradeId);

        return new SuccessTip();
    }

    private void saveOrUpdateGrade(@Valid Grade grade) {

        gradeRepository.save(grade);
    }
}
