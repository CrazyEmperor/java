package com.mr.redis;

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * Created by 黄圣博 on 2019/4/2.
 */
public class redisUtils {
    public static Jedis getReids(){
        GenericObjectPoolConfig GOP = new GenericObjectPoolConfig();
        JedisPool jedisPool = new JedisPool(GOP,"127.0.0.1",6379,10000,"111111");
        Jedis jedis = jedisPool.getResource();
        return jedis;
    }
}
