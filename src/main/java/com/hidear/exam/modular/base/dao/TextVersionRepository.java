package com.hidear.exam.modular.base.dao;

import com.hidear.exam.modular.base.model.TextVersion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by acer on 2017/8/1.
 */
public interface TextVersionRepository extends JpaRepository<TextVersion,Integer>,JpaSpecificationExecutor<TextVersion> {
}
