package com.hidear.exam.core.db;

import com.hidear.exam.core.util.SpringContextHolder;
import org.springframework.data.jpa.repository.JpaRepository;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/7/8.
 */
public class Db<T> {

    /**
     * 每个Db类，包装一个Mapper接口,这个clazz就是接口的类类型，例如UserMapper.class
     */
    private Class clazz;

    /**
     * Mapper的父类接口
     */
    private JpaRepository<T,Serializable> baseRepository;

    /**
     * 私有构造方法，不允许自己创建
     */
    private Db(Class clazz) {
        this.clazz = clazz;
        this.baseRepository = (JpaRepository<T, Serializable>) SpringContextHolder.getBean(clazz);
    }

    /**
     * <p>
     * 创建包含指定mapper的Db工具类,使用本类的第一种用法
     *
     * @param clazz mapper的类类型
     * @date 2017年2月22日 下午10:09:31
     */
    public static <T> Db<T> create(Class<T> clazz) {
        return new Db<T>(clazz);
    }

    /**
     * <p>
     * 获取一个mapper的快捷方法
     * @date 2017年2月22日 下午10:31:35
     */
    public JpaRepository<T,Serializable> getRepository() {
        return this.baseRepository;
    }

    /**
     * <p>
     * 获取一个mapper的快捷方法
     *
     * @param clazz mapper类的类对象
     * @date 2017年2月22日 下午10:31:35
     */
    public static <T> T getRepository(Class<T> clazz) {
        return SpringContextHolder.getBean(clazz);
    }

    /**
     * 通过一个条件获取数据库中的一条记录(会返回null)
     *
     * @date 2017年2月22日 下午10:45:51
     */
//    public <E> E selectOneByCon(String condition, Object value) {
//        List<?> results = selectOneByConList(condition, value);
//        if (results != null && results.size() > 0) {
//            return (E) results.get(0);
//        } else {
//            return null;
//        }
//    }

    /**
     * 通过一个条件获取一堆记录(会返回null)
     *
     * @date 2017年2月22日 下午10:45:51
     */
//    public <E> List<E> selectOneByConList(String condition, Object value) {
//        HashMap<String, Object> conditionMap = new HashMap<String, Object>();
//        conditionMap.put(condition, value);
//
//        List<E> results = (List<E>) this.baseRepository.selectByMap(conditionMap);
//        if (results == null || results.size() == 0) {
//            return null;
//        } else {
//            return results;
//        }
//    }
}
