package com.baizhi.entity;

import java.util.List;

public class Guru {
    private String id;
    private String img;
    private String name;
    private String sex;
    private List<Article> articles;

    @Override
    public String toString() {
        return "Guru{" +
                "id='" + id + '\'' +
                ", img='" + img + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", articles=" + articles +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public Guru(String id, String img, String name, String sex, List<Article> articles) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.sex = sex;
        this.articles = articles;
    }

    public Guru() {
    }
}
