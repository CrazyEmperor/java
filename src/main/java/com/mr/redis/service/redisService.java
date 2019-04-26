package com.mr.redis.service;

import com.mr.redis.pojo.Student;

/**
 * Created by 黄圣博 on 2019/4/2.
 */
public interface redisService {
    public String addStu (Student student);
    public void uparedis(Student student);
    void select(String key);
    public void del(String key);
    public void selectAll();
}
