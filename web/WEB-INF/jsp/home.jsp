<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>首页</title>

    <%--  静态包含 base标签、css样式、jQuery文件、bootstrap文件、font字体图标文件  --%>
    <%@ include file="front/pages/common/headFile.jsp"%>

    <script>
      $(function() {

      });
    </script>
  </head>
  <body>
  <!-- 头部 -->
  <header>
    <%@ include file="front/pages/common/head.jsp"%>
    <!-- 导航栏 -->
    <nav class="nav container">
      <!-- 上侧栏 -->
      <div class="nav_top row">
        <div class="whole_all col-2 text-center">
          <a href="pages/fore/shoppingcar.jsp">
            全部分类
            <span class="fa fa-angle-double-down pl-2"></span>
          </a>
        </div>
        <div class="col-10">
          <ul class="list-inline">
            <li class="list-inline-item">
              <a href="#specialOffer">特价专区</a>
            </li>
            <li class="list-inline-item">
              <a href="#hot">热门推荐</a>
            </li>
            <li class="list-inline-item">
              <a href="#newBook">新书上架</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="row">
        <!-- 左侧菜单 -->
        <div class="nav_left col-2 shadow-sm">
          <ul>
            <li>
              <a href="pages/fore/sort.jsp">特色书单</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">童书</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">教育</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">小说</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">文学</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">科技</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">人文历史</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">生活</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">动漫、幽默</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">成功、励志</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">报刊</a>
            </li>
            <li>
              <a href="pages/fore/sort.jsp">其他</a>
            </li>
          </ul>
        </div>
        <!-- 右边轮播图 -->
        <div class="col-10">
          <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- 指示符 -->
            <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
              <li data-target="#demo" data-slide-to="3"></li>
              <li data-target="#demo" data-slide-to="4"></li>
            </ul>

            <!-- 轮播图片 -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="images/carous01.jpg" alt="">
              </div>
              <div class="carousel-item">
                <img src="images/carous02.jpg" alt="">
              </div>
              <div class="carousel-item">
                <img src="images/carous03.jpg" alt="">
              </div>
              <div class="carousel-item">
                <img src="images/carous04.jpg" alt="">
              </div>
              <div class="carousel-item">
                <img src="images/carous05.jpg" alt="">
              </div>
            </div>

            <!-- 左右切换按钮 -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>

          </div>
        </div>

      </div>


    </nav>
  </header>

  <!-- 主题部分 -->
  <section class="container">

    <!-- 特价专区 -->
    <div id="specialOffer" class="specialOffer">
      <div class="til mt-4">
        <h3>特价专区<a class="more ml-3" href="">更多<span class="fa fa-angle-double-right pl-1"></span></a></h3>
      </div>
      <ul class="list-inline text-center">
        <c:forEach var="book" items="${bargain}">
          <li class="list-inline-item ">
            <a href="<%=request.getContextPath()%>/book/detail?bid=${book.bookId}">
              <img src="<%=request.getContextPath()%>/${book.imgPath}" alt="" width="160px" height="160px">
            </a>
          </li>
        </c:forEach>
      </ul>

    </div>

    <!-- 热门推荐 -->
    <div id="hot" class="hot">
      <div class="til mt-4">
        <h3>热门推荐 <a class="more ml-3" href="">更多<span class="fa fa-angle-double-right pl-1"></span></a></h3>
      </div>
      <div class="row">
        <!-- 图书列表 -->
        <div class="book col-9">
          <ul>
          <c:forEach var="book" items="${hot}">
            <li>
              <a href="<%=request.getContextPath()%>/book/detail?bid=${book.bookId}">
                <img src="<%=request.getContextPath()%>/${book.imgPath}" alt="">
              </a>
              <p class="book_name">
                <a href="<%=request.getContextPath()%>/book/detail?bid=${book.bookId}">${book.bookName}</a>
              </p>
              <p>
                <span class="author">作者:${book.bookAuthor}</span>
                <span class="press">出版社:${book.bookPress}</span>
              </p>
              <p>
                <span class="price">￥${book.bookPrice}</span>
                <del>${book.bookPrice}</del>
              </p>
              <p class="mt-2">
<%--                <button class="btn btn-sm btn-primary mx-0">加入购物车</button>--%>
                <form action="<%=request.getContextPath()%>/order/addCart?bookId=${book.bookId}" method="post">
                  <button class="btn btn-sm btn-primary">立即购买</button>
                </form>
              </p>
            </li>
          </c:forEach>
          </ul>
        </div>
        <!-- 右边 -->
        <div class="col-2 ">
          <!-- 畅销排行榜 -->
          <div class="ranking mt-2 border">
            <h3>畅销排行榜</h3>
            <ul>
            <c:forEach var="book" items="${bestSell}" begin="0" varStatus="s">
              <li>
                <a href="<%=request.getContextPath()%>/book/detail?bid=${book.bookId}">
                  <span class="order">${s.index+1}</span> ${book.bookName}
                </a>
              </li>
            </c:forEach>
            </ul>
          </div>
          <div class="mt-3">
            <a href=""><img src="images/special_01.jpg" alt="" width="200px"></a>
          </div>
        </div>
      </div>

    </div>

    <!-- 新书上架 -->
    <div id="newBook" class="newBook">
      <div class="til mt-4">
        <h3>新书上架<a class="more ml-3" href="">更多<span class="fa fa-angle-double-right pl-1"></span></a></h3>
      </div>
      <div class="row">
        <div class="col-2 newimg">
          <a href="">
            <img src="images/new.jpg" alt="">
          </a>
        </div>
        <div class="book col-9 bg-light border p-0">
          <ul class="pl-3 py-2">
          <c:forEach var="book" items="${news}">
            <li>
              <a href="<%=request.getContextPath()%>/book/detail?bid=${book.bookId}">
                <img src="/${book.imgPath}" alt="">
              </a>
              <p class="book_name">
                <a href="<%=request.getContextPath()%>/book/detail?bid=${book.bookId}">${book.bookName}</a>
              </p>
              <p>
                <span class="author">作者:${book.bookAuthor}</span>
                <span class="press">出版社:${book.bookPress}</span>
              </p>
              <p>
                <span class="price">￥${book.bookPrice}</span>
                <del>${book.bookPrice}</del>
              </p>
              <p class="mt-2">
<%--                <button class="btn btn-sm btn-primary mx-0">加入购物车</button>--%>
                <button class="btn btn-sm btn-primary">立即购买</button>
              </p>
            </li>
          </c:forEach>
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
              <img src="images/head.jpg" alt="" width="80">
            </li>
          </ul>
        </div>
      </div>

    </div>

  </footer>

  </body>
</html>
