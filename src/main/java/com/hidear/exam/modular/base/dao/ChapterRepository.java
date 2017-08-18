package com.hidear.exam.modular.base.dao;

import com.hidear.exam.modular.base.model.Chapter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * Created by Administrator on 2017/8/18.
 */
public interface ChapterRepository extends JpaRepository<Chapter,Integer>,JpaSpecificationExecutor<Chapter> {

    public List<Chapter> findByTextBookId(Integer textBookId);
}
