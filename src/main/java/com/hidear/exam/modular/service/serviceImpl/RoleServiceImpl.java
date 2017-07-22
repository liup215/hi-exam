package com.hidear.exam.modular.service.serviceImpl;

import com.hidear.exam.modular.dao.RoleRepository;
import com.hidear.exam.modular.model.Role;
import com.hidear.exam.modular.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/7/22.
 */
@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    RoleRepository roleRepository;

    @Override
    public List<Integer> getRoleIds() {
        List<Integer> roleIds = new ArrayList<>();

        List<Role> roles = roleRepository.findAll();
        for(Role role:roles){
            roleIds.add(role.getId());
        }

        return roleIds;
    }
}
