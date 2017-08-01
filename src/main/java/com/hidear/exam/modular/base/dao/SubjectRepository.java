package com.hidear.exam.modular.base.dao;

import com.hidear.exam.modular.base.model.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by Administrator on 2017/8/1.
 */
public interface SubjectRepository extends JpaRepository<Subject,Integer>,JpaSpecificationExecutor<Subject> {


}
