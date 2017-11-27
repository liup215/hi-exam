package com.hidear.exam.modular.system.dao;

import com.hidear.exam.modular.system.model.TopNav;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by acer on 2017/11/26.
 */
public interface TopNavRepository extends JpaRepository<TopNav,Integer> {
    public List<TopNav> findByUserType(Integer userType);
}
