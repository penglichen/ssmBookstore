package com.ssm.service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssm.dao.BookMapper;
import com.ssm.pojo.Book;
import com.ssm.pojo.PageInfo;
import com.ssm.until.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements BookService {

    @Autowired
    private BookMapper bookMapper;

    @Override
    public int addBook(Book book) {
        return bookMapper.addBook(book);
    }

    @Override
    public int deleteBookById(int id) {
        return bookMapper.deleteBookById(id);
    }

    @Override
    public int updateBook(Book book) {
        return bookMapper.updateBook(book);
    }

    @Override
    public Book queryBookById(int id) {
        return bookMapper.queryBookById(id);
    }

    @Override
    public List<Book> queryAllBook() {
        return bookMapper.queryAllBook();
    }

    @Override
    public List<Book> queryBookByName(String bookName) {
        return bookMapper.queryBookByName(bookName);
    }

    @Override
    public int queryBookCount() {
        return bookMapper.queryBookCount();
    }

    @Override
    public List<Book> getBookByLimit(Page page) {
        return bookMapper.getBookByLimit(page);
    }

    @Override
    public PageInfo<Book> selectBooks(Integer currentPage, Integer pageSize) {
        List<Book> books = bookMapper.queryAllBook();

        PageInfo<Book> pageInfo = new PageInfo<>(books.size(), currentPage, pageSize, 5);

        //判断是否是最后一页,如果最后一页就显示最后一页的几条，不是最后一页就显示pageSize条
        if(currentPage==pageInfo.getTotalPage())
            pageInfo.setList(books.subList((currentPage-1)*pageSize, books.size()));
        else
            pageInfo.setList(books.subList((currentPage-1)*pageSize, (currentPage-1)*pageSize+pageSize));
        return pageInfo;

    }
}
