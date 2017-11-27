package com.hidear.exam.core.shiro;

import com.hidear.exam.core.shiro.factory.IShiro;
import com.hidear.exam.core.shiro.factory.ShiroFactory;
import com.hidear.exam.modular.auth.model.Admin;
import com.hidear.exam.modular.auth.model.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by acer on 2017/11/27.
 */
public class ShiroDBRealm extends AuthorizingRealm {
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        IShiro shiroFactory = ShiroFactory.me();

//        ShiroUser shiroUser = (ShiroUser) principalCollection.getPrimaryPrincipal();
//        List<Integer> roleList = shiroUser.getRoleList();
        List<Integer> roleList = null;

        Set<String> permissionSet = new HashSet<>();
        Set<String> roleNameSet = new HashSet<>();

//        for (Integer roleId : roleList) {
//            List<String> permissions = shiroFactory.findPermissionsByRoleId(roleId);
//            if (permissions != null) {
//                for (String permission : permissions) {
//                    if (ToolUtil.isNotEmpty(permission)) {
//                        permissionSet.add(permission);
//                    }
//                }
//            }
//            String roleName = shiroFactory.findRoleNameByRoleId(roleId);
//            roleNameSet.add(roleName);
//        }
//
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addStringPermissions(permissionSet);
        info.addRoles(roleNameSet);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        SimpleAuthenticationInfo info = null;

        IShiro shiroFactory = ShiroFactory.me();
        if(authcToken instanceof AdminToken){
            AdminToken token = (AdminToken) authcToken;
            System.out.println(token.getUsername());
            Admin admin = shiroFactory.admin(token.getUsername());
            ShiroAdmin shiroAdmin = shiroFactory.shiroAdmin(admin);
            info = shiroFactory.info(shiroAdmin,admin,super.getName());

        }else{
            UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
            User user = shiroFactory.user(token.getUsername());
            ShiroUser shiroUser = shiroFactory.shiroUser(user);
            info = shiroFactory.info(shiroUser, user, super.getName());
        }

        return info;
    }

    /**
     * 设置认证加密方式
     */
    @Override
    public void setCredentialsMatcher(CredentialsMatcher credentialsMatcher) {
        HashedCredentialsMatcher md5CredentialsMatcher = new HashedCredentialsMatcher();
        md5CredentialsMatcher.setHashAlgorithmName(ShiroKit.hashAlgorithmName);
        md5CredentialsMatcher.setHashIterations(ShiroKit.hashIterations);
        super.setCredentialsMatcher(md5CredentialsMatcher);
    }
}
