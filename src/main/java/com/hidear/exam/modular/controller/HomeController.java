package com.hidear.exam.modular.controller;

import com.hidear.exam.common.node.MenuNode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by acer on 2017/7/21.
 */

@Controller
public class HomeController {

    @RequestMapping("/")
    public String index(){
        return "redirect:/index";
    }

    @RequestMapping("/index")
    public String home(Model model){

        List<MenuNode> menus = new ArrayList<>();

        List<MenuNode> titles = MenuNode.buildTitle(menus);
        model.addAttribute("titles",titles);
        String avatar = null;
        model.addAttribute("avatar",avatar);

        return "/index.html";
    }
}
