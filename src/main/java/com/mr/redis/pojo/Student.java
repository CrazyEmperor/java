package com.mr.redis.pojo;

import sun.plugin2.message.Serializer;

import java.io.Serializable;

/**
 * Created by 黄圣博 on 2019/4/2.
 */
public class Student{
    private Integer sid;
    private String sname;
    private String sage;
    private String sphone;
    private String saddr;

    @Override
    public String toString() {
        return "Student{" +
                "sid=" + sid +
                ", sname='" + sname + '\'' +
                ", sage='" + sage + '\'' +
                ", sphone='" + sphone + '\'' +
                ", saddr='" + saddr + '\'' +
                '}';
    }

    public Student() {
    }

    public Student(Integer sid, String sname, String sage, String sphone, String saddr) {
        this.sid = sid;
        this.sname = sname;
        this.sage = sage;
        this.sphone = sphone;
        this.saddr = saddr;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSage() {
        return sage;
    }

    public void setSage(String sage) {
        this.sage = sage;
    }

    public String getSphone() {
        return sphone;
    }

    public void setSphone(String sphone) {
        this.sphone = sphone;
    }

    public String getSaddr() {
        return saddr;
    }

    public void setSaddr(String saddr) {
        this.saddr = saddr;
    }

}
