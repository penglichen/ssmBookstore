package com.ssm.service;

import com.ssm.pojo.Admin;

import java.util.List;

public interface AdminService {

    List<Admin> queryAllAdmin();  //查询所有用户

    int queryByadminnameAndPassword(Admin admin); //根据用户名和密码查询

    Admin queryadminname(String adminname);  //根据id查询用户名
}
