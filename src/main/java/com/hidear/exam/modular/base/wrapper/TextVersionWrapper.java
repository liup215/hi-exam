package com.hidear.exam.modular.base.wrapper;

import com.hidear.exam.common.BaseControllerWrapper;
import com.hidear.exam.modular.base.status.TextVersionStatus;

import java.util.Map;

/**
 * Created by acer on 2017/8/1.
 */
public class TextVersionWrapper extends BaseControllerWrapper{

    public TextVersionWrapper(Object obj) {
        super(obj);
    }

    @Override
    protected void warpTheMap(Map<String, Object> map) {
        map.put("status", TextVersionStatus.valueOf((Integer) map.get("status")));
    }
}
