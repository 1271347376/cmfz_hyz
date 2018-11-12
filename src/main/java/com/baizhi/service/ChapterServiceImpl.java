package com.baizhi.service;

import com.baizhi.dao.ChapterDao;
import com.baizhi.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService {

    @Autowired
    private ChapterDao chapterDao;

    @Override
    public Chapter findOne(Chapter chapter) {
        return null;
    }

    @Override
    public List<Chapter> findAll() {
        return null;
    }

    @Override
    public void add(Chapter chapter) {
        chapter.setId(UUID.randomUUID().toString());
        chapter.setUploadTime(new Date());
        String fileSize = chapter.getFileSize()+"M";
        chapter.setFileSize(fileSize);
        String duration = chapter.getDuration()+"分钟";
        chapter.setDuration(duration);
        chapterDao.insert(chapter);
    }

    @Override
    public void motify(Chapter chapter) {
        chapterDao.update(chapter);
    }

    @Override
    public void remove(String id) {
        chapterDao.deleteOne(id);
    }

    @Override
    public List<Chapter> queryPage(Integer page, Integer rows) {
        return null;
    }

    @Override
    public Long queryTotal() {
        return null;
    }
}
