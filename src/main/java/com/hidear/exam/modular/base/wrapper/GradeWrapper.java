package com.hidear.exam.modular.base.wrapper;

import com.hidear.exam.common.BaseControllerWrapper;
import com.hidear.exam.common.constant.state.GradePeriod;
import com.hidear.exam.common.constant.state.GradeStatus;
import io.swagger.models.auth.In;

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
        map.put("level", GradePeriod.valueOf((Integer)map.get("level")));
        map.put("status", GradeStatus.valueOf((Integer) map.get("status")));
    }
}
