<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>后台管理主页</title>
    <style type="text/css">
        .main {
            padding-bottom: 30px;
            width: 100%;
            height: 100%;
            margin: 0 auto; /*水平居中*/
        }

        .innerNav {
            margin: 0 auto;
            margin-left: 4px;
            width: 99%;
            height: 60px;
            padding-left: 0;
            background-color: #001529;
            display: flex;
            justify-content: space-between;
            align-items: center; /*文字居中*/
            color: #FFFFFF;
            font-size: 20px;
        }

        .innerNav .left_box {
            display: flex;
            align-items: center;
        }

        .innerNav .left_box img {
            width: 55px;
            height: 55px;
            margin: 0px 0px 0px 15px;
        }

        .innerNav .left_box span {
            margin-left: 15px;
        }

        .innerNav .right_box img {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            background-color: #FFFFFF;
            margin: 0px 15px 0px 0px;
            background-size: contain;

        }

        .row1 {
            width: 800px;
            height: 40px;
            font-size: 35px;
            text-align: center;
            background-color: #ffffff;
        }

        .row2 {
            width: 100%;
            height: 100%;
            /*border:1px red solid;*/
        }

        .row2_left {
            width: 17%;
            height: 100%;
            float: left;
            margin-left: 4px;
            background-color: #001529;
            color: #333;
            text-align: center;
            line-height: 200px;
            /*background: linear-gradient(to bottom, #70c4fc, #8bcafc, #acd7fc, #e9f2fc);*/
            /*background: url(../../images/bg4.jpg);*/
        }

        .row2_left ul {
            padding-left: 15px;
        }

        .row2_right {
            height: 100%;
            width: 82%;
            float: left;
            background-color: #E9EEF3;
            color: #333;
            text-align: center;
            line-height: 160px;
            /*background: linear-gradient(to bottom, #70c4fc, #8bcafc, #acd7fc, #e9f2fc);*/
        }
    </style>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="../../css/adminLogin.css" type="text/css"/>
    <script src="../../js/jquery-1.10.2.min.js" type="text/javascript"></script>

</head>

<body>
<script type="text/javascript">
    $(document).ready(function () {
        $(".subNav").click(function () {
            var temp = $(this).next(".navContent"); //当前主菜单项的子菜单
            temp.slideToggle(500); //当前主菜单项的子菜单卷起或展开
            temp.siblings(".navContent").slideUp("fast"); //同胞元素向上卷起
        });
    });
</script>
<div class="main">
    <div class="innerNav clear">
        <div class="left_box">
            <img src="<%=request.getContextPath()%>/images/tx.gif">
            <span>网上图书后台管理系统</span>
        </div>
        <div class="right_box">
            <div class="dropdown">
                <img src="<%=request.getContextPath()%>/images/tx.gif">
                <c:if test="${sessionScope.adminname!=null}">
                    <span style="margin-right: 21px;">${adminname}</span>
                </c:if>
                <div class="dropdown-menu">
                    <a href="#" class="dropdown-item">系统首页</a>
                    <a href="#" class="dropdown-item">个人信息</a>
                    <a href="#" class="dropdown-item">退出系统</a>
                </div>

            </div>
        </div>
    </div>
    <div class="row2">
        <div class="row2_left">
            <div class="subNavBox">
                <div class="subNav"><img src="<%=request.getContextPath()%>/images/gzt.png" class="img1">
                    <span>工作台</span>
                    <img src="<%=request.getContextPath()%>/images/xltb.png" class="img2">
                </div>
                <ul class="navContent" style="display: block">
                    <li><a href="${pageContext.request.contextPath}/admin/AdminLogin"
                           target="kj"><img src="<%=request.getContextPath()%>/images/sy.png" class="img1">首页</a></li>
                </ul>
                <div class="subNav"><img src="<%=request.getContextPath()%>/images/wzgl.png" class="img1">
                    <span>用户管理</span>
                    <img src="<%=request.getContextPath()%>/images/xltb.png" class="img2">
                </div>
                <ul class="navContent">
                    <li><a href="${pageContext.request.contextPath}/user/allUser"
                           target="kj"><img src="<%=request.getContextPath()%>/images/list.png" class="img1">用户列表</a>
                    </li>
                </ul>

                <div class="subNav"><img src="<%=request.getContextPath()%>/images/ckgl.png" class="img1">
                    <span>分类管理</span>
                    <img src="<%=request.getContextPath()%>/images/xltb.png" class="img2"></div>
                <ul class="navContent">
                    <li><a href="${pageContext.request.contextPath}/booktype/allBooktype"
                           target="kj"><img src="<%=request.getContextPath()%>/images/list.png" class="img1">图书分类列表</a>
                    </li>
                </ul>

                <div class="subNav"><img src="<%=request.getContextPath()%>/images/rkgl.png" class="img1">
                    <span>图书管理</span>
                    <img src="<%=request.getContextPath()%>/images/xltb.png" class="img2"></div>
                <ul class="navContent">
                    <li><a href="${pageContext.request.contextPath}/book/allBook" target="kj">
                        <img src="<%=request.getContextPath()%>/images/list.png" class="img1">
                        图书列表</a>
                    </li>
                </ul>

                <div class="subNav"><img src="<%=request.getContextPath()%>/images/chukgl.png" class="img1">
                    <span>订单管理</span>
                    <img src="<%=request.getContextPath()%>/images/xltb.png" class="img2">
                </div>
                <ul class="navContent">
                    <li><a href="${pageContext.request.contextPath}/order/allOrder1" target="kj">
                        <img src="<%=request.getContextPath()%>/images/list.png" class="img1">
                        订单列表
                    </a></li>
                </ul>
                <div class="subNav"><img src="<%=request.getContextPath()%>/images/xtgl.png" class="img1">系统管理
                    <img src="<%=request.getContextPath()%>/images/xltb.png" class="img2"></div>
                <ul class="navContent">
                    <li><a href="${pageContext.request.contextPath}/index">登出返回前台</a></li>
                </ul>
            </div>
        </div>
        <div class="row2_right">
            <iframe width="100%" height="100%" src="${pageContext.request.contextPath}/admin/AdminLogin" name="kj"></iframe>
        </div>
    </div>
</div>

</body>
</html>
