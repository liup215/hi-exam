package com.hidear.exam.modular.base.service.serviceImpl;

import com.hidear.exam.core.support.BeanKit;
import com.hidear.exam.modular.base.dao.TestingPointRepository;
import com.hidear.exam.modular.base.model.TestingPoint;
import com.hidear.exam.modular.base.service.ITestPointService;
import com.hidear.exam.modular.base.wrapper.TestingPointWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by acer on 2017/11/26.
 */
@Service
public class TestingPointServiceImpl implements ITestPointService {
    @Autowired
    TestingPointRepository testingPointRepository;

    @Override
    public Map<String, Object> getTestingPoint() {
        List<Map<String,Object>> testingPointList = new ArrayList<>();
        List<TestingPoint> testingPoints = testingPointRepository.findAll();
        for(TestingPoint testingPoint : testingPoints){
            Map<String,Object> map = BeanKit.beanToMap(testingPoint);
            testingPointList.add(map);
        }

        Map<String,Object> maps = new HashMap();
        maps.put("code",0);
        maps.put("msg","");
        maps.put("data",(new TestingPointWrapper(testingPointList)).warp());
        maps.put("count",testingPointList.size());

        return maps;
    }
}
