package com.ssm.controller;

import com.ssm.pojo.Book;
import com.ssm.pojo.Booktype;
import com.ssm.service.BookServiceImpl;
import org.apache.commons.io.FilenameUtils;
import com.ssm.until.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookServiceImpl bookService;

    //查询所有书籍
    @RequestMapping("/allBook")
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

        List<Book> list = bookService.getBookByLimit(page);
        //返回一个list，给前端展示的
        model.addAttribute("list", list);

        int total = 0;
        total=bookService.queryBookCount();
        page.setTotal(total);

        model.addAttribute("page", page);

        return "allBook";//返回到allStore页面
    }

    //跳转到增加书籍页面
    @RequestMapping("/toAddBook")
    public String toaddBook() {
        return "addBook";
    }


    //添加书籍的请求事件
    @RequestMapping("/addBook")
    public String addBook(Book book, MultipartFile imgpath,HttpServletRequest request) throws Exception {
        System.out.println("addBook==>" + book +"==>"+imgpath);

        //使用UUID给图片重命名，并去掉四个“-”
        String name = UUID.randomUUID().toString().replaceAll("-", "");
        System.out.println("name==>" + name);
        //获取文件的扩展名
        String ext = FilenameUtils.getExtension(imgpath.getOriginalFilename());
        upload(imgpath,name,ext);

        //设置图片上传路径,方法用于获取Output directory目录的路径
        String url = request.getSession().getServletContext().getRealPath("/images");
        System.out.println(url);
        //以绝对路径保存重名命后的图片
        imgpath.transferTo(new File(url+"/"+name + "." + ext));

        //把图片存储路径保存到数据库
        book.setImgPath("images/"+name + "." + ext);

        //业务层调Service层
        bookService.addBook(book);
        //重定向d到 @RequestMapping("/allBook")
        return "redirect:/book/allBook";
    }


    @RequestMapping("/toDetail")
    public String toDetail(int id, Model model) {
        System.out.println("toDetail==>" + id);
        //点击可以带出这个id里的全部信息，返回一个入库的信息
        Book book = bookService.queryBookById(id);
        //携带一些数据，可以带过去给前端，在修改页面进行展示
        model.addAttribute("DBook", book);
        //跳转到修改
        return "DetailBook";
    }

    //点击可以跳转到修改页面
    @RequestMapping("/toUpate")
    public String toupdateBook(int id, Model model) {
        System.out.println("toupdate==>" + id);

        //点击可以带出这个id里的全部信息，返回一个物资的信息
        Book book = bookService.queryBookById(id);
        //携带一些数据，可以带过去给前端，在修改页面进行展示
        model.addAttribute("QBook", book);
        //跳转到修改
        return "updateBook";
    }

    //修改书籍的事件
    @RequestMapping("/updateBook")
    public String updateBook(Book book, MultipartFile imgpath,HttpServletRequest request) throws Exception {
        System.out.println("updateBook==>" + book);

//        //获取文件名
//        String filename = myfile.getOriginalFilename();

        //使用UUID给图片重命名，并去掉四个“-”
        String name = UUID.randomUUID().toString().replaceAll("-", "");
        System.out.println("name==>" + name);
        //获取文件的扩展名
        String ext = FilenameUtils.getExtension(imgpath.getOriginalFilename());
        upload(imgpath,name,ext);

        //设置图片上传路径,方法用于获取Output directory目录的路径
        String url = request.getSession().getServletContext().getRealPath("/images");
        System.out.println(url);
        //以绝对路径保存重名命后的图片
        imgpath.transferTo(new File(url+"/"+name + "." + ext));


//        imgpath.transferTo(new File("D:\\MavenText\\ssmBookstore\\web\\images\\" + name + "." + ext));

        //把图片存储路径保存到数据库
        book.setImgPath("images/"+name + "." + ext);

        int i = bookService.updateBook(book);
        if (i > 0) {
            System.out.println("添加成功" + book);
        }
        return "redirect:/book/allBook";

    }

    private void upload(MultipartFile imgpath, String name, String ext) throws Exception {
        imgpath.transferTo(new File("F:\\java\\期末\\img\\" + name + "." + ext));
    }

    @RequestMapping("/deleteBookcode/{id}")
    public String deleteBookcode(@PathVariable("id") int id) {
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }


    @RequestMapping("/queryAllBook")
    public String queryAllBook(String queryBookByName, Model model,HttpServletRequest req, HttpServletResponse resp) {
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

        List<Book> book = bookService.queryBookByName(queryBookByName);
        System.err.println("queryBook=>" + book);
        List<Book> list = new ArrayList<Book>();

        if (book != null) {
            for (Book ms : book) {
                list.add(ms);
            }

        }
        if (book == null) {
            list = bookService.queryAllBook();
            model.addAttribute("error", "未查到");
        }
        model.addAttribute("list", list);

        int total = 0;
        total=list.size();
        page.setTotal(total);
        model.addAttribute("page", page);

        return "allBook";
    }

    /**
     * 前台
     * 详情页
     * @param
     * @return
     */
    @RequestMapping("/detail")
    public String selectBookById(Integer bid, Model model){
        Book book = bookService.selectById(bid);
        model.addAttribute("book", book);
        return "front/details";
    }

}
