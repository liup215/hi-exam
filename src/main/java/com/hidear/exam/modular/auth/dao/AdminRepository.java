package com.hidear.exam.modular.auth.dao;

import com.hidear.exam.modular.auth.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by acer on 2017/11/27.
 */
public interface AdminRepository extends JpaRepository<Admin,Integer>{
    public Admin findByUsername(String username);
}
