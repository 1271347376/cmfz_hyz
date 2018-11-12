package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(User user, HttpSession session,HttpServletRequest request){
        User one = userService.findOne(user);
        if(one!=null){
            String password = MD5Util.MD5(user.getPassword() + one.getSalt());
            user.setPassword(password);
            User login = userService.login(user);
            if(login!=null){
                session.setAttribute("login",login);
                return "redirect:/index.jsp";
            }else{
                request.setAttribute("message","密码输入错误");
                return "/back/user/login";
            }
        }else{
            request.setAttribute("message","账号输入错误");
            return "/back/user/login";
        }
    }


    @RequestMapping("/register")
    public @ResponseBody void register(User user){
        userService.add(user);
    }


    @RequestMapping("/editUser")
    public @ResponseBody Map<String,Object> editUser(User user,HttpSession session,String oldPassword){
        Map<String,Object> results = new HashMap<String,Object>();
        User one = userService.findOne(user);
        try {
            if(one.getPassword().equals(oldPassword)){
                userService.motify(user);
                results.put("success",true);
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




}
