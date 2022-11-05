package com.ssm.controller;

import com.ssm.pojo.Admin;
import com.ssm.service.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    public AdminServiceImpl adminService;

    @RequestMapping("/toAdminLogin")
    public String toLogin(String adminname, String password, Model model, HttpServletRequest req){
        System.err.println("adminname=>"+adminname + "===密码："+ password);

        Admin admin = new Admin();
        admin.setAdminname(adminname);
        admin.setPassword(password);
        int ad=adminService.queryByadminnameAndPassword(admin);
        System.err.println("toAdminLogin=>"+ad);

        if(ad >0){
            HttpSession session = req.getSession();
            session.setAttribute("adminname", adminname);  //设置会话

            return "adminLogin";
        }
        else{
            model.addAttribute("error","用户名或者密码错误");
            return "message";
        }
    }

    @RequestMapping("/AdminLogin")
    public String getLogin(){
        return "adminIndex0";

    }

    @RequestMapping("/outAdminLogin")
    public String outLogin(){
        return "adminindex";
    }

    @RequestMapping("/toadmin")
    public String toadmin(){
        return "adminindex";
    }

}
