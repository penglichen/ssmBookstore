package com.ssm.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssm.pojo.Order;
import com.ssm.pojo.User;
import com.ssm.until.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper extends BaseMapper<Order> {

    //增加图书类型
    int addOrder(Order order);

    //删除图书类型
    int  deleteOrderById(@Param("id") int id);

    //更新图书类型
    int updateOrder(Order order);

    //查询图书类型
    Order queryOrderById(@Param("id") int id);

    //查询全部的图书类型
    List<Order> queryAllOrder();

    List<Order> queryOrderByName(@Param("date") String date);

    int queryOrderCount();

    List<Order> getOrderByLimit(Page page);
}
