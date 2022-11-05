<%--
  Created by IntelliJ IDEA.
  User: 徐小运
  Date: 2021/12/1
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    * {
        margin: 0;
        padding: 0;
    }

    body {
        font-family: '宋体';
    }

    ul li {
        list-style: none;
    }

    a {
        color: #000;
        text-decoration: none;
    }

    .headTop {
        font-size: 14px;
        height: 35px;
        line-height: 35px;
        background-color: #37b5e7;
    }
    .headTop a {
        color: #fff;
    }

    .headTop_left {
        float: left;
    }

    .headTop_right {
        float: right;
    }

    .head_m {
        clear: both;
        height: 150px;
    }

    .logo img {
        width: 150px;
        height: 100px;
    }

    .search {
        width: 300px;
        height: 35px;
        line-height: 35px;
        /* margin-top: 25px; */
    }

    .search input {
        border-radius: 20px;
        border: 2px solid #37b5e7;
        border-right: none;
    }

    .search button {
        width: 50px;
        height: 38px;
        border: 2px solid #37b5e7;
        background-color: #37b5e7;
        color: #fff;
        border-radius: 0 20px 20px 0;
    }

    .hotwrods a {
        color: #999;
        font-size: 14px;
        padding: 5px;
    }

    .cart a {
        font-size: 20px;
        color: #f00;
    }




</style>

<!-- 头部 -->
<header>
    <!-- 快捷导航栏 -->
    <div class="headTop">
        <!-- 顶部左边 -->
        <div class="headTop_left ml-5">
            <ul class="list-inline">
                <li class="list-inline-item">
                    <span>嗨！欢迎来到928网上书店</span>
                </li>
                <li class="list-inline-item">
                    <a href="/"><span class="fa fa-home"></span>首页</a>
                </li>
                <c:if test="${username==null}">
                    <li class="list-inline-item">
                        <a href="<%=request.getContextPath()%>/tologin">请登录</a>
                    </li>
                    <li class="list-inline-item">
                        <a href="<%=request.getContextPath()%>/tologon">注册</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.username!=null}">
                    <li class="list-inline-item">
                        <a href="#">欢迎您：<font color="red">${username}</font></a>
                    </li>
                    <li class="list-inline-item">
                        <a href="<%=request.getContextPath()%>/toout">退出</a>
                    </li>
                </c:if>
                <li class="list-inline-item">
                    <a href="${pageContext.request.contextPath}/admin/toadmin">管理员登录</a>
                </li>
            </ul>
        </div>
        <!-- 顶部右边 -->
        <div class="headTop_right mr-5">
            <ul class="list-inline">
                <li class="list-inline-item">
                    <a href="/">个人中心</a>
                </li>
                <li class="list-inline-item">
                    <a href="<%=request.getContextPath()%>/order/myOrder">我的订单</a>
                </li>
                <li class="list-inline-item">
                    <a href="/">客户服务</a>
                </li>
            </ul>
        </div>
    </div>

    <!-- logo、搜索框 购物车 -->
    <div class="container head_m">
        <div class="row">
            <!-- logo -->
            <div class="logo col-4">
                <img src="images/logo.jpg" alt="">
            </div>
            <!-- 搜索框 -->
            <div class="search col-5 mt-4">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="请输入有搜索的关键词">
                    <button type="button" class="btn input-group-addon">
                        <span class="fa fa-search"></span>
                    </button>
                </div>
                <!-- 热门词模块 -->
                <div class="hotwrods d-none d-md-block">
                    <a href="#">格林童话</a>
                    <a href="#">Python</a>
                    <a href="#">时间简史</a>
                    <a href="#">英语四级</a>
                    <a href="#">JAVA</a>
                    <a href="#">小白兔</a>
                </div>
            </div>
        </div>
    </div>
</header>