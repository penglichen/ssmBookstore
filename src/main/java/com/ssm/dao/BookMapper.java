package com.ssm.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssm.pojo.Book;
import com.ssm.pojo.PageInfo;
import com.ssm.until.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper extends BaseMapper<Book> {
    //增加一本书
    int addBook(Book book);

    //删除一本书
    int  deleteBookById(@Param("bookId") int id);

    //更新一本书
    int updateBook(Book book);

    //查询一本书
    Book queryBookById(@Param("bookId") int id);

    //查询全部的书
    List<Book> queryAllBook();

    List<Book> queryBookByName(@Param("bookName") String bookName);


    int queryBookCount();

    List<Book> getBookByLimit(Page page);

    public PageInfo<Book> findAllBooksByPage(Integer currentPage, Integer pageSize);
}
