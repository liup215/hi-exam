package com.hidear.exam.modular.base.wrapper;

import com.hidear.exam.common.BaseControllerWrapper;
import com.hidear.exam.modular.base.status.SubjectStatus;

import java.util.Map;

/**
 * Created by Administrator on 2017/8/1.
 */
public class SubjectWrapper extends BaseControllerWrapper {
    public SubjectWrapper(Object obj) {
        super(obj);
    }

    @Override
    protected void warpTheMap(Map<String, Object> map) {
        map.put("status", SubjectStatus.valueOf((Integer) map.get("status")));
    }

}
