package com.hidear.exam.modular.system.service;

import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.modular.system.model.TopNav;

import java.util.Map;

/**
 * Created by acer on 2017/11/26.
 */
public interface ITopNavService {
    public Map<String,Object> getTopNav();

    public Tip add(TopNav topNav);
}
