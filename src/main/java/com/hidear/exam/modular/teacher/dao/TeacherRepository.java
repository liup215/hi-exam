package com.hidear.exam.modular.teacher.dao;

import com.hidear.exam.modular.teacher.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by Administrator on 2017/8/24.
 */
public interface TeacherRepository extends JpaRepository<Teacher,Integer>,JpaSpecificationExecutor<Teacher>{
}
