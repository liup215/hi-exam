package com.hidear.exam.modular.base.dao;

import com.hidear.exam.modular.base.model.TestingPoint;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by acer on 2017/11/26.
 */
public interface TestingPointRepository extends JpaRepository<TestingPoint,Integer> {
}
