package com.baizhi.service;

import com.baizhi.entity.Guru;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GuruService extends BaseService<Guru> {
    List<Guru> queryPage(@Param("page") Integer page, @Param("rows") Integer rows);
}
