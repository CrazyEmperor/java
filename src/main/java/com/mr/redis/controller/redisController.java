package com.mr.redis.controller;

import com.mr.redis.pojo.Student;
import com.mr.redis.service.redisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 黄圣博 on 2019/4/2.
 */
@Controller
@RequestMapping("redisController")
public class redisController {
    @Autowired
    private redisService redisService;

    @RequestMapping("addredis")
    @ResponseBody
    public void redisService(Student student){
//        Student stu = new Student(1,"qwe","12","1111111111","adcaca");
        String s = redisService.addStu(student);
        System.out.println(s);
    }
    @RequestMapping("updateredis")
    @ResponseBody
    public void updateService(Student student){
//        Student stu = new Student(1,"qwe","12","1111111111","adcaca");
        redisService.uparedis(student);
    }
    @RequestMapping("select")
    @ResponseBody
    public void select(String key){
        redisService.select(key);
    }
    @RequestMapping("del")
    @ResponseBody
    public void delredis(String key){
        redisService.del(key);
    }
    @RequestMapping("selectAll")
    @ResponseBody
    public void selectAll(){
        redisService.selectAll();
    }
}
