package com.hidear.exam.modular.system.dao;

import com.hidear.exam.modular.system.model.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
import java.util.Set;

/**
 * Created by acer on 2017/7/22.
 */
public interface MenuRepository extends JpaRepository<Menu,Integer>,JpaSpecificationExecutor<Menu>{

    public List<Menu> findByIdIn(Set<Integer> menuIds);

    public List<Menu> findByPcode(String pcode);

    public Menu findByCode(String pcode);

}
