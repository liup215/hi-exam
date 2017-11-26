package com.hidear.exam.modular.system.service.serviceImpl;

import com.hidear.exam.common.constant.tip.ErrorTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.modular.system.dao.TopNavRepository;
import com.hidear.exam.modular.system.model.TopNav;
import com.hidear.exam.modular.system.service.ITopNavService;
import com.hidear.exam.modular.system.wrapper.TopNavWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by acer on 2017/11/26.
 */
@Service
public class TopNavServiceImpl implements ITopNavService{

    @Autowired
    TopNavRepository topNavRepository;

    @Override
    public Map<String, Object> getTopNav() {
        List<Map<String,Object>> topNavList = new ArrayList<>();
        List<TopNav> topNavs = topNavRepository.findAll();
        for(TopNav topNav : topNavs){
            Map<String,Object> map = BeanKit.beanToMap(topNav);
            topNavList.add(map);
        }

        Map<String,Object> maps = new HashMap();
        maps.put("code",0);
        maps.put("msg","啊啊啊");
        maps.put("data",(new TopNavWrapper(topNavList)).warp());
        maps.put("count",topNavList.size());
        return maps;
    }

    @Override
    public Tip add(TopNav topNav) {

        try{
            topNavRepository.save(topNav);
        }catch (Exception e){
            return new ErrorTip(400,"数据库写入错误");
        }
        return null;
    }
}
