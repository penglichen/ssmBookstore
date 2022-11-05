package com.ssm.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssm.pojo.Booktype;
import com.ssm.until.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BooktypeMapper extends BaseMapper<Booktype> {
    //增加图书类型
    int addBooktype(Booktype booktype);

    //删除图书类型
    int  deleteBooktypeById(@Param("typeId") int id);

    //更新图书类型
    int updateBooktype(Booktype booktype);

    //查询图书类型
    Booktype queryBooktypeById(@Param("typeId") int id);

    //查询全部的图书类型
    List<Booktype> queryAllBooktype();

    List<Booktype> queryBooktypeByName(@Param("typeName") String typeName);

    int queryBooktypeCount();

    List<Booktype> getBooktypeByLimit(Page page);
}
