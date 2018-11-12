package com.baizhi.service;

import com.baizhi.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleService extends BaseService<Article> {
    void removeOneByGuruId(@Param("id") String id);
}
