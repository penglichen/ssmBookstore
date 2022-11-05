package com.ssm.controller;


import com.ssm.pojo.Admin;
import com.ssm.pojo.User;
import com.ssm.service.UserServiceImpl;
import com.ssm.until.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    public UserServiceImpl userService;


    //用户登录验证
    @RequestMapping("/toIndexLogin")
    public String toLogin(String username, String password, Model model, HttpServletRequest req){
        System.err.println("username=>"+username + "===密码："+ password);

        User user =new User();
        user.setUserName(username);
        user.setUserPassword(password);
        User us=userService.queryByuserNameAndPassword(user);
        System.err.println("toIndexLogin=>"+us);

        if(us != null){
            HttpSession session = req.getSession();
            session.setAttribute("username",us.getUserName());  //设置会话
            session.setAttribute("userid", us.getUserId());  //设置会话
            session.setAttribute("user", us);  //设置会话
            return "redirect:/index";
        }
        else{
            model.addAttribute("msg","用户名或者密码错误");
            return "front/success";
        }
    }

    //添加书籍的请求事件
    @RequestMapping("/toinsertUser")
    public String toinsertUser(User user,Model model) {
        System.out.println("toinsertUser==>" + user);
        //业务层调Service层
         int insert = userService.addUser(user);
        if (insert >0) {
            System.out.println("注册成功！");
            model.addAttribute("msg","注册成功！");
        }else {
            model.addAttribute("msg","注册失败!");
        }
        return "front/success";
    }


    @RequestMapping("/allUser")
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

        List<User> list = userService.getUserByLimit(page);
        //返回一个list，给前端展示的
        model.addAttribute("list", list);

        int total = 0;
        total = userService.queryUserCount();
        page.setTotal(total);

        model.addAttribute("page", page);

        return "allUser";//返回到allStore页面
    }

    //跳转到增加书籍页面
    @RequestMapping("/toAddUser")
    public String toaddUser() {
        return "addUser";
    }


    //添加书籍的请求事件
    @RequestMapping("/addUser")
    public String addUser(User user) {
        System.out.println("addUser==>" + user);
        //业务层调Service层
        userService.addUser(user);
        //重定向d到 @RequestMapping("/allBooktype")
        return "redirect:/user/allUser";
    }

    //点击可以跳转到修改页面
    @RequestMapping("/toupdate")
    public String toupdateUser(int userId, Model model) {
        System.out.println("toupdateUser==>" + userId);
        //点击可以带出这个id里的全部信息，返回一个物资的信息
        User user = userService.queryUserById(userId);
        //携带一些数据，可以带过去给前端，在修改页面进行展示
        model.addAttribute("QUser", user);
        //跳转到修改
        return "updateUser";
    }

    //修改书籍的事件
    @RequestMapping("/updateUser")
    public String updateUser(User user) {
        System.out.println("updateUser==>" + user);
        int i = userService.updateUser(user);
        if (i > 0) {
            System.out.println("添加成功" + user);
        }
        return "redirect:/user/allUser";

    }


    @RequestMapping("/deleteUser/{userId}")
    public String deleteUser(@PathVariable("userId") int userId) {
        userService.deleteUserById(userId);
        return "redirect:/user/allUser";
    }


    @RequestMapping("/queryUser")
    public String queryAllUser(String queryUserByName, Model model, HttpServletRequest req, HttpServletResponse resp) {
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

        List<User> user = userService.queryUserByName(queryUserByName);
        System.err.println("queryUserByName=>" + user);
        List<User> list = new ArrayList<User>();

        if (user != null) {
            for (User ms : user) {
                list.add(ms);
            }

        }
        if (user == null) {
            list = userService.queryAllUser();
            model.addAttribute("error", "未查到");
        }
        model.addAttribute("list", list);

        int total = 0;
        total = list.size();
        page.setTotal(total);
        model.addAttribute("page", page);

        return "allUser";
    }

}
