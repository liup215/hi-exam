package com.hidear.exam.modular.system.wrapper;

import com.hidear.exam.common.BaseControllerWrapper;
import com.hidear.exam.modular.system.status.UserType;

import java.util.Map;

/**
 * Created by acer on 2017/11/27.
 */
public class TopNavWrapper extends BaseControllerWrapper {
    @Override
    protected void warpTheMap(Map<String, Object> map) {
        map.put("userTypeName", UserType.valueOf((Integer)map.get("userType")));
    }

    public TopNavWrapper(Object obj) {
        super(obj);
    }
}
