package com.hidear.exam.modular.system.service;

import com.hidear.exam.common.constant.tip.Tip;
import com.hidear.exam.modular.system.model.TopNav;

import java.util.List;
import java.util.Map;

/**
 * Created by acer on 2017/11/26.
 */
public interface ITopNavService {
    public Map<String,Object> getTopNav(Integer topNavId);

    public Tip add(TopNav topNav);

    public List<Map<String,Object>> getTopNavs();

    public List<TopNav> getTopNavsByUserType(Integer userType);

    public Tip update(TopNav topNav);

    public void delete(Integer topNavId);
}
