package com.hidear.exam.modular.base.service.serviceImpl;

import com.hidear.exam.modular.base.status.GradeStatus;
import com.hidear.exam.modular.base.dao.GradeRepository;
import com.hidear.exam.modular.base.model.Grade;
import com.hidear.exam.modular.base.service.IGradeService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/24.
 */
@Service
public class GradeServiceImpl implements IGradeService {

    @Autowired
    GradeRepository gradeRepository;

    @Override
    public List<Map<String, Object>> selectGrades(String gradeName, Integer level) {
        List<Map<String, Object>> list = new ArrayList<>();
        List<Grade> grades = gradeRepository.findAll();

        for(Grade grade:grades){
            Map<String,Object> map = new HashedMap();
            map.put("id",grade.getId());
            map.put("name",grade.getName());
            map.put("level",grade.getLevel());
            map.put("status",grade.getStatus());

            list.add(map);
        }

        return list;
    }

    @Override
    public void deleteGradeById(Integer gradeId) {
        Grade grade = gradeRepository.findOne(gradeId);

        //判断这个年级的状态
        if(grade.getStatus().equals(GradeStatus.OK.getCode())){
            setGradeStatusDeleted(grade);
        }

        gradeRepository.delete(grade);

    }

    private void setGradeStatusDeleted(Grade grade) {

        grade.setStatus(GradeStatus.DELETED.getCode());
        gradeRepository.save(grade);
    }
}
