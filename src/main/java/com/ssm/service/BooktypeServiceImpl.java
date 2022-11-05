package com.ssm.service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssm.dao.BooktypeMapper;
import com.ssm.pojo.Booktype;
import com.ssm.until.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BooktypeServiceImpl  implements BooktypeService {

    @Autowired
    private BooktypeMapper booktypeMapper;

    @Override
    public int addBooktype(Booktype booktype) {
        return booktypeMapper.addBooktype(booktype);
    }

    @Override
    public int deleteBooktypeById(int id) {
        return booktypeMapper.deleteBooktypeById(id);
    }

    @Override
    public int updateBooktype(Booktype booktype) {
        return booktypeMapper.updateBooktype(booktype);
    }

    @Override
    public Booktype queryBooktypeById(int id) {
        return booktypeMapper.queryBooktypeById(id);
    }

    @Override
    public List<Booktype> queryAllBooktype() {
        return booktypeMapper.queryAllBooktype();
    }

    @Override
    public List<Booktype> queryBooktypeByName(String typeName) {
        return booktypeMapper.queryBooktypeByName(typeName);
    }

    @Override
    public int queryBooktypeCount() {
        return booktypeMapper.queryBooktypeCount();
    }

    @Override
    public List<Booktype> getBooktypeByLimit(Page page) {
        return booktypeMapper.getBooktypeByLimit(page);
    }
}
