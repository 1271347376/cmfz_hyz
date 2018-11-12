package com.baizhi.service;

import com.baizhi.dao.CourseDao;
import com.baizhi.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseDao courseDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Course findOne(Course course) {
        return courseDao.queryOne(course);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Course> findAll() {
        return courseDao.queryAll();
    }

    @Override
    public void add(Course course) {
        course.setId(UUID.randomUUID().toString());
        course.setRecordDate(new Date());
        courseDao.insert(course);
    }

    @Override
    public void motify(Course course) {
        courseDao.update(course);
    }

    @Override
    public void remove(String id) {
        courseDao.deleteOne(id);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Course> queryPage(Integer page, Integer rows) {
        int start = (page-1)*rows;
        return courseDao.queryPage(start,rows);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Long queryTotal() {
        return courseDao.queryTotal();
    }
}
