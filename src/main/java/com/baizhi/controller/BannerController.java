package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
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
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    @RequestMapping("/showBanner")
    public @ResponseBody Map<String,Object> showBanner(Integer page,Integer rows){
        Map<String,Object> results = new HashMap<String,Object>();
        List<Banner> all = bannerService.queryPage(page,rows);
        Long totals = bannerService.queryTotal();
        results.put("total", totals);
        results.put("rows",all);
        return results;
    }


    @RequestMapping("/delOne")
    public @ResponseBody void delOne(String id){
        bannerService.remove(id);
    }

    @RequestMapping("/delMore")
    public  @ResponseBody void delMore(String[] ids){
        for (int i = 0; i < ids.length; i++) {
            bannerService.remove(ids[i]);
        }
    }

    @RequestMapping("/addBanner")
    public @ResponseBody Map<String,Object> addBanner(MultipartFile file, HttpSession session, Banner banner){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            String file1 = UploadUtil.file(session, file, "/back/banner/img");
            banner.setImgPath(file1);
            bannerService.add(banner);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/showOne")
    public @ResponseBody Banner showOne(Banner banner){
        return bannerService.findOne(banner);
    }

    @RequestMapping("/editBanner")
    public @ResponseBody Map<String,Object> editBanner(MultipartFile file, HttpSession session,Banner banner){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            String file1 = UploadUtil.file(session, file, "/back/banner/img");
            banner.setImgPath(file1);
            banner.setImgPath(file1);
            bannerService.motify(banner);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }


}
