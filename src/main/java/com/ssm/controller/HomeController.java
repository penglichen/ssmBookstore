package com.ssm.controller;

import com.ssm.pojo.Book;
import com.ssm.pojo.PageInfo;
import com.ssm.service.BookServiceImpl;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author lily
 * @create 2022/1/5 20:11
 */
@Controller
public class HomeController {
    @Autowired
    private BookServiceImpl bookService;

    @Autowired
    private UserService userService;
    /**
     * 前台
     * 分页查询
     * @param
     * @return
     */
    @RequestMapping({"/index","/",""})
    public String selectBooks(Model model){
        List<Book> news = bookService.selectBooks(1, 4).getList();
        List<Book> bargain = bookService.selectBooks(1, 6).getList();
        List<Book> hot = bookService.selectBooks(1, 8).getList();
        List<Book> bestSell = bookService.selectBooks(1, 10).getList();
        //特价专区
        model.addAttribute("bargain", bargain);
        //热门推荐
        model.addAttribute("hot", hot);
        //畅销排行榜
        model.addAttribute("bestSell", bestSell);
        //新书上架
        model.addAttribute("news", news);
        return "home";
    }


    @RequestMapping("/tologin")
    public String tologin(){
        return "front/login";
    }

    @RequestMapping("/tologon")
    public String tologon(){
        return "front/logon";
    }


    @RequestMapping("/toout")
    public String toout(HttpServletRequest req) {
        req.getSession().removeAttribute("username");//清空session信息
        req.getSession().removeAttribute("userid");//清空session信息
        req.getSession().removeAttribute("user");//清空session信息
        req.getSession().invalidate();//清除 session 中的所有信息
        return "redirect:/index";
    }
}
