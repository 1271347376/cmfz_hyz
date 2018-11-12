package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.util.MD5Util;
import com.baizhi.util.RandomStringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public User findOne(User user) {
        return userDao.queryOne(user);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<User> findAll() {
        return userDao.queryAll();
    }


    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public void add(User user) {
        user.setId(UUID.randomUUID().toString());
        String salt = RandomStringUtil.getRandomString(6);
        user.setSalt(salt);
        String password = MD5Util.MD5(user.getPassword() + salt);
        user.setPassword(password);
        user.setCreateDate(new Date());
        userDao.insert(user);

    }

    @Override
    public void motify(User user) {
        String salt = RandomStringUtil.getRandomString(6);
        user.setSalt(salt);
        String password = MD5Util.MD5(user.getPassword() + salt);
        user.setPassword(password);
        userDao.update(user);

    }

    @Override
    public void remove(String id) {

    }


    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<User> queryPage(Integer page, Integer rows) {
        return null;
    }


    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Long queryTotal() {
        return null;
    }
}
