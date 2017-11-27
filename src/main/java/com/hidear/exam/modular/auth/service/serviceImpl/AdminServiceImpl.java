package com.hidear.exam.modular.auth.service.serviceImpl;

import com.hidear.exam.core.shiro.ShiroKit;
import com.hidear.exam.modular.auth.dao.AdminRepository;
import com.hidear.exam.modular.auth.model.Admin;
import com.hidear.exam.modular.auth.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by acer on 2017/11/27.
 */
@Service
public class AdminServiceImpl implements IAdminService {

    @Autowired
    AdminRepository adminRepository;

    @Override
    public void initAdmin() {
        if(adminRepository.findAll().size()==0){
            Admin admin = new Admin();
            admin.setUsername("admin");
            admin.setSalt(ShiroKit.getRandomSalt(6));
            admin.setPassword(ShiroKit.md5("admin",admin.getSalt()));

            adminRepository.save(admin);
        }
    }
}
