package com.hidear.exam.modular.common.controller;

import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.common.node.MenuNode;
import com.hidear.exam.core.shiro.AdminToken;
import com.hidear.exam.core.shiro.BaseShiro;
import com.hidear.exam.core.shiro.ShiroKit;

import com.hidear.exam.core.shiro.ShiroUser;
import com.hidear.exam.modular.system.model.TopNav;
import com.hidear.exam.modular.system.service.IMenuService;
import com.hidear.exam.modular.system.service.IRoleService;
import com.hidear.exam.modular.system.service.ITopNavService;

import com.hidear.exam.modular.system.status.UserType;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;


/**
 * Created by acer on 2017/7/21.
 */

@Controller
public class HomeController {

    @Autowired
    IMenuService menuService;

    @Autowired
    IRoleService roleService;

    @Autowired
    ITopNavService topNavService;


    @RequestMapping("/")
    public String index(){
        return "redirect:/index";
    }

    @RequestMapping("/index")
    public String home( Model model){

        BaseShiro shiro = ShiroKit.getUser();

        if(shiro == null){
            return "/login";
        }

        if(shiro instanceof ShiroUser){
            ShiroUser shiroUser = (ShiroUser)shiro;
            model.addAttribute("shiroUser",shiroUser);
            Integer userType = shiroUser.getUserType();
            List<TopNav> topNavs = topNavService.getTopNavsByUserType(userType);
            model.addAttribute("topNav",topNavs);

        }else{
            return "redirect:/admin";
        }

        return "/index.html";
    }

    /**
     * 跳转到登录页面
     * @return 登录页面地址
     */
    @RequestMapping("/login")
    public String loginPage(Model model){

        model.addAttribute("userTypes", UserType.values());

        return "/login.html";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Tip login(@RequestParam String username,@RequestParam String password, @RequestParam Integer isAdmin){
        //登录逻辑
        Subject currentUser = ShiroKit.getSubject();
        if(isAdmin==0){
            UsernamePasswordToken token = new UsernamePasswordToken(username,password);
            token.setRememberMe(true);
            currentUser.login(token);
        }else {
            AdminToken token = new AdminToken(username,password);
            token.setRememberMe(true);
            currentUser.login(token);
        }

        BaseShiro shiroUser = ShiroKit.getUser();

        ShiroKit.getSession().setAttribute("shiroUser",shiroUser);

        return new SuccessTip();
    }

    @RequestMapping(value = "/admin")
    public String admin(Model model){

        List<MenuNode> menus = menuService.getMenusNodes();

        List<MenuNode> titles = MenuNode.buildTitle(menus);
        model.addAttribute("titles",titles);
        String avatar = null;
        model.addAttribute("avatar",avatar);
        return "/admin.html";
    }
}
