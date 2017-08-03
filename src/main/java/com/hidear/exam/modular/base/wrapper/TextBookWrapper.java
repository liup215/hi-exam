package com.hidear.exam.modular.base.wrapper;

import com.hidear.exam.common.BaseControllerWrapper;
import com.hidear.exam.core.util.SpringContextHolder;
import com.hidear.exam.modular.base.dao.SubjectRepository;
import com.hidear.exam.modular.base.model.Subject;
import com.hidear.exam.modular.base.status.GradeLevel;
import com.hidear.exam.modular.base.status.TextBookStatus;
import org.springframework.context.annotation.DependsOn;

import java.util.Map;

/**
 * Created by Administrator on 2017/8/3.
 */
@DependsOn("SpringContextHolder")
public class TextBookWrapper extends BaseControllerWrapper {

    SubjectRepository subjectRepository= SpringContextHolder.getBean(SubjectRepository.class);

    public TextBookWrapper(Object obj) {
        super(obj);
    }

    @Override
    protected void warpTheMap(Map<String, Object> map) {

        Subject subject = subjectRepository.findOne((Integer) map.get("subject"));

        map.put("subject",subject.getName());

        map.put("status", TextBookStatus.valueOf((Integer) map.get("status")));

        map.put("gradeLevel", GradeLevel.valueOf((Integer) map.get("gradeLevel")));
    }
}
