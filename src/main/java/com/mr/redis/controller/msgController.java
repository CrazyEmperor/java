package com.mr.redis.controller;

import com.mr.redis.Page;
import com.mr.redis.pojo.User;
import com.mr.redis.service.MsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 黄圣博 on 2019/4/8.
 */
@Controller()
@RequestMapping("msg")
public class msgController {
    @Autowired
    private MsgService msgService;
@RequestMapping("selectAll")
@ResponseBody
    public Map<String,Object> selectAll(Page page,User user){
    List<User> users = msgService.selectAll(page,user);
    Integer integer = msgService.selectCount();
    int size = users.size();
    Map<String,Object> resultMap = new HashMap<String, Object>();
        resultMap.put("code",0);
        resultMap.put("msg","");
        resultMap.put("count",Integer.toString(size));
        resultMap.put("data",users);
        return resultMap;
    }
    @RequestMapping("add")
    @ResponseBody
    public void addUser(User user){
        msgService.addUser(user);
    }
    @RequestMapping("del")
    @ResponseBody
    public void delUser(String id){
        msgService.delUser(Integer.parseInt(id));
    }
    @RequestMapping("selectById")
    @ResponseBody
    public User selectByid(String id){
        User update = msgService.selectById(Integer.parseInt(id));
        return update;
    }
    @RequestMapping("update")
    @ResponseBody
    public void update(User user){
        msgService.update(user);
    }
}
