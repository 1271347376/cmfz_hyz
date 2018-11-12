package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.entity.Guru;
import com.baizhi.service.ArticleService;
import com.baizhi.service.GuruService;
import com.baizhi.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/guru")
public class GuruController {

    @Autowired
    private GuruService guruService;

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/showOneGuru")
    public @ResponseBody Guru showOne(Guru guru){
        return guruService.findOne(guru);
    }

    @RequestMapping("/showAllGuru")
    public @ResponseBody Map<String,Object> showAllGuru(Integer page ,Integer rows){
        Map<String,Object> results = new HashMap<String,Object>();
        List<Guru> all = guruService.queryPage(page,rows);
        Long totals = guruService.queryTotal();
        results.put("total", totals);
        results.put("rows",all);
        return results;
    }

    @RequestMapping("showAll")
    public @ResponseBody List<Guru> showAll(){
        return guruService.findAll();
    }

    @RequestMapping("/addGuru")
    public @ResponseBody Map<String,Object>  addGuru(Guru guru, MultipartFile file, HttpSession session){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            String file1 = UploadUtil.file(session, file, "/back/guru/img");
            guru.setImg(file1);
            guruService.add(guru);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/editGuru")
    public @ResponseBody Map<String,Object> editGuru(MultipartFile file, HttpSession session,Guru guru){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            String file1 = UploadUtil.file(session, file, "/back/guru/img");
            guru.setImg(file1);
            guruService.motify(guru);
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
        guruService.remove(id);
        articleService.removeOneByGuruId(id);
    }

    @RequestMapping("/delMore")
    public  @ResponseBody void delMore(String[] ids){
        for (int i = 0; i < ids.length; i++) {
            guruService.remove(ids[i]);
            articleService.removeOneByGuruId(ids[i]);
        }
    }



}
