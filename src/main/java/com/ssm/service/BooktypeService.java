package com.ssm.service;

import com.ssm.pojo.Booktype;
import com.ssm.until.Page;

import java.util.List;

public interface BooktypeService {
    //增加图书类型
    int addBooktype(Booktype booktype);

    //删除图书类型
    int  deleteBooktypeById(int id);

    //更新图书类型
    int updateBooktype(Booktype booktype);

    //查询图书类型
    Booktype queryBooktypeById(int id);

    //查询全部的图书类型
    List<Booktype> queryAllBooktype();

    List<Booktype> queryBooktypeByName(String typeName);

    int queryBooktypeCount();

    List<Booktype> getBooktypeByLimit(Page page);
}
