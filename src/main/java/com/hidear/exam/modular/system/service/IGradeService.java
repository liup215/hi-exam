package com.hidear.exam.modular.system.service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/24.
 */
public interface IGradeService {

    List<Map<String, Object>> selectGrades(String gradeName, Integer level);
}
