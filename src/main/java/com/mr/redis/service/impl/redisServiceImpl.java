package com.mr.redis.service.impl;

import com.mr.redis.RedisUtil;
import com.mr.redis.pojo.Student;
import com.mr.redis.redisUtils;
import com.mr.redis.service.redisService;
import com.mr.redis.utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.DataType;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisSentinelPool;

import java.util.Iterator;
import java.util.Set;

/**
 * Created by 黄圣博 on 2019/4/2.
 */
@Service
public class redisServiceImpl implements redisService {
@Autowired
    private RedisTemplate redisTemplate;

    public void del(String key){
        redisTemplate.delete(key);
    }
    public String addStu (Student student){
        ValueOperations valueOperations = redisTemplate.opsForValue();
        valueOperations.set("stu",student);
        return "";
    }
    @Override
    public void select(String key) {
//        DataType type = redisTemplate.type(key);
//        System.out.println(type);
        ValueOperations valueOperations = redisTemplate.opsForValue();
        Object o = valueOperations.get(key);
        System.out.println(o);
    }
    public void uparedis(Student student){
        ValueOperations valueOperations = redisTemplate.opsForValue();
        valueOperations.set("stu",student);
    }
    public void selectAll(){
        Set keys = redisTemplate.keys("*");
        Iterator<String> iterator = keys.iterator();
        while (iterator.hasNext()){
            String next = iterator.next();
            System.out.println(next);
        }
    }
}
