package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;


    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Admin> queryPage(Integer page, Integer rows) {
        return null;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Long queryTotal() {
        return null;
    }



    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Admin findOne(Admin admin) {
        return adminDao.queryOne(admin);
    }

    @Override
    public List<Admin> findAll() {
        return null;
    }

    @Override
    public void add(Admin admin) {

    }


    @Override
    public void motify(Admin admin) {
        adminDao.update(admin);
    }


    @Override
    public void remove(String id) {

    }


}
