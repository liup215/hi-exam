package com.hidear.exam.modular.system.service.serviceImpl;

import com.hidear.exam.common.constant.tip.ErrorTip;
import com.hidear.exam.common.constant.tip.SuccessTip;
import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.common.exception.BizExceptionEnum;
import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.modular.system.dao.TopNavRepository;
import com.hidear.exam.modular.system.model.TopNav;
import com.hidear.exam.modular.system.service.ITopNavService;
import com.hidear.exam.modular.system.status.UserType;
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
    public List<TopNav> getTopNavsByUserType(Integer userType) {
        List<TopNav> topNavs = topNavRepository.findByUserType(userType);
        return topNavs;
    }

    @Override
    public Map<String, Object> getTopNav(Integer topNavId) {
        TopNav topNav = topNavRepository.findOne(topNavId);
        Map<String,Object> topNavMap = BeanKit.beanToMap(topNav);
        return (Map<String, Object>) new TopNavWrapper(topNavMap).warp();
    }

    @Override
    public void delete(Integer topNavId) {
        topNavRepository.delete(topNavId);
    }

    @Override
    public List<Map<String,Object>> getTopNavs() {
        List<Map<String,Object>> topNavList = new ArrayList<>();
        List<TopNav> topNavs = topNavRepository.findAll();
        for(TopNav topNav : topNavs){
            Map<String,Object> map = BeanKit.beanToMap(topNav);
            topNavList.add(map);
        }

        return (List)(new TopNavWrapper(topNavList)).warp();
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

    @Override
    public Tip update(TopNav topNav) {

        try{
            topNavRepository.save(topNav);
        }catch (Exception e){
            return new ErrorTip(400,"数据库写入错误");
        }

        return new SuccessTip();
    }
}
