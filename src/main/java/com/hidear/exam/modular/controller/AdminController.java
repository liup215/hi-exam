package com.hidear.exam.modular.controller;

import com.hidear.exam.modular.controller.domain.QuestionFilter;
import com.hidear.exam.modular.model.question.Question;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by acer on 2017/7/19.
 */

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping(value = { "/home" }, method = RequestMethod.GET)
    public String adminHomePage(Model model, HttpServletRequest request) {

        return "redirect:/question/list";
    }

}
