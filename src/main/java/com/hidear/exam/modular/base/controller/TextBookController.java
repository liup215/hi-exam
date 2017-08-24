package com.hidear.exam.modular.base.controller;

import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.common.exception.BussinessException;
import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.core.util.ToolUtil;
import com.hidear.exam.modular.base.dao.SubjectRepository;
import com.hidear.exam.modular.base.dao.TextBookRepository;
import com.hidear.exam.modular.base.model.Subject;
import com.hidear.exam.modular.base.model.TextBook;
import com.hidear.exam.modular.base.status.GradeLevel;
import com.hidear.exam.modular.base.status.TextBookStatus;
import com.hidear.exam.modular.base.wrapper.TextBookWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 教材管理控制器
 *
 * @author fengshuonan
 * @Date 2017-08-03 15:59:51
 */
@Controller
@RequestMapping("/textBook")
public class TextBookController {

    private String PREFIX = "/base/textBook/";

    @Autowired
    TextBookRepository textBookRepository;

    @Autowired
    SubjectRepository subjectRepository;

    /**
     * 跳转到教材管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "textBook.html";
    }

    /**
     * 跳转到添加教材管理
     */
    @RequestMapping("/textBook_add")
    public String textBookAdd(Model model) {
        GradeLevel[] gradeLevels = GradeLevel.values();
        model.addAttribute("gradeLevels",gradeLevels);

        List<Subject> subjects = subjectRepository.findAll();
        model.addAttribute("subjects",subjects);

        TextBookStatus[] statuses = TextBookStatus.values();
        model.addAttribute("statuses",statuses);

        return PREFIX + "textBook_add.html";
    }

    /**
     * 跳转到修改教材管理
     */
    @RequestMapping("/textBook_update/{textBookId}")
    public String textBookUpdate(@PathVariable Integer textBookId, Model model) {

        if(ToolUtil.isEmpty(textBookId)){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        TextBook textBook = textBookRepository.findOne(textBookId);
        model.addAttribute("textBook",textBook);

        GradeLevel[] gradeLevels = GradeLevel.values();
        model.addAttribute("gradeLevels",gradeLevels);

        List<Subject> subjects = subjectRepository.findAll();
        model.addAttribute("subjects",subjects);

        TextBookStatus[] statuses = TextBookStatus.values();
        model.addAttribute("statuses",statuses);
        return PREFIX + "textBook_edit.html";
    }

    /**
     * 获取教材管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {

        List<Map<String,Object>> textBookList = new ArrayList<>();
        List<TextBook> books = textBookRepository.findAll();
        for(TextBook book : books){
            Map<String,Object> map = BeanKit.beanToMap(book);
            textBookList.add(map);
        }

        Map<String,Object> maps = new HashMap();
        maps.put("code",0);
        maps.put("msg","");
        maps.put("data",(new TextBookWrapper(textBookList)).warp());
        maps.put("count",textBookList.size());
        return maps;
    }

    /**
     * 新增教材管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Tip add(@Valid TextBook book, BindingResult result) {
        if(result.hasErrors()){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        textBookRepository.save(book);
        return new SuccessTip();
    }

    /**
     * 删除教材管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Tip delete(@RequestParam Integer textBookId) {
        if (ToolUtil.isEmpty(textBookId)) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        textBookRepository.delete(textBookId);
        return new SuccessTip();
    }


    /**
     * 修改教材管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Tip update(@Valid TextBook book, BindingResult result) {
        if(result.hasErrors()){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        textBookRepository.save(book);
        return new SuccessTip();
    }

    /**
     * 教材管理详情
     */
    @RequestMapping(value = "/detail")
    @ResponseBody
    public Object detail() {
        return null;
    }
}
