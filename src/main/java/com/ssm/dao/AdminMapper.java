package com.ssm.dao;

import com.ssm.pojo.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    List<Admin> queryAllAdmin();  //查询所有用户

    int queryByadminnameAndPassword(Admin admin); //根据用户名和密码查询

    Admin queryadminname(@Param("adminname")String adminname);  //根据id查询用户名
}
