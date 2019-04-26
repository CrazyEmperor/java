package com.mr;

import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created by 黄圣博 on 2019/4/2.
 */
public class testRedis {
    public static void main(String[] args) {
        GenericObjectPoolConfig GOP = new GenericObjectPoolConfig();
        JedisPool jedisPool = new JedisPool(GOP,"127.0.0.1",6379,10000,"111111");
//        JedisPool jedisPool = new JedisPool("127.0.0.1",6379);
        Jedis jedis = jedisPool.getResource();
//        jedis.auth("111111");
        //list
        String ping = jedis.ping();
        System.out.println(ping);
        System.out.println("----------------------------");
        jedis.rpush("list2","1","2","3","4","5","6");
        List<String> list2 = jedis.lrange("list2", 0, -1);
        for (int i = 0; i <list2.size() ; i++) {
            System.out.println(list2.get(i));
        }
        System.out.println("移除list2集合第一位元素并返回-------------------");
        String list21 = jedis.lpop("list2");
        System.out.println(list21);
        System.out.println("list2----------------------------------------");
        List<String> list = jedis.lrange("list", 0, -1);
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i));
        }
        System.out.println("list----------------");
        String w1 = jedis.hget("w1","w2");
        System.out.println(w1);
        System.out.println("w1----------------");
        String set = jedis.set("x1", "x2");
        System.out.println(set);
        System.out.println("x1----------------");
        jedis.sadd("set2","1","1","1","2");
        Set<String> set2 = jedis.smembers("set2");
        Iterator<String> iterator1 = set2.iterator();
        while(iterator1.hasNext()){
            System.out.println(iterator1.next());
        }
        System.out.println("set2----------------------------------------");
        Set<String> set1 = jedis.smembers("set");
        Iterator<String> iterator = set1.iterator();
        while (iterator.hasNext()){
            String next = iterator.next();
            System.out.println(next);
        }
        System.out.println("set-------------------------------------");
        String list22 = jedis.rpop("list2");
        System.out.println(list22);
        System.out.println("移除并获取list最后一个元素-----------------------");
        Set<String> keys1 = jedis.keys("*");
        Iterator<String> iterator3 = keys1.iterator();
        while(iterator3.hasNext()){
            System.out.println(iterator3.next());
        }
        System.out.println("--------yi数据库所有key-------------");
        String select = jedis.select(1);
        System.out.println(select);
        System.out.println("进入下标为二的数据库");
        Set<String> keys = jedis.keys("*");
        Iterator<String> iterator2 = keys.iterator();
        while(iterator2.hasNext()){
            System.out.println(iterator2.next());
        }
        System.out.println("二数据库keys----------------------");
        String set3 = jedis.set("er1", "va1");
        jedis.mset("er2","va2","er3","va3","er4","va4","er5","va5");
        List<String> mget = jedis.mget("er2", "er3", "er4");
        for (int i = 0; i <mget.size() ; i++) {
            System.out.println(mget.get(i));
        }
        System.out.println("er获取多个key------------------------");
        jedis.close();

    }

}
