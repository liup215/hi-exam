package com.hidear.exam.common.constant.tip;

import com.hidear.exam.common.exception.BizExceptionEnum;

/**
 * Created by Administrator on 2017/7/13.
 */
public class SuccessTip extends Tip{

    public SuccessTip() {
        super();
        code = 200;
        message = "操作成功！！！";
    }

    public SuccessTip(int code, String message) {
        super();
        this.code = code;
        this.message = message;
    }
}
