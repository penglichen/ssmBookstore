package com.ssm.until;

/*
 * 本工具类Pager提供了获取导航信息的静态方法getPageNav
 * 本类供处理分页的控制器方法（如后台的memInfo和memDelete）调用
 * 方法getPageNav的返回值为泛型（对应于某个实体类的分页信息）
 * 泛型类PageInfo<T>封装了上一页、下一页和总页数等方法（请与Servlet+JDBC项目里的分页类比较）
 */

import com.github.pagehelper.PageInfo;
public class Pager {


    //获取导航信息的静态方法包含4个参数，其中一个参数是泛型
    public static <T>String getPageNav(int page, int pageSize, PageInfo<T> pageInfo, StringBuffer URL){
        String pageNav="";
        if(page==1){   //此时，下页和尾页链接可用
            pageNav ="首页"+
                    "&nbsp;|&nbsp;上一页"+
                    "&nbsp;|&nbsp;<a href='"+URL+"?p="+pageInfo.getNextPage()+"' style='text-decoration:none;'>下一页</a>"+
                    "&nbsp;|&nbsp;<a href='"+URL+"?p="+pageInfo.getPages()+"' style='text-decoration:none;'>尾页</a>"+
                    "&nbsp;|&nbsp;共"+pageInfo.getTotal()+"条记录"+
                    "&nbsp;|&nbsp;当前页:"+"<font color='red'>"+page+"</font>/"+pageInfo.getPages()+
                    "&nbsp; <form method='get' action='"+URL+"'>"+
                    "<input type='text' style='width:30px; height:20px;' name='p'/>&nbsp"+
                    "<input type='submit' value='go' class='btn'/></form>";}
        else if(page==pageInfo.getLastPage()){  //此时，下页和尾页链接不可用
            pageNav ="<a href='"+URL+"?p="+1+"' style='text-decoration:none;'>首页</a>"+
                    "&nbsp;|&nbsp;<a href='"+URL+"?p="+pageInfo.getPrePage()+"' style='text-decoration:none;'>上一页</a>"+
                    "&nbsp;|&nbsp;下一页"+
                    "&nbsp;|&nbsp;尾页"+
                    "&nbsp;|&nbsp;共"+pageInfo.getTotal()+"条记录"+
                    "&nbsp;|&nbsp;当前页:"+"<font color='red'>"+page+"</font>/"+pageInfo.getPages()+
                    "&nbsp; <form method='get' action='"+URL+"'>"+
                    "<input type='text' style='width:30px; height:20px;' name='p'/>&nbsp"+
                    "<input type='submit' value='go' class='btn'/></form>";}
        else { //此时，首页、上页、下页和尾页链接均可用
            pageNav ="<a href='"+URL+"?p="+1+"' style='text-decoration:none;'>首页</a>"+
                    "&nbsp;|&nbsp;<a href='"+URL+"?p="+pageInfo.getPrePage()+"' style='text-decoration:none;'>上一页</a>"+
                    "&nbsp;|&nbsp;<a href='"+URL+"?p="+pageInfo.getNextPage()+"' style='text-decoration:none;'>下一页</a>"+
                    "&nbsp;|&nbsp;<a href='"+URL+"?p="+pageInfo.getPages()+"' style='text-decoration:none;'>尾页</a>"+
                    "&nbsp;|&nbsp;共"+pageInfo.getTotal()+"条记录"+
                    "&nbsp;|&nbsp;当前页:"+"<font color='red'>"+page+"</font>/"+pageInfo.getPages()+
                    "&nbsp; <form method='get' action='"+URL+"'>"+
                    "<input type='text' style='width:30px; height:20px;' name='p'/>&nbsp"+
                    "<input type='submit' value='go' class='btn'/></form>";
        }
        return pageNav;
    }


}
