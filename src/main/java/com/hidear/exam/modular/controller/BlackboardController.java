package com.hidear.exam.modular.controller;

import com.hidear.exam.modular.model.Notice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by acer on 2017/7/22.
 */
@Controller
public class BlackboardController {

    @RequestMapping("/blackboard")
    public String blackboard(Model model) {
        List<Map<String, Notice>> notices = new ArrayList<>();
        model.addAttribute("noticeList",notices);
        return "/blackboard.html";
    }
}
