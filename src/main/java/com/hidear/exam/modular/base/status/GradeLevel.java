package com.hidear.exam.modular.base.status;

/**
 * Created by Administrator on 2017/7/24.
 * 年级
 */
public enum GradeLevel {

    Primary(1,"小学"),
    Junior(2,"初中"),
    High(3,"高中");


    private Integer code;
    private String name;

    GradeLevel() {
    }

    GradeLevel(Integer code, String name) {
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
            for(GradeLevel period: GradeLevel.values()){
                if(code == period.getCode()){
                    return period.getName();
                }
            }
        }
        return "";
    }

}
