package com.hidear.exam.modular.controller;

import com.hidear.exam.modular.controller.domain.QuestionFilter;
import com.hidear.exam.modular.model.question.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by acer on 2017/7/19.
 */

@Controller
@RequestMapping("/question")
public class QuestionController {

    /**
     * 题库页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String questionListPage(Model model) {

        return "redirect:questionfilter-0-0-0-0-1.html";
    }

    /**
     * 题库页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/questionfilter-{fieldId}-{knowledge}-{questionType}-{searchParam}-{page}.html", method = RequestMethod.GET)
    public String questionListFilterPage(Model model,
                                         @PathVariable("fieldId") int fieldId,
                                         @PathVariable("knowledge") int knowledge,
                                         @PathVariable("questionType") int questionType,
                                         @PathVariable("searchParam") String searchParam,
                                         @PathVariable("page") int page) {

        QuestionFilter qf = new QuestionFilter();
        qf.setFieldId(fieldId);
        qf.setKnowledge(knowledge);
        qf.setQuestionType(questionType);
        if (searchParam.equals("0"))
            searchParam = "-1";
        qf.setSearchParam(searchParam);

        List<Question> questionList = new ArrayList<>();

        List<Field> fieldList = new ArrayList<>();
        model.addAttribute("fieldList", fieldList);

		/*if(fieldList.size() > 0)
			fieldId = fieldList.get(0).getFieldId();*/

        model.addAttribute("knowledgeList", new ArrayList<KnowledgePoint>());

        model.addAttribute("questionTypeList",new ArrayList<QuestionType>());

        model.addAttribute("questionFilter", qf);
        model.addAttribute("questionList", questionList);
        model.addAttribute("pageStr", "123345567789");
        model.addAttribute("tagList", new ArrayList<Tag>());
        //保存筛选信息，删除后跳转页面时使用
        model.addAttribute("fieldId", fieldId);
        model.addAttribute("knowledge", knowledge);
        model.addAttribute("questionType", questionType);
        model.addAttribute("searchParam", searchParam);

        return "/admin/question-list.html";
    }
}
