package com.mr.redis.service;

import com.mr.redis.Page;
import com.mr.redis.pojo.User;

import java.util.List;

/**
 * Created by 黄圣博 on 2019/4/8.
 */
public interface MsgService {
    public List<User> selectAll(Page page, User user);
    public void addUser(User user);

    void delUser(int i);

    public void update(User user);

    User selectById(int i);
    public Integer selectCount();
}
