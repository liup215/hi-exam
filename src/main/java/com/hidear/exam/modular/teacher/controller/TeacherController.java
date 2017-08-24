package com.hidear.exam.modular.teacher.controller;

import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.common.exception.BussinessException;
import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.modular.teacher.dao.TeacherRepository;
import com.hidear.exam.modular.teacher.model.Teacher;
import com.hidear.exam.modular.teacher.status.TeacherStatus;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.*;

/**
 * Created by Administrator on 2017/8/24.
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {
    private String PREFIX = "/teachmag/teacher/";

    @Autowired
    TeacherRepository teacherRepository;

    @RequestMapping("")
    public String index(){
        return PREFIX+"/teacher.html";
    }

    @RequestMapping("/teacher_add")
    public String teacherAdd(Model model){
        TeacherStatus[] statuses = TeacherStatus.values();
        model.addAttribute("statuses",statuses);

        return PREFIX+"teacher_add.html";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Object list(){
        List<Map<String,Object>> teacherList = new ArrayList<>();
        List<Teacher> teachers = teacherRepository.findAll();
        for(Teacher teacher:teachers){
            Map<String,Object> teacherMap = BeanKit.beanToMap(teacher);
            teacherList.add(teacherMap);
        }

        Map<String,Object> maps = new HashedMap();
        maps.put("code",0);
        maps.put("msg","");
        maps.put("count",teachers.size());
        maps.put("data",teacherList);

        return  maps;
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Tip add(@Valid Teacher teacher, BindingResult result) {
        if(result.hasErrors()){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        teacher.setcTime((new Date().getTime()));
        teacher.setmTime((new Date().getTime()));
        teacherRepository.save(teacher);
        return new SuccessTip();
    }

}
