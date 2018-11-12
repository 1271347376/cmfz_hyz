package com.baizhi.service;

import com.baizhi.dao.MenuDao;
import com.baizhi.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao menuDao;

    @Override
    public Menu findOne(Menu menu) {
        return null;
    }

    @Override
    public void remove(String id) {

    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Menu> findAll() {
        return menuDao.queryAll();
    }

    @Override
    public void add(Menu menu) {

    }

    @Override
    public void motify(Menu menu) {

    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Menu> queryPage(Integer page, Integer rows) {
        return null;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Long queryTotal() {
        return null;
    }
}
