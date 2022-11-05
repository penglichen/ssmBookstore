package com.ssm.controller;


import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Order;
import com.ssm.pojo.Params;
import com.ssm.pojo.User;
import com.ssm.service.BookService;
import com.ssm.service.OrderService;
import com.ssm.until.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 
 * @since 2021-12-31
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private BookService bookService;

    /**
     * 我的订单
     * 分页查询
     * @param
     * @return
     */
    @RequestMapping("/myOrder")
    public String selectMyOrders(@RequestParam(required=false,defaultValue="1") Integer page, Model model, HttpServletRequest req, HttpServletResponse resp){
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");//设置会话
        req.getAttribute("success");
        req.getAttribute("msg");
        if (user !=null){
            PageInfo<Order> pageInfo = orderService.selectMyOrders(user.getUserId(),page);
            List<Order> orderList = pageInfo.getList();
            System.out.println("orderList==>"+orderList);
            orderList.forEach(o -> {
                o.setBook(bookService.selectById(o.getBookId()));
            });
            model.addAttribute("orderList", orderList);
        }
        return "front/myOrder";
    }
    /**
     * 新增
     * @param
     * @return
     */
    @RequestMapping("/addCart")
    public String addCart(Integer bookId,HttpServletRequest req) {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");//设置会话
        if (user !=null){
            boolean insert = orderService.addCart(bookId,user);
            if (insert) {
                System.out.println("添加购物车成功！");
                req.setAttribute("success",true);
                req.setAttribute("msg","添加购物车成功!");
            }else {
                System.out.println("添加购物车失败！");
                req.setAttribute("success",false);
                req.setAttribute("msg","添加购物车失败!");
            }
        }
        return "redirect:/order/myOrder";
    }
    /**
     * 所有订单
     * 分页查询
     * @param params
     * @return
     */
    @RequestMapping("/allOrder")
    public String selectAllOrder(Params params, Model model){
        PageInfo<Order> pageInfo = orderService.selectOrders(params);
        List<Order> orderList = pageInfo.getList();
        orderList.forEach(o -> {
            o.setBook(bookService.selectById(o.getBookId()));
        });
        System.out.println(orderList);
        model.addAttribute("orderList", orderList);
        return "allOrder";
    }

    /**
     * 新增
     * @param
     * @return
     */
    @RequestMapping("/add")
    public String add(@RequestBody Order order,Model model) {
        boolean insert = orderService.insert(order);
        if (insert) {
            model.addAttribute("success", true);
            model.addAttribute("msg", "成功");
        }else{
            model.addAttribute("success", false);
            model.addAttribute("msg", "失败");
        }
        return "orderList";
    }


    /**
     * ajax请求 的 删除
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/delete")
    public String delete(Integer id,Model model) {
        boolean insert = orderService.deleteById(id);
        if (insert) {
            model.addAttribute("success", true);
            model.addAttribute("msg", "删除成功");
        }else{
            model.addAttribute("success", false);
            model.addAttribute("msg", "删除失败");
        }
        return "orderList";
    }


    /**
     * ajax请求 的 修改
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/update")
    public String update(@RequestBody Order order,Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean insert = orderService.updateById(order);
        if (insert) {
            model.addAttribute("success", true);
            model.addAttribute("msg", "修改成功");
        }else{
            model.addAttribute("success", false);
            model.addAttribute("msg", "修改失败");
        }
        return "orderList";
    }

    //跳转到增加书籍页面
    @RequestMapping("/toAddOrder")
    public String toaddOrder() {
        return "addOrder";
    }


    //添加书籍的请求事件
    @RequestMapping("/addOrder")
    public String addOrder(Order order) {
        System.out.println("addOrder==>" + order);
        //业务层调Service层
        orderService.addOrder(order);
        //重定向d到 @RequestMapping("/allBooktype")
        return "redirect:/order/allOrder1";
    }

    @RequestMapping("/allOrder1")
    public String list(Model model, HttpServletRequest req, HttpServletResponse resp) {
        // 获取分页参数
        int start = 0;
        int count = 4;

        try {
            start = Integer.parseInt(req.getParameter("page.start"));
            count = Integer.parseInt(req.getParameter("page.count"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Page page = new Page(start, count);

        List<Order> list = orderService.getOrderByLimit(page);
        //返回一个list，给前端展示的
        model.addAttribute("list", list);

        int total = 0;
        total = orderService.queryOrderCount();
        page.setTotal(total);

        model.addAttribute("page", page);

        return "allOrder1";//返回到allStore页面
    }

    //点击可以跳转到修改页面
    @RequestMapping("/toOrder")
    public String toupdateOrder(int id, Model model) {
        System.out.println("toupdateOrder==>" + id);
        //点击可以带出这个id里的全部信息，返回一个物资的信息
        Order order = orderService.queryOrderById(id);
        //携带一些数据，可以带过去给前端，在修改页面进行展示
        model.addAttribute("QOrder", order);
        //跳转到修改
        return "updateOrder";
    }

    //修改书籍的事件
    @RequestMapping("/updateOrder")
    public String updateOrder(Order order) {
        System.out.println("updateOrder==>" + order);
        int i = orderService.updateOrder(order);
        if (i > 0) {
            System.out.println("添加成功" + order);
        }
        return "redirect:/order/allOrder1";

    }


    @RequestMapping("/deleteOrderById/{id}")
    public String deleteOrderById(@PathVariable("id") int id) {
        orderService.deleteOrderById(id);
        return "redirect:/order/allOrder1";
    }


    @RequestMapping("/queryOrder")
    public <order> String queryAllOrder(String queryOrderByName, Model model, HttpServletRequest req, HttpServletResponse resp) {
        // 获取分页参数
        int start = 0;
        int count = 4;

        try {
            start = Integer.parseInt(req.getParameter("page.start"));
            count = Integer.parseInt(req.getParameter("page.count"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Page page = new Page(start, count);

        List<Order> order = orderService.queryOrderByName(queryOrderByName);
        System.err.println("queryBooktype=>" +order);
        List<Order> list = new ArrayList<Order>();

        if (order != null) {
            for (Order ms : order) {
                list.add(ms);
            }

        }
        if (order == null) {
            list = orderService.queryOrderByName(queryOrderByName);
            model.addAttribute("error", "未查到");
        }
        model.addAttribute("list", list);

        int total = 0;
        total=list.size();
        page.setTotal(total);
        model.addAttribute("page", page);

        return "allOrder";
    }
}
