package com.hidear.exam.modular.system.dao;

import com.hidear.exam.modular.system.model.Grade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by Administrator on 2017/7/24.
 */
public interface GradeRepository extends JpaRepository<Grade,Integer>,JpaSpecificationExecutor<Grade> {

}
