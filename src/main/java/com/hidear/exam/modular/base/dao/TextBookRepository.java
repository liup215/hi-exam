package com.hidear.exam.modular.base.dao;

import com.hidear.exam.modular.base.model.TextBook;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * Created by Administrator on 2017/8/3.
 */
public interface TextBookRepository extends JpaRepository<TextBook,Integer>,JpaSpecificationExecutor<TextBook> {
}
