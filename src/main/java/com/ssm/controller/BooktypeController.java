package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Book;
import com.ssm.pojo.Booktype;
import com.ssm.service.BooktypeServiceImpl;
import com.ssm.until.Page;
import com.ssm.until.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/booktype")
public class BooktypeController {

    @Autowired
    public BooktypeServiceImpl booktypeService;

//    //查询全部的书籍分类，并且返回到一个书籍分类展示页面(给前端页面进行调用的)
//    @RequestMapping("/allBooktype")
//    public String list(@RequestParam(value = "p", defaultValue = "1") Integer page, Model model, HttpServletRequest req, HttpServletResponse resp) {
////        int pageSize=3;  //设置分页大小
////        PageHelper.startPage(page,pageSize); //分页插件的第1参数为当前页，
//
//        List<Booktype> list = booktypeService.queryAllBooktype();
////        PageInfo<Booktype> pageInfo = new PageInfo<Booktype>(list);
////        List<Booktype> users2=pageInfo.getList();  //当前页记录
//
//        //返回一个list，给前端展示的
//        model.addAttribute("list", list);
//
//        StringBuffer requestURL = req.getRequestURL();
//        System.out.println(requestURL);  //测试
//
////        String pageNav= Pager.getPageNav(page, pageInfo.getPageSize(), pageInfo, requestURL);
////        model.addAttribute("pageNav", pageNav);
//
//        return "allBooktype";//返回到allStore页面
//    }

    //查询所有书籍
    @RequestMapping("/allBooktype")
    public String list(Model model, HttpServletRequest req, HttpServletResponse resp) {
        // 获取分页参数
        int start = 0;
        int count = 5;

        try {
            start = Integer.parseInt(req.getParameter("page.start"));
            count = Integer.parseInt(req.getParameter("page.count"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Page page = new Page(start, count);

        List<Booktype> list = booktypeService.getBooktypeByLimit(page);
        //返回一个list，给前端展示的
        model.addAttribute("list", list);

        int total = 0;
        total=booktypeService.queryBooktypeCount();
        page.setTotal(total);

        model.addAttribute("page", page);

        return "allBooktype";//返回到allStore页面
    }

    //跳转到增加书籍页面
    @RequestMapping("/toAddBooktype")
    public String toaddBooktype() {
        return "addBooktype";
    }


    //添加书籍的请求事件
    @RequestMapping("/addBooktype")
    public String addBooktype(Booktype booktype) {
        System.out.println("addBooktype==>" + booktype);
        //业务层调Service层
        booktypeService.addBooktype(booktype);
        //重定向d到 @RequestMapping("/allBooktype")
        return "redirect:/booktype/allBooktype";
    }

//    @RequestMapping("/toDetail")
//    public String toDetail(int typeId, Model model) {
//        System.out.println("toDetail==>" + typeId);
//        //点击可以带出这个id里的全部信息，返回一个入库的信息
//        Booktype booktype = booktypeService.querySpdById(typeId);
//        //携带一些数据，可以带过去给前端，在修改页面进行展示
//        model.addAttribute("DBooktype", booktype);
//        //跳转到修改
//        return "DetailBooktype";
//    }

    //点击可以跳转到修改页面
    @RequestMapping("/toUpate")
    public String toupdateBooktype(int typeId, Model model) {
        System.out.println("toupdate==>" + typeId);
        //点击可以带出这个id里的全部信息，返回一个物资的信息
        Booktype booktype = booktypeService.queryBooktypeById(typeId);
        //携带一些数据，可以带过去给前端，在修改页面进行展示
        model.addAttribute("QBooktype", booktype);
        //跳转到修改
        return "updateBooktype";
    }

    //修改书籍的事件
    @RequestMapping("/updateBooktype")
    public String updateBooktype(Booktype booktype) {
        System.out.println("updateBooktype==>" + booktype);
        int i = booktypeService.updateBooktype(booktype);
        if (i > 0) {
            System.out.println("添加成功" + booktype);
        }
        return "redirect:/booktype/allBooktype";

    }


    @RequestMapping("/deleteBooktypecode/{typeId}")
    public String deleteBooktypecode(@PathVariable("typeId") int typeId) {
        booktypeService.deleteBooktypeById(typeId);
        return "redirect:/booktype/allBooktype";
    }


    @RequestMapping("/queryAllBooktype")
    public String queryAllBooktype(String queryBooktypeByName, Model model,HttpServletRequest req, HttpServletResponse resp) {
        // 获取分页参数
        int start = 0;
        int count = 5;

        try {
            start = Integer.parseInt(req.getParameter("page.start"));
            count = Integer.parseInt(req.getParameter("page.count"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Page page = new Page(start, count);

        List<Booktype> booktype = booktypeService.queryBooktypeByName(queryBooktypeByName);
        System.err.println("queryBooktype=>" + booktype);
        List<Booktype> list = new ArrayList<Booktype>();

        if (booktype != null) {
            for (Booktype ms : booktype) {
                list.add(ms);
            }

        }
        if (booktype == null) {
            list = booktypeService.queryAllBooktype();
            model.addAttribute("error", "未查到");
        }
        model.addAttribute("list", list);

        int total = 0;
        total=list.size();
        page.setTotal(total);
        model.addAttribute("page", page);

        return "allBooktype";
    }



}
