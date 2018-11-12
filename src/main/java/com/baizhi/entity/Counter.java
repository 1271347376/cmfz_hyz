package com.baizhi.entity;

import java.util.Date;

public class Counter {
    private String id;
    private String title;
    private Integer count;
    private Date recordDate;
    private String user_id;
    private String couser_id;

    @Override
    public String toString() {
        return "Counter{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", count=" + count +
                ", recordDate=" + recordDate +
                ", user_id='" + user_id + '\'' +
                ", couser_id='" + couser_id + '\'' +
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

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getCouser_id() {
        return couser_id;
    }

    public void setCouser_id(String couser_id) {
        this.couser_id = couser_id;
    }

    public Counter(String id, String title, Integer count, Date recordDate, String user_id, String couser_id) {
        this.id = id;
        this.title = title;
        this.count = count;
        this.recordDate = recordDate;
        this.user_id = user_id;
        this.couser_id = couser_id;
    }

    public Counter() {
    }
}
