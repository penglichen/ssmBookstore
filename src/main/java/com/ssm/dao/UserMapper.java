package com.ssm.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssm.pojo.User;
import com.ssm.until.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {
    //增加
    int addUser(User user);

    //删除
    int  deleteUserById(@Param("userId") int userId);

    //更新
    int updateUser(User user);

    //查询
    User queryUserById(@Param("userId") int userId);

    //查询全部的
    List<User> queryAllUser();

    List<User> queryUserByName(@Param("userName") String username);

    int queryUserCount();

    List<User> getUserByLimit(Page page);

    User queryByuserNameAndPassword(User user); //根据用户名和密码查询


}
