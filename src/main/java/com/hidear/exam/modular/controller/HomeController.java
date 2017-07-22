package com.hidear.exam.modular.controller;

import com.hidear.exam.common.node.MenuNode;
import com.hidear.exam.modular.service.IMenuService;
import com.hidear.exam.modular.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
    public String home(Model model){

        List<MenuNode> menus = menuServiceImpl.getMenusNodes();

        List<MenuNode> titles = MenuNode.buildTitle(menus);
        model.addAttribute("titles",titles);
        String avatar = null;
        model.addAttribute("avatar",avatar);

        return "/index.html";
    }
}
