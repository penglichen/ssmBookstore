package com.ssm.service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.BookMapper;
import com.ssm.dao.OrderMapper;
import com.ssm.pojo.Book;
import com.ssm.pojo.Order;
import com.ssm.pojo.Params;
import com.ssm.pojo.User;
import com.ssm.until.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 
 * @since 2021-12-31
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    @Resource
    private OrderMapper orderMapper;
    @Resource
    private BookMapper bookMapper;

    public int addOrder(Order order) {
        return orderMapper.addOrder(order);
    }
    @Override
    public int deleteOrderById(int id) {
        return orderMapper.deleteOrderById(id);
    }
    @Override
    public int updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }
    @Override
    public Order queryOrderById(int id) {
        return orderMapper.queryOrderById(id);
    }
    @Override
    public List<Order> queryAllOrder() {
        return orderMapper.queryAllOrder();
    }
    @Override
    public List<Order> queryOrderByName(String Name) {
        return orderMapper.queryOrderByName(Name);
    }

    public PageInfo<Order> selectOrders(Params params) {
        //查询
        int pageNo = params.getPageNo();
        int pageSize = params.getPageSize();

        PageHelper.startPage(pageNo, pageSize);
        List<Order> orders=orderMapper.selectList(null);
        //用PageInfo对结果进行包装
        PageInfo<Order> pageInfo = new PageInfo<Order>(orders);
        return pageInfo;
    }

    @Override
    public PageInfo<Order> selectMyOrders(Integer userId, Integer page) {
        // //查询
        PageHelper.startPage(page, 10);
        EntityWrapper<Order> wrapper = new EntityWrapper<>();
        wrapper.eq("user_id",userId);
        List<Order> orders=orderMapper.selectList(wrapper);
        //用PageInfo对结果进行包装
        PageInfo<Order> pageInfo = new PageInfo<Order>(orders);
        return pageInfo;
    }

    @Override
    public boolean addCart(Integer bookId, User user) {
        Book book = bookMapper.selectById(bookId);
        Order order = new Order();
        order.setOrderId(System.currentTimeMillis()+"");
        order.setUserId(user.getUserId());
        order.setBookId(bookId);
        order.setOrderMount(1);
        order.setTotalPrice(book.getBookPrice());
        Date d = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = df.format(d);
        order.setOrderDate(now);
        order.setPayMethod("微信");
        order.setPostMethod("邮政快递");
        order.setReceverName(user.getUserName());
        order.setReceverTel("13800138000");
        order.setReceverAddr("xx省xx市xx区xx街");
        order.setPriceStatus("已付款，未发货");
        Integer insert = orderMapper.insert(order);
        if (insert==1){
            return true;
        }
        return false;
    }

    @Override
    public int queryOrderCount() {
        return orderMapper.queryOrderCount();
    }

    @Override
    public List<Order> getOrderByLimit(Page page) {
        return orderMapper.getOrderByLimit(page);
    }
}
