package com.hidear.exam.modular.system.controller;

import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.common.exception.BussinessException;
import com.hidear.exam.modular.system.model.TopNav;
import com.hidear.exam.modular.system.service.ITopNavService;
import com.hidear.exam.modular.system.status.UserType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.Map;

/**
 * Created by acer on 2017/11/26.
 */
@Controller
@RequestMapping("/topNav")
public class TopNavController {

    private String PREFIX = "/system/topNav/";

    @Autowired
    ITopNavService topNavService;

    @RequestMapping("")
    public String topnav(){
        return PREFIX + "topNav.html";
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String,Object> list(@RequestParam Integer page,@RequestParam Integer limit){
        return topNavService.getTopNav();
    }

    @RequestMapping("/topNav_add")
    public String topNavAdd(Model model){

        model.addAttribute("userTypes", UserType.values());

        return PREFIX + "topNav_add.html";
    }

    @RequestMapping("/add")
    @ResponseBody
    public Tip add(@Valid TopNav topNav, BindingResult result){
        if(result.hasErrors()){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        System.out.println(topNav);

        return topNavService.add(topNav);
    }

}
