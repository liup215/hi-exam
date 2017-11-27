package com.hidear.exam.core.shiro.factory;

import com.hidear.exam.core.shiro.ShiroAdmin;
import com.hidear.exam.core.shiro.ShiroUser;
import com.hidear.exam.modular.auth.model.Admin;
import com.hidear.exam.modular.auth.model.User;
import org.apache.shiro.authc.SimpleAuthenticationInfo;

/**
 * Created by acer on 2017/11/27.
 */
public interface IShiro {
    /**
     * 根据用户Id获取用户
     * @param userId
     * @return
     */
    User user(Integer userId);

    /**
     * 根据账号获取登录用户
     * @param username 账号
     * @return 登录用户
     */
    User user(String username);

    /**
     * 根据系统用户获取Shiro的用户
     *
     * @param user 系统用户
     * @return Shiro用户
     */
    ShiroUser shiroUser(User user);

    ShiroUser shiroUser(Integer userId);

    Admin admin(Integer adminId);
    Admin admin(String username);

    /**
     * 获取shiro的认证信息
     * @param shiroUser shiro用户
     * @param user 用户
     * @param realmName 认证
     * @return 认证信息
     */
    SimpleAuthenticationInfo info(ShiroUser shiroUser, User user, String realmName);

    SimpleAuthenticationInfo info(ShiroAdmin shiroAdmin, Admin admin, String realmName);

    ShiroAdmin shiroAdmin(Admin admin);
}
