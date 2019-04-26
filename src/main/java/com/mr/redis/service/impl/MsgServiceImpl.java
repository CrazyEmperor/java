package com.mr.redis.service.impl;

import com.github.pagehelper.PageHelper;
import com.mr.redis.Page;
import com.mr.redis.mapper.UserMapper;
import com.mr.redis.pojo.User;
import com.mr.redis.service.MsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 黄圣博 on 2019/4/8.
 */
@Service
public class MsgServiceImpl implements MsgService {
    @Autowired
    private UserMapper userMapper;

    public List<User> selectAll(Page page, User user){
        PageHelper.startPage(page.getPage(),page.getLimit());
        List<User> users = userMapper.selectAll(user);
        return users;
    }
    public void addUser(User user){
        userMapper.insertSelective(user);
    }

    @Override
    public void delUser(int i) {
        userMapper.deleteByPrimaryKey(i);
    }

    @Override
    public void update(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public User selectById(int i) {
        User user = userMapper.selectByPrimaryKey(i);
        return user;
    }
    public Integer selectCount(){
       Integer count = userMapper.selectCount();
       return count;
    }
}
