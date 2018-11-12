package com.baizhi.service;

import com.baizhi.dao.ArticleDao;
import com.baizhi.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Article findOne(Article article) {
        return articleDao.queryOne(article);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Article> findAll() {
        return articleDao.queryAll();
    }

    @Override
    public void add(Article article) {
        article.setId(UUID.randomUUID().toString());
        article.setPublishDate(new Date());
        articleDao.insert(article);
    }

    @Override
    public Long queryTotal() {
        return articleDao.queryTotal();
    }

    @Override
    public void removeOneByGuruId(String id) {
        articleDao.deleteOneByGuruId(id);
    }

    @Override
    public List<Article> queryPage(Integer page, Integer rows) {
        int start = (page-1)*rows;
        return articleDao.queryPage(start,rows);
    }

    @Override
    public void motify(Article article) {
        articleDao.update(article);
    }

    @Override
    public void remove(String id) {
        articleDao.deleteOne(id);
    }
}
