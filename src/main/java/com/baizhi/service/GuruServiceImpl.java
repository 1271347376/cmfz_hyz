package com.baizhi.service;

import com.baizhi.dao.GuruDao;
import com.baizhi.entity.Guru;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class GuruServiceImpl implements GuruService {

    @Autowired
    private GuruDao guruDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Guru findOne(Guru guru) {
        return guruDao.queryOne(guru);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Guru> findAll() {
        return guruDao.queryAll();
    }

    @Override
    public void add(Guru guru) {
        guru.setId(UUID.randomUUID().toString());
        guruDao.insert(guru);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Long queryTotal() {
        return guruDao.queryTotal();
    }

    @Override
    public List<Guru> queryPage(Integer page, Integer rows) {
        int start = (page-1)*rows;
        return guruDao.queryPage(start,rows);
    }

    @Override
    public void motify(Guru guru) {
        guruDao.update(guru);
    }

    @Override
    public void remove(String id) {
        guruDao.deleteOne(id);
    }
}
