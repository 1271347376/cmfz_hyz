package com.baizhi.service;

import com.baizhi.dao.AlbumDao;
import com.baizhi.entity.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService{

    @Autowired
    private AlbumDao albumDao;


    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Album findOne(Album album) {
        return albumDao.queryOne(album);
    }



    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Album> findAll() {
        return albumDao.queryAll();
    }

    @Override
    public void add(Album album) {
        album.setId(UUID.randomUUID().toString());
        album.setPublishDate(new Date());
        albumDao.insert(album);
    }

    @Override
    public void motify(Album album) {
        albumDao.update(album);
    }

    @Override
    public void remove(String id) {
        albumDao.deleteOne(id);
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Album> queryPage(Integer page, Integer rows) {
        int start = (page-1)*rows;
        return albumDao.queryPage(start,rows);
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Long queryTotal() {
        return albumDao.queryTotal();
    }
}
