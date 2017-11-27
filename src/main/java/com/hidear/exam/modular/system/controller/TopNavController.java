package com.hidear.exam.modular.system.controller;

import com.hidear.exam.common.constant.tip.ErrorTip;
import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.common.exception.BussinessException;
import com.hidear.exam.modular.system.model.TopNav;
import com.hidear.exam.modular.system.service.ITopNavService;
import com.hidear.exam.modular.system.status.UserType;
import com.hidear.exam.modular.system.wrapper.TopNavWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
        List<Map<String,Object>> topNavList = topNavService.getTopNavs();
        Map<String,Object> maps = new HashMap();
        maps.put("code",0);
        maps.put("msg","啊啊啊");
        maps.put("data",topNavList);
        maps.put("count",topNavList.size());

        return maps;
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

        return topNavService.add(topNav);
    }

    @RequestMapping("/topNav_update/{topNavId}")
    public String topNavUpdate(@PathVariable Integer topNavId,Model model){
        Map<String,Object> topNavMap = topNavService.getTopNav(topNavId);
        model.addAttribute("topNav",topNavMap);
        model.addAttribute("userTypes",UserType.values());
        return PREFIX + "topNav_edit.html";
    }

    @RequestMapping("/update")
    @ResponseBody
    public Tip update(@Valid TopNav topNav,BindingResult result){
        if(result.hasErrors()){
            return new ErrorTip(BizExceptionEnum.REQUEST_NULL);
        }

        return topNavService.update(topNav);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Tip delete(@RequestParam Integer topNavId){
        topNavService.delete(topNavId);
        return new SuccessTip();
    }

}
