<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>详情页</title>
    <%--  静态包含 base标签、css样式、jQuery文件、bootstrap文件、font字体图标文件  --%>
    <%@ include file="pages/common/headFile.jsp"%>
    <style>
        .big_img img {
            width: 350px;
            height: 350px;
        }
        
        .small_img img {
            width: 80px;
            height: 80px;
            border: 1px solid #eee;
        }
        
        .book_news ul li {
            padding: 10px 0;
        }
        
        .xinxi a {
            color: blue;
        }
        
        .xinxi span {
            font-weight: 700;
        }
        
        .price del {
            color: #999;
        }
        
        .price span {
            margin: 0 15px;
            font-size: 23px;
            font-weight: 700;
            color: #f00;
        }
        
        .cut,
        .add {
            padding: 3px 5px;
            border: 1px solid #000;
        }
        
        .chanpin h4 {
            margin: 20px 0 10px;
            font-weight: 700;
            color: #37b5e7;
            font-size: 18px;
        }
        
        .chanpin table tr td {
            width: 250px;
            font-size: 14px;
            color: #666;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }
    </style>
    <script>
        /*购物车商品数量加减*/
        $(function() {
            $(".cut").click(function() {
                var subval = $(this).next();
                if (parseInt(subval.val()) > 0)
                    subval.val(parseInt(subval.val()) - 1)
            });
            $(".add").click(function() {
                var subval = $(this).prev();
                subval.val(parseInt(subval.val()) + 1)
            });
        });
    </script>
</head>

<body>
<!-- 头部 -->
<%@ include file="pages/common/head.jsp"%>
    <section>
        <div class="banner text-center">
            <img src="/images/banner.jpg" alt="">
        </div>
        <!--  -->
        <div class="container my-5">
            <div class="row">
                <!-- 左边图片 -->
                <div class="col-5 img_manage text-center">
                    <div class="big_img">
                        <img src="${book.imgPath}" alt="">
                    </div>
                    <div class="small_img mt-3">
                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <img src="${book.imgPath}" alt="">
                            </li>
                            <li class="list-inline-item">
                                <img src="${book.imgPath}" alt="">
                            </li>
                            <li class="list-inline-item">
                                <img src="${book.imgPath}" alt="">
                            </li>
                            <li class="list-inline-item">
                                <img src="${book.imgPath}" alt="">
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 右边 -->
                <div class="col-7 book_news">
                    <ul>
                        <li>
                            <h3>${book.bookName}</h3>
                        </li>
                        <li class="xinxi">
                            <a href="">${book.bookPress}</a><span>编</span>
                            <a href="">${book.bookAuthor}</a><span>著</span>
                        </li>
                        <li class="price">
                            <label>活动价</label><span>￥${book.bookPrice}</span><del>￥${book.bookPrice}</del>
                        </li>
                        <li>
                            <label class="mr-3">配送至</label>
                            <select class="p-1">
                                <option>请选择地点...</option>
                                <option>广州</option>
                                <option>北京</option>
                                <option>上海</option>
                              </select>
                        </li>
                        <li>
                            <label class="mr-3">数量</label>
                            <span class="cut">-</span>
                            <input class="number" type="text" value="1" style="width: 50px; height: 25px; text-align: center;;">
                            <span class="add">+</span>
                        </li>
                        <li>
<%--                            <button type="button" class="btn border-danger mr-3">加入购物车</button>--%>
                            <form action="<%=request.getContextPath()%>/order/addCart?bookId=${book.bookId}" method="post">
                            <button class="btn btn-danger">立即购买</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 商品详情 -->
        <div class="detail container border">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#">商品详情</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">规格属性</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">售后政策</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link">累积评价</a>
                </li>
            </ul>
            <div class="deatil_content">

                <div class="chanpin">
                    <table>
                        <h4>产品参数：</h4>
                        <tr>
                            <td>商品编码（ISBN）：9787520178969</td>
                            <td>中图分类号：I516.45</td>
                            <td>译者：程巍</td>
                            <td>开本：32开</td>
                        </tr>
                        <tr>
                            <td>页数：312</td>
                            <td>印刷时间：2021-03-01</td>
                            <td>出次：1</td>
                            <td>重：302</td>
                        </tr>
                        <tr>
                            <td>高：33</td>
                            <td>字数：223</td>
                            <td>首版时间：2021-03-01</td>
                            <td></td>
                        </tr>
                    </table>

                    <!-- 商品细节： -->
                    <div>
                        <h4>商品细节：</h4>
                        <img src="${book.imgPath}" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- 底部 -->
    <footer class="text-light">
        <div class="container">
            <div class="row">
                <!-- 底部左边 -->
                <div class="foot_left col-md-7">
                    <ul class="list-inline">
                        <li class="list-inline-item"><a href="#">服务条款</a>|</li>
                        <li class="list-inline-item"><a href="#">隐私政策</a>|</li>
                        <li class="list-inline-item"><a href="#">版权诉讼指引</a>|</li>
                        <li class="list-inline-item"><a href="#">意见反馈</a>|</li>
                        <li class="list-inline-item"><a href="#">广告合作</a>|</li>
                        <li class="list-inline-item"><a href="#">常见问题</a>|</li>
                        <li class="list-inline-item"><a href="#">联系我们</a></li>
                    </ul>
                    <p>我们致力于推动网络正版音乐发展，相关版权合作请联系xuyunying@xyy.com</p>
                    <p>互联网不良信息举报中心：www.12377.cn 违法和不良信息举报邮箱xuyunying@xyy.com： 举报电话：020-00000000 </p>
                    <p>Copyright &copy; 2021-12 XXX音乐网站</p>
                </div>

                <!-- 底部右边 -->
                <div class="foot_right col-md-5 text-right mt-2 d-none d-md-block">
                    <ul class="list-inline pl-1">
                        <li class="list-inline-item pl-2">
                            <a href=""><span class="fa fa-weibo"></span></a>
                        </li>
                        <li class="list-inline-item pl-2">
                            <a href=""><span class="fa fa-weixin"></span></a>
                        </li>
                        <li class="list-inline-item pl-2">
                            <a href=""><span class="fa fa-exclamation-triangle"></span></a>
                        </li>
                        <li class="list-inline-item pl-5">
                            <div class="text-center">关注我们</div>
                            <img src="/images/head.jpg" alt="" width="80">
                        </li>
                    </ul>
                </div>
            </div>

        </div>

    </footer>

</body>

</html>