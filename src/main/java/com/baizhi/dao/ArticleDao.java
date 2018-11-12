package com.baizhi.dao;

import com.baizhi.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleDao extends BaseDao<Article> {
    void deleteOneByGuruId(@Param("id") String id);
}
