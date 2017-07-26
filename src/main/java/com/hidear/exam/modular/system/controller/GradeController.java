package com.hidear.exam.modular.system.controller;

import com.hidear.exam.modular.system.dao.GradeRepository;
import com.hidear.exam.modular.system.service.IGradeService;
import com.hidear.exam.modular.system.wrapper.GradeWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/24.
 */

@Controller
@RequestMapping("/grade")
public class GradeController {

    private static String PREFIX = "/system/grade/";

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

        return (new GradeWrapper(grades)).warp();
    }

    @RequestMapping(value="/add",method = RequestMethod.GET)
    public String add(){
        return PREFIX+"grade_add.html";
    }
}
