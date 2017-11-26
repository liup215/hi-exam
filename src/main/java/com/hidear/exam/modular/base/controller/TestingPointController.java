package com.hidear.exam.modular.base.controller;

import com.hidear.exam.modular.base.service.ITestPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by acer on 2017/11/26.
 */

@Controller
@RequestMapping("/testingPoint")
public class TestingPointController {

    private static String PREFIX = "/base/testingPoint/";

    @Autowired
    ITestPointService testPointService;

    @RequestMapping("")
    public String testingPointPage(){
        return PREFIX + "testingPoint.html";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String,Object> list(String condition){
        return testPointService.getTestingPoint();
    }
}
