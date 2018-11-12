package com.baizhi.test;

import com.baizhi.dao.ArticleDao;
import com.baizhi.util.MD5Util;
import com.baizhi.util.RandomStringUtil;
import com.sun.xml.internal.messaging.saaj.util.Base64;
import org.aspectj.weaver.ast.Var;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLOutput;

public class ArticleTest extends BasicTest{
    @Autowired
    private ArticleDao articleDao;

    @Test
    public void test01() throws NoSuchAlgorithmException {
        String test = MD5Util.MD5("123456");
        System.out.println(test);
    }

    @Test
    public void test02(){
        String randomString = RandomStringUtil.getRandomString(6);
        System.out.println(randomString);
    }
}
