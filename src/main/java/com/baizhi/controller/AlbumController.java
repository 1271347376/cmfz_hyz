package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.entity.Article;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AlbumService;
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
@RequestMapping("/album")
public class AlbumController {

    @Autowired
    private AlbumService albumService;

    @RequestMapping("/showAllAlbum")
    public @ResponseBody
    Map<String,Object> showAllAlbum(Integer page , Integer rows){
        Map<String,Object> results = new HashMap<String,Object>();
        List<Album> all = albumService.queryPage(page,rows);
        Long totals = albumService.queryTotal();
        results.put("total", totals);
        results.put("rows",all);
        return results;
    }


    @RequestMapping("/addAlbum")
    public @ResponseBody
    Map<String, Object> addAlbum(MultipartFile file, HttpSession session, Album album) {
        Map<String, Object> results = new HashMap<String, Object>();
        try {
            String file1 = UploadUtil.file(session, file, "/back/album/img");
            album.setCoverImg(file1);
            albumService.add(album);
            results.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            results.put("success", false);
            results.put("message", e.getMessage());
        }
        return results;
    }

    @RequestMapping("/editAlbum")
    public @ResponseBody Map<String,Object> editAlbum(MultipartFile file, HttpSession session,Album album){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            String file1 = UploadUtil.file(session, file, "/back/album/img");
            album.setCoverImg(file1);
            albumService.motify(album);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/queryAllAlbum")
    public @ResponseBody List<Album> queryAllAlbum(){
        return albumService.findAll();
    }


    @RequestMapping("/showOneAlbum")
    public @ResponseBody Album showOneAlbum(Album album){
        return albumService.findOne(album);
    }



}
