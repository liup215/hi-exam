package com.hidear.exam.modular.common.controller;

import com.hidear.exam.common.node.MenuNode;
import com.hidear.exam.modular.system.service.IMenuService;
import com.hidear.exam.modular.system.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public String home(@RequestParam Integer userType, Model model){
        List<Map<String,String>> topNav = new ArrayList<>();
        Map<String,String> topNavItem = new HashMap<>();

        if(userType.equals(1)){
            for(int i = 0;i<4;i++){
                topNavItem.put("name","教师导航" + i);
                topNav.add(topNavItem);
            }
        }else if(userType.equals(2)){
            for(int i = 0;i<4;i++){
                topNavItem.put("name","学生导航" + i);
                topNav.add(topNavItem);
            }
        }else if(userType.equals(3)){
            for(int i = 0;i<4;i++){
                topNavItem.put("name","家长导航" + i);
                topNav.add(topNavItem);
            }
        }else{
            for(int i = 0;i<4;i++){
                topNavItem.put("name","游客导航" + i);
                topNav.add(topNavItem);
            }
        }

        model.addAttribute("topNav",topNav);
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
