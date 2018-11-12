package com.baizhi.test;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class AdminTest extends BasicTest {

    @Autowired
    private AdminService adminService;

    @Test
    public void test01(){
        Admin admin = new Admin();
        admin.setTelphone("123");
        admin.setPassword("123");
        Admin one = adminService.findOne(admin);
        System.out.println(one);
    }
}
