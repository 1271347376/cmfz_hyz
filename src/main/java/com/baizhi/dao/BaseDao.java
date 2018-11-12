package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDao<T> {
    T queryOne(T t);
    List<T> queryAll();
    void insert(T t);
    void update(T t);
    void deleteOne(@Param("id") String id);
    Long queryTotal();
    List<T> queryPage(@Param("page") Integer page, @Param("rows") Integer rows);
}
