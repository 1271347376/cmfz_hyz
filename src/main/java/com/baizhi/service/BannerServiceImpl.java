package com.baizhi.service;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {

    @Autowired
    private BannerDao bannerDao;


    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Banner findOne(Banner banner) {
        return bannerDao.queryOne(banner);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Long queryTotal() {
        return bannerDao.queryTotal();
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Banner> queryPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return bannerDao.queryPage(start,rows);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Banner> findAll() {
        return bannerDao.queryAll();
    }

    @Override
    public void add(Banner banner) {
        banner.setId(UUID.randomUUID().toString());
        banner.setCreateDate(new Date());
        bannerDao.insert(banner);
    }

    @Override
    public void motify(Banner banner) {
        bannerDao.update(banner);
    }

    @Override
    public void remove(String id) {
        bannerDao.deleteOne(id);
    }
}
