package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.entity.Banner;
import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/showAllCourse")
    public @ResponseBody Map<String,Object> showAllCourse(Integer page , Integer rows){
        Map<String,Object> results = new HashMap<String,Object>();
        List<Course> all = courseService.queryPage(page,rows);
        Long totals = courseService.queryTotal();
        results.put("total", totals);
        results.put("rows",all);
        return results;
    }


    @RequestMapping("/showOneCourse")
    public @ResponseBody Course showOneCourse(Course course){
       return courseService.findOne(course);
    }


    @RequestMapping("/addCourse")
    public @ResponseBody Map<String,Object> addCourse(Course course){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            courseService.add(course);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/editCourse")
    public @ResponseBody Map<String,Object> editCourse(Course course){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            courseService.motify(course);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }


    @RequestMapping("/delOne")
    public @ResponseBody void delOne(String id){
        courseService.remove(id);
    }

    @RequestMapping("/delMore")
    public  @ResponseBody void delMore(String[] ids){
        for (int i = 0; i < ids.length; i++) {
            courseService.remove(ids[i]);
        }
    }

}
