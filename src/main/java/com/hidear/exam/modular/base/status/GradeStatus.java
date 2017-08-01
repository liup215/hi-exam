package com.hidear.exam.modular.base.status;

/**
 * Created by Administrator on 2017/7/24.
 */
public enum GradeStatus {

    OK(1,"启用"),DELETED(0,"禁用");

    private Integer code;
    private String status;

    GradeStatus(Integer code, String status) {

        this.code = code;
        this.status = status;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public static String valueOf(Integer code){
        if(code==null){
            return "";
        }else {
            for (GradeStatus status:GradeStatus.values()){
                if(code == status.getCode()){
                    return status.getStatus();
                }
            }
        }
        return "";
    }
}
