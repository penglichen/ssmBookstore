package com.ssm.service;

import com.baomidou.mybatisplus.service.IService;
import com.ssm.pojo.Book;
import com.ssm.pojo.PageInfo;
import com.ssm.until.Page;

import java.util.List;

public interface BookService extends IService<Book> {
    //增加一本书
    int addBook(Book book);

    //删除一本书
    int  deleteBookById(int id);

    //更新一本书
    int updateBook(Book book);

    //查询一本书
    Book queryBookById(int id);

    //查询全部的书
    List<Book> queryAllBook();

    List<Book> queryBookByName(String bookName);

    int queryBookCount();

    List<Book> getBookByLimit(Page page);

    //前端所有书籍查询
    PageInfo<Book> selectBooks(Integer currentPage, Integer size);

}
