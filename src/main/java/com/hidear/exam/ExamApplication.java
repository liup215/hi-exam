package com.hidear.exam;

import com.hidear.exam.core.util.SpringContextHolder;
import com.hidear.exam.modular.auth.service.IAdminService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by Administrator on 2017/7/19.
 */

@EnableTransactionManagement
@SpringBootApplication
@Controller
public class ExamApplication extends WebMvcConfigurerAdapter {
    protected final static org.slf4j.Logger logger = LoggerFactory.getLogger(ExamApplication.class);

    @Autowired
    IAdminService adminService;

    @RequestMapping("/init")
    @ResponseBody
    public String applicationInit(){
        adminService.initAdmin();
        return "项目初始化成功";
    }

    public static void main(String[] args) {

        SpringApplication.run(ExamApplication.class,args);
        logger.info("com.hidear.exam.ExamApplication Start success!!!");
    }
}
