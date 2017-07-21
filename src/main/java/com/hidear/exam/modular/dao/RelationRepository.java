package com.hidear.exam.modular.dao;

import com.hidear.exam.modular.model.Relation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * Created by acer on 2017/7/22.
 */
public interface RelationRepository extends JpaRepository<Relation,Integer>,JpaSpecificationExecutor<Relation> {

    public List<Relation> findByRoleidIn(List<Integer> roleIds);
}
