package com.baizhi.controller;

import com.baizhi.entity.Article;
import com.baizhi.entity.Guru;
import com.baizhi.service.ArticleService;
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
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping("/showAllArticle")
    public @ResponseBody Map<String,Object> showAllArticle(Integer page , Integer rows){
        Map<String,Object> results = new HashMap<String,Object>();
        List<Article> all = articleService.queryPage(page,rows);
        Long totals = articleService.queryTotal();
        results.put("total", totals);
        results.put("rows",all);
        return results;
    }

    @RequestMapping("/showOneArticle")
    public @ResponseBody Article showOneArticle(Article article){
        return articleService.findOne(article);
    }



    @RequestMapping("/addArticle")
    public @ResponseBody  Map<String,Object> addArticle(Article article, MultipartFile file, HttpSession session){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            String file1 = UploadUtil.file(session, file, "/back/article/img");
            article.setImgPath(file1);
            articleService.add(article);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }


    @RequestMapping("/editArticle")
    public @ResponseBody  Map<String,Object> editArticle(Article article, MultipartFile file, HttpSession session){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            String file1 = UploadUtil.file(session, file, "/back/article/img");
            article.setImgPath(file1);
            articleService.motify(article);
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
        articleService.remove(id);
    }

    @RequestMapping("/delMore")
    public  @ResponseBody void delMore(String[] ids){
        for (int i = 0; i < ids.length; i++) {
            articleService.remove(ids[i]);
        }
    }




}
