package com.hidear.exam;

import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by Administrator on 2017/7/19.
 */

@EnableTransactionManagement
@SpringBootApplication
public class ExamApplication extends WebMvcConfigurerAdapter {
    protected final static org.slf4j.Logger logger = LoggerFactory.getLogger(ExamApplication.class);

    public static void main(String[] args) {

        SpringApplication.run(ExamApplication.class,args);
        logger.info("com.hidear.exam.ExamApplication Start success!!!");
    }
}
