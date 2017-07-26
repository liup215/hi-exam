package com.hidear.exam.common.constant.state;

/**
 * Created by Administrator on 2017/7/24.
 * 年级
 */
public enum GradePeriod {

    Primary(1,"小学"),
    Junior(2,"初中"),
    High(3,"高中");


    private Integer code;
    private String name;

    GradePeriod() {
    }

    GradePeriod(Integer code, String name) {
        this.code = code;
        this.name = name;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static String valueOf(Integer code){
        if(code == null){
            return "";
        }else{
            for(GradePeriod period:GradePeriod.values()){
                if(code == period.getCode()){
                    return period.getName();
                }
            }
        }
        return "";
    }

}
