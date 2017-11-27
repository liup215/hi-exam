package com.hidear.exam.modular.auth.status;

/**
 * Created by acer on 2017/11/27.
 */
public enum UserStatus {
    OK(1, "启用"), FREEZED(2, "冻结"), DELETED(3, "被删除");

    int code;
    String message;

    UserStatus(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public static String valueOf(Integer value) {
        if (value == null) {
            return "";
        } else {
            for (UserStatus ms : UserStatus.values()) {
                if (ms.getCode() == value) {
                    return ms.getMessage();
                }
            }
            return "";
        }
    }
}
