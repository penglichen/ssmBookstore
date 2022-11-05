package com.ssm.service;

import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Order;
import com.ssm.pojo.User;
import com.ssm.until.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService extends IService<User> {
    //增加
    int addUser(User user);

    //删除
    int  deleteUserById( int userId);

    //更新
    int updateUser(User user);

    //查询
    User queryUserById( int userId);

    //查询全部的
    List<User> queryAllUser();

    List<User> queryUserByName(String username);

    int queryUserCount();

    List<User> getUserByLimit(Page page);

    User queryByuserNameAndPassword(User user); //根据用户名和密码查询

}
