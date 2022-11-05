package com.ssm.service;

import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Order;
import com.ssm.pojo.Params;
import com.ssm.pojo.User;
import com.ssm.until.Page;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 
 * @since 2021-12-31
 */
public interface OrderService extends IService<Order> {

    //增加
    int addOrder(Order order);

    //删除
    int  deleteOrderById(int id);

    //更新
    int updateOrder(Order order);

    //查询
    Order queryOrderById( int id);

    //查询全部的
    List<Order> queryAllOrder();

    List<Order> queryOrderByName(String Name);

    PageInfo<Order> selectOrders(Params params);

    PageInfo<Order> selectMyOrders(Integer userId,Integer page);

    boolean addCart(Integer bookId, User user);

    int queryOrderCount();

    List<Order> getOrderByLimit(Page page);
}
