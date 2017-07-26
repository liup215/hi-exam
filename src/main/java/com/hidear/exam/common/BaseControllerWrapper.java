package com.hidear.exam.common;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/24.
 */
public abstract class BaseControllerWrapper {

    Object obj = null;

    public BaseControllerWrapper(Object obj){
        this.obj= obj;
    }

    @SuppressWarnings("unchecked")
    public Object warp() {
        if (this.obj instanceof List) {
            List<Map<String, Object>> list = (List<Map<String, Object>>) this.obj;
            for (Map<String, Object> map : list) {
                warpTheMap(map);
            }
            return list;
        } else if (this.obj instanceof Map) {
            Map<String, Object> map = (Map<String, Object>) this.obj;
            warpTheMap(map);
            return map;
        } else {
            return this.obj;
        }
    }

    protected abstract void warpTheMap(Map<String, Object> map);
}
