package com.baizhi.service;

import com.baizhi.entity.Banner;

import java.util.List;

public interface BaseService<T> {
    T findOne(T t);
    List<T> findAll();
    void add(T t);
    void motify(T t);
    void remove(String id);
    List<T> queryPage(Integer page, Integer rows);
    Long queryTotal();
}
