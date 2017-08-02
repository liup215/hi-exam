package com.hidear.exam.modular.questionDb.wrapper;

import com.hidear.exam.common.BaseControllerWrapper;
import com.hidear.exam.core.support.DateTimeKit;
import com.hidear.exam.core.util.SpringContextHolder;
import com.hidear.exam.modular.base.dao.SubjectRepository;
import com.hidear.exam.modular.base.model.Subject;
import com.hidear.exam.modular.base.status.GradeLevel;
import com.hidear.exam.modular.questionDb.status.QuestionDBStatus;
import org.springframework.context.annotation.DependsOn;

import java.util.Map;

/**
 * Created by Administrator on 2017/8/2.
 */
@DependsOn("SpringContextHolder")
public class QuestionDBWrapper extends BaseControllerWrapper {

    SubjectRepository subjectRepository=SpringContextHolder.getBean(SubjectRepository.class);

    public QuestionDBWrapper(Object obj) {
        super(obj);
    }

    @Override
    protected void warpTheMap(Map<String, Object> map) {

        Subject subject = subjectRepository.findOne((Integer) map.get("subject"));

        map.put("status", QuestionDBStatus.valueOf((Integer) map.get("status")));
        map.put("gradeLevel", GradeLevel.valueOf((Integer) map.get("gradeLevel")));
        map.put("subject",subject.getName());

        map.put("cDate",DateTimeKit.date((Long) map.get("cDate")).toString());
        map.put("lastModifyDate",DateTimeKit.date((Long) map.get("lastModifyDate")).toString());

    }
}
