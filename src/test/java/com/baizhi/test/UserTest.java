package com.baizhi.test;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.MD5Util;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserTest extends BasicTest {

    @Autowired
    private UserService userService;

    @Test
    public void test(){
        User user = new User("1.jpg","123","aaa","123","111","男","北京","1","1");
        userService.add(user);
    }

    @Test
    public void test02(){
        User user = new User();
        user.setPhoneNum("123");
        user.setPassword("123");
        userService.motify(user);
    }

    @Test
    public void test03(){
        User user = new User();
        user.setPhoneNum("123");
        user.setPassword("123");
        User one = userService.findOne(user);
        if(one!=null){
            String salt = one.getSalt();
            String password = MD5Util.MD5(user.getPassword() + salt);
            user.setPassword(password);
            User login = userService.login(user);
            if(login!=null){
                System.out.println("登陆成功");
            }else{
                System.out.println("密码输入错误");
            }
        }else{
            System.out.println("账号输入错误");
        }

    }






}
