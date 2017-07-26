package com.hidear.exam.modular.common.controller;

import com.hidear.exam.common.node.MenuNode;
import com.hidear.exam.modular.system.service.IMenuService;
import com.hidear.exam.modular.system.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by acer on 2017/7/21.
 */

@Controller
public class HomeController {

    @Autowired
    IMenuService menuServiceImpl;

    @Autowired
    IRoleService roleServiceImpl;


    @RequestMapping("/")
    public String index(){
        return "redirect:/index";
    }

    @RequestMapping("/index")
    public String home(){

        return "/index.html";
    }

    /**
     * 跳转到登录页面
     * @return 登录页面地址
     */
    @RequestMapping("/login")
    public String loginPage(){
        return "/login.html";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(Model model){

        //登录逻辑

        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin")
    public String admin(Model model){

        List<MenuNode> menus = menuServiceImpl.getMenusNodes();

        List<MenuNode> titles = MenuNode.buildTitle(menus);
        model.addAttribute("titles",titles);
        String avatar = null;
        model.addAttribute("avatar",avatar);
        return "/admin.html";
    }
}
