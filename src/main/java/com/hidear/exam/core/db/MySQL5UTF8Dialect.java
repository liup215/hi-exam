package com.hidear.exam.core.db;

import org.hibernate.dialect.MySQL5InnoDBDialect;

/**
 * Created by Administrator on 2017/7/10.
 */
public class MySQL5UTF8Dialect extends MySQL5InnoDBDialect{

    @Override
    public String getTableTypeString() {
        return " ENGINE=InnoDB DEFAULT CHARSET=utf8";
    }
}
