package com.hidear.exam.modular.base.controller;

import com.hidear.exam.modular.base.dao.ChapterRepository;
import com.hidear.exam.modular.base.model.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by Administrator on 2017/8/18.
 */

@Controller
@RequestMapping("/chapter")
public class ChapterController {

    private static String PREFIX = "/base/chapter/";

    @Autowired
    ChapterRepository chapterRepository;

    @RequestMapping("")
    public String bookPage(){

        return "redirect:/textBook";
    }

    @RequestMapping("/{textBookId}")
    public String chapterPage(@PathVariable Integer textBookId, Model model){
        model.addAttribute("textBookId",textBookId);
        return PREFIX+"/chapter.html";
    }
}
