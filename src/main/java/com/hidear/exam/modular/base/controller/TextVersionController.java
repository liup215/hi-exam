package com.hidear.exam.modular.base.controller;

import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.common.exception.BussinessException;
import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.core.util.ToolUtil;
import com.hidear.exam.modular.base.dao.TextVersionRepository;
import com.hidear.exam.modular.base.model.TextVersion;
import com.hidear.exam.modular.base.status.TextVersionStatus;
import com.hidear.exam.modular.base.wrapper.TextVersionWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 教材版本管理控制器
 *
 * @author fengshuonan
 * @Date 2017-08-01 21:38:55
 */
@Controller
@RequestMapping("/textVersion")
public class TextVersionController {

    private String PREFIX = "/base/textVersion/";

    @Autowired
    TextVersionRepository textVersionRepository;

    /**
     * 跳转到教材版本管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "textVersion.html";
    }

    /**
     * 跳转到添加教材版本管理
     */
    @RequestMapping("/textVersion_add")
    public String textVersionAdd(Model model) {

        TextVersionStatus[] statuses = TextVersionStatus.values();
        model.addAttribute("statuses",statuses);
        return PREFIX + "textVersion_add.html";
    }

    /**
     * 跳转到修改教材版本管理
     */
    @RequestMapping("/textVersion_update/{textVersionId}")
    public String textVersionUpdate(@PathVariable Integer textVersionId, Model model) {
        if(ToolUtil.isEmpty(textVersionId)){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }
        TextVersion textVersion = textVersionRepository.findOne(textVersionId);
        model.addAttribute("textVersion",textVersion);
        TextVersionStatus[] statuses = TextVersionStatus.values();
        model.addAttribute("statuses",statuses);
        return PREFIX + "textVersion_edit.html";
    }

    /**
     * 获取教材版本管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String condition) {

        List<Map<String,Object>> textVersions = new ArrayList<>();
        List<TextVersion> textVersionList = textVersionRepository.findAll();

        for(TextVersion textVersion:textVersionList){
            Map<String,Object> map = BeanKit.beanToMap(textVersion);
            textVersions.add(map);
        }

        Map<String,Object> maps = new HashMap();
        maps.put("code",0);
        maps.put("msg","");
        maps.put("data",(new TextVersionWrapper(textVersions)).warp());
        maps.put("count",textVersions.size());

        return maps;
    }

    /**
     * 新增教材版本管理
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(@Valid TextVersion textVersion, BindingResult result) {
        if(result.hasErrors()){
            System.out.println(result.getFieldError());
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        textVersionRepository.save(textVersion);

        return new SuccessTip();
    }

    /**
     * 删除教材版本管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer textVersionId) {
        if (ToolUtil.isEmpty(textVersionId)) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        textVersionRepository.delete(textVersionId);

        return new SuccessTip();
    }


    /**
     * 修改教材版本管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(@Valid TextVersion textVersion,BindingResult result) {
        if(result.hasErrors()){
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        textVersionRepository.save(textVersion);
        return new SuccessTip();
    }

    /**
     * 教材版本管理详情
     */
    @RequestMapping(value = "/detail")
    @ResponseBody
    public Object detail(@RequestParam Integer textVersionId) {
        if (ToolUtil.isEmpty(textVersionId)) {
            throw new BussinessException(BizExceptionEnum.REQUEST_NULL);
        }

        TextVersion textVersion = textVersionRepository.findOne(textVersionId);

        return null;
    }
}
