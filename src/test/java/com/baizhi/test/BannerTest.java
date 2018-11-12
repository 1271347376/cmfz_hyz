package com.baizhi.test;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BannerTest extends BasicTest{
    @Autowired
    private BannerDao bannerDao;

    @Autowired
    private BannerService bannerService;

    @Test
    public void  test01(){
        List<Banner> banners = bannerDao.queryAll();
        System.out.println(banners);

    }

    @Test
    public void test02(){
        List<Banner> all = bannerService.findAll();
        System.out.println(all);
    }
}
