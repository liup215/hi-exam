package com.hidear.exam.modular.system.wrapper;

import com.hidear.exam.common.BaseControllerWrapper;
import com.hidear.exam.common.constant.factory.ConstantFactory;
import com.hidear.exam.common.constant.state.IsMenu;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/24.
 */
public class MenuWrapper extends BaseControllerWrapper {

    public MenuWrapper(List<Map<String,Object>> menu) {
        super(menu);
    }

    @Override
    protected void warpTheMap(Map<String, Object> map) {
        map.put("statusName", ConstantFactory.me().getMenuStatusName((Integer) map.get("status")));
        map.put("isMenuName", IsMenu.valueOf((Integer) map.get("ismenu")));
    }
}
