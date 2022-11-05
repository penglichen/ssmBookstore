package com.ssm.service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssm.dao.UserMapper;
import com.ssm.pojo.User;
import com.ssm.until.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl extends ServiceImpl<UserMapper, User>  implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }
    @Override
    public int deleteUserById(int userId) {
        return userMapper.deleteUserById(userId);
    }
    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }
    @Override
    public User queryUserById(int userId) {
        return userMapper.queryUserById(userId);
    }
    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public List<User> queryUserByName(String username) {
        return userMapper.queryUserByName(username);
    }

    @Override
    public int queryUserCount() {
        return userMapper.queryUserCount();
    }

    @Override
    public List<User> getUserByLimit(Page page) {
        return userMapper.getUserByLimit(page);
    }

    @Override
    public User queryByuserNameAndPassword(User user) {
        return userMapper.queryByuserNameAndPassword(user);
    }

}
