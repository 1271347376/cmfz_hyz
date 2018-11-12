package com.baizhi.entity;

import java.util.List;

public class Menu {
    private String id;
    private String title;
    private String href;
    private String iconCls;
    private String fid;
    private List<Menu> menu;

    @Override
    public String toString() {
        return "Menu{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", href='" + href + '\'' +
                ", iconCls='" + iconCls + '\'' +
                ", fid='" + fid + '\'' +
                ", menu=" + menu +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public List<Menu> getMenu() {
        return menu;
    }

    public void setMenu(List<Menu> menu) {
        this.menu = menu;
    }

    public Menu(String id, String title, String href, String iconCls, String fid, List<Menu> menu) {
        this.id = id;
        this.title = title;
        this.href = href;
        this.iconCls = iconCls;
        this.fid = fid;
        this.menu = menu;
    }

    public Menu() {
    }
}
