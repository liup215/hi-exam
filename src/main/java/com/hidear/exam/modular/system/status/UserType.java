package com.hidear.exam.modular.system.status;

/**
 * Created by acer on 2017/11/26.
 */
public enum UserType {
    VISITOR(0,"游客"),
    TEACHER(1,"教师"),
    STUDENT(2,"学生"),
    PARENTS(3,"家长"),
    ADMIN(4,"管理员");

    int code;
    String name;

    UserType(int code, String name) {
        this.code = code;
        this.name = name;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static String valueOf(Integer status) {
        if (status == null) {
            return "";
        } else {
            for (UserType s : UserType.values()) {
                if (s.getCode() == status) {
                    return s.getName();
                }
            }
            return "";
        }
    }
}
