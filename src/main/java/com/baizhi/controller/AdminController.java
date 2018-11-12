package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String login(Admin admin, HttpSession session,String enCode){
        Admin admin1 = adminService.findOne(admin);
        Object code = session.getAttribute("validationCode");
        if(code.equals(enCode)){
            if(admin1!=null){
                session.setAttribute("admin",admin1);
                return "redirect:/back/main/main.jsp";
            }else{
                return "redirect:/back/login.jsp";
            }
        }else{
            return "redirect:/back/login.jsp";
        }


    }

    @RequestMapping("/updatePwd")
    public @ResponseBody Map<String,Object> updatePwd(HttpSession session,Admin admin, String password2){
        Admin admin1 = (Admin)session.getAttribute("admin");
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            if(admin1.getPassword().equals(password2)){
                adminService.motify(admin);
                results.put("success",true);
                session.removeAttribute("admin");
                session.setAttribute("admin",admin);
            }else{
                results.put("success",false);
                results.put("message","旧密码输入错误");
            }
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message","密码修改失败");
        }

        return results;
    }

    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.invalidate();
        return "redirect:/back/login.jsp";
    }


}
