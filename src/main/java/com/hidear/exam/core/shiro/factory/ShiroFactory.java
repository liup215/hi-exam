package com.hidear.exam.core.shiro.factory;

import com.hidear.exam.core.shiro.ShiroAdmin;
import com.hidear.exam.core.shiro.ShiroUser;
import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.core.util.SpringContextHolder;
import com.hidear.exam.modular.auth.dao.AdminRepository;
import com.hidear.exam.modular.auth.dao.UserRepository;
import com.hidear.exam.modular.auth.model.Admin;
import com.hidear.exam.modular.auth.model.User;
import com.hidear.exam.modular.auth.status.UserStatus;
import org.apache.shiro.authc.CredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by acer on 2017/11/27.
 */
@Service
@DependsOn("springContextHolder")
@Transactional(readOnly = true)
public class ShiroFactory implements IShiro{
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AdminRepository adminRepository;

    public static IShiro me() {

        return (SpringContextHolder.getBean(IShiro.class));
    }

    @Override
    public User user(String phone) {
        User user = userRepository.findByPhoneNumber(phone);
        // 账号不存在
        if (null == user) {
            throw new CredentialsException();
        }
        // 账号被冻结
        if (user.getStatus() != UserStatus.OK.getCode()) {
            throw new LockedAccountException();
        }
        return user;
    }

    @Override
    public User user(Integer userId) {
        User user = userRepository.findOne(userId);
        // 账号不存在
        if (null == user) {
            throw new CredentialsException();
        }
        // 账号被冻结
        if (user.getStatus() != UserStatus.OK.getCode()) {
            throw new LockedAccountException();
        }
        return user;
    }

    @Override
    public ShiroUser shiroUser(Integer userId) {
        User user = user(userId);
        return shiroUser(user);
    }

    @Override
    public Admin admin(Integer adminId) {
        Admin admin = adminRepository.findOne(adminId);
        // 账号不存在
        if (null == admin) {
            throw new CredentialsException();
        }

        return admin;
    }

    @Override
    public Admin admin(String username) {

        Admin admin = adminRepository.findByUsername(username);
        // 账号不存在
        if (null == admin) {
            throw new CredentialsException();
        }

        return admin;
    }

    @Override
    public ShiroUser shiroUser(User user) {
        ShiroUser shiroUser = new ShiroUser();

        BeanUtils.copyProperties(user,shiroUser);
        return shiroUser;
    }


    @Override
    public SimpleAuthenticationInfo info(ShiroUser shiroUser, User user, String realmName) {
        String credentials = user.getPassword();
        // 密码加盐处理
        String source = user.getSalt();
        ByteSource credentialsSalt = new Md5Hash(source);
        return new SimpleAuthenticationInfo(shiroUser, credentials, credentialsSalt, realmName);
    }

    @Override
    public SimpleAuthenticationInfo info(ShiroAdmin shiroAdmin, Admin admin, String realmName) {
        String credentials = admin.getPassword();
        // 密码加盐处理
        String source = admin.getSalt();
        ByteSource credentialsSalt = new Md5Hash(source);
        return new SimpleAuthenticationInfo(shiroAdmin, credentials, credentialsSalt, realmName);
    }

    @Override
    public ShiroAdmin shiroAdmin(Admin admin) {
        ShiroAdmin shiroAdmin = new ShiroAdmin();
        BeanUtils.copyProperties(admin,shiroAdmin);
        return shiroAdmin;
    }
}
