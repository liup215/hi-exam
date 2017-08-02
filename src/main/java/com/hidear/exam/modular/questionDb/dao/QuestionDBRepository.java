package com.hidear.exam.modular.questionDb.dao;

import com.hidear.exam.modular.questionDb.model.QuestionDB;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by Administrator on 2017/8/2.
 */
public interface QuestionDBRepository extends JpaRepository<QuestionDB,Integer>,JpaSpecificationExecutor<QuestionDB>{
}
