package com.hidear.exam.modular.controller;

import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.modular.model.question.Field;
import com.hidear.exam.modular.model.user.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/7/19.
 */

@Controller
public class HomeController {

    /**
     * 首页
     * @return 重定向链接
     */
    @RequestMapping("/")
    public String homePage(){
        return "redirect:/home";

    }

    /**
     * 首页
     * @return 跳转到首页
     */
    @RequestMapping("/home")
    public String directToBaseHomePage(){
        if(1==1){
            return "redirect:/admin/home";
        }


        return "/home.html";
    }

    /**
     * 用户登录页面
     *
     * @return 跳转到登录页面
     */
    @RequestMapping(value = { "/user-login-page" }, method = RequestMethod.GET)
    public String loginPage() {

        return "/login.html";
    }

    /**
     * 用户登录
     *
     * @param user
     * @return
     */
    @RequestMapping(value = { "/user-login" }, method = RequestMethod.POST)
    public @ResponseBody
    Tip userLogin(@RequestBody User user) {
        System.out.println(user.toString());

        return new SuccessTip();
    }

    /**
     * 用户登录成功页面
     *
     * @return
     */
    @RequestMapping(value = { "/regist-success/{username}" }, method = RequestMethod.GET)
    public String registerSuccessPage(@PathVariable String username, Model model) {
        model.addAttribute("username", username);
        return "/regist-success.html";
    }

    /**
     * 用户注册页面
     *
     * @return
     */
    @RequestMapping(value = { "/user-register" }, method = RequestMethod.GET)
    public String registerPage(Model model) {
        List<Field> fieldList = new ArrayList<>();
        fieldList.add(new Field(1,"语文","*******",true,true));
        fieldList.add(new Field(2,"数学","*******",true,true));
        fieldList.add(new Field(3,"英语","*******",true,true));
        fieldList.add(new Field(4,"物理","*******",true,true));
        fieldList.add(new Field(5,"化学","*******",true,true));
        model.addAttribute("fieldList", fieldList);
        return "/register.html";
    }

    /**
     * 用户注册
     *
     * @param user
     * @return
     */
    @RequestMapping(value = { "/user-reg" }, method = RequestMethod.POST)
    public @ResponseBody
    Tip userRegister(@RequestBody User user) {
        user.setCreate_date(new Date());
        return new SuccessTip();
    }

    /**
     * 用户信息查看
     *
     * @return
     */
    @RequestMapping(value = { "/user-detail/{username}" }, method = RequestMethod.GET)
    public String userDetailPage(@PathVariable String username, Model model) {
        model.addAttribute("username", username);
        return "redirect:/student/usercenter";
    }

}
