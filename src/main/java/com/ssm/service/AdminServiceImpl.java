package com.ssm.service;

import com.ssm.dao.AdminMapper;
import com.ssm.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public List<Admin> queryAllAdmin() {
        return adminMapper.queryAllAdmin();
    }

    @Override
    public int queryByadminnameAndPassword(Admin admin) {
        return adminMapper.queryByadminnameAndPassword(admin);
    }

    @Override
    public Admin queryadminname(String adminname) {
        return adminMapper.queryadminname(adminname);
    }
}
