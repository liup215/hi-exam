package com.hidear.exam.core.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * Created by acer on 2017/11/27.
 */
public class AdminToken extends UsernamePasswordToken{
    public AdminToken(String username, String password) {
        super(username,password);
    }
}
