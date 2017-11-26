package com.hidear.exam.modular.base.wrapper;

import com.hidear.exam.common.BaseControllerWrapper;
import com.hidear.exam.core.util.SpringContextHolder;
import com.hidear.exam.modular.base.dao.SubjectRepository;
import com.hidear.exam.modular.base.model.Subject;
import com.hidear.exam.modular.base.status.GradeLevel;
import com.hidear.exam.modular.base.status.TextBookStatus;

import java.util.Map;

/**
 * Created by acer on 2017/11/26.
 */
public class TestingPointWrapper extends BaseControllerWrapper {
    SubjectRepository subjectRepository= SpringContextHolder.getBean(SubjectRepository.class);

    @Override
    protected void warpTheMap(Map<String, Object> map) {
        Subject subject = subjectRepository.findOne((Integer) map.get("subject"));

        map.put("subject",subject.getName());

        map.put("gradeLevel", GradeLevel.valueOf((Integer) map.get("gradeLevel")));
    }

    public TestingPointWrapper(Object obj) {
        super(obj);
    }
}
