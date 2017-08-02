package com.hidear.exam.modular.base.wrapper;

import com.hidear.exam.common.BaseControllerWrapper;
import com.hidear.exam.modular.base.status.GradeLevel;
import com.hidear.exam.modular.base.status.GradeStatus;

import java.util.Map;

/**
 * Created by Administrator on 2017/7/24.
 */
public class GradeWrapper extends BaseControllerWrapper {

    public GradeWrapper(Object obj) {
        super(obj);
    }

    @Override
    protected void warpTheMap(Map<String, Object> map) {
        map.put("level", GradeLevel.valueOf((Integer)map.get("level")));
        map.put("status", GradeStatus.valueOf((Integer) map.get("status")));
    }
}
