package com.hidear.exam.modular.system.dao;

import com.hidear.exam.modular.system.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by acer on 2017/7/22.
 */
public interface RoleRepository extends JpaRepository<Role,Integer>,JpaSpecificationExecutor<Role> {
}
