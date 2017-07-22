package com.hidear.exam.modular.dao;

import com.hidear.exam.modular.model.Menu;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by acer on 2017/7/22.
 */
public interface MenuRepository extends JpaRepository<Menu,Integer>,JpaSpecificationExecutor<Menu>{

    public List<Menu> findByIdIn(Set<Integer> menuIds);

    public Menu findByPcode(String pcode);

    public Menu findByCode(String pcode);

}
