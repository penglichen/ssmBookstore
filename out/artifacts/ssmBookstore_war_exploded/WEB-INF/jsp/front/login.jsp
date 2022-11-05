<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录页</title>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../../css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/index.css">
    <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../js/popper.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
   
    <style>
        .banner {
            height: 440px;
        }
        
        .box {
            width: 350px;
            margin-top: 50px;
            border-radius: 10px;
            background-color: rgba(235, 228, 228, 0.3);
        }
        .errorMsg{
            height: 20px;
            font-size: 14px;
        }
        
        table tr td {
            padding-top: 10px;
        }
        
        .check td {
            font-size: 14px;
        }
    </style>
</head>

<body>

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
                <li class="list-inline-item">
                    <a href="<%=request.getContextPath()%>/tologin">欢迎登录</a>
                </li>
                <li class="list-inline-item">
                    <a href="<%=request.getContextPath()%>/tologon">注册</a>
                </li>
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
    <!-- 横幅 -->
    <div class="banner bg-light">
        <div class="content container py-4">
            <div class="row">
                <!-- 左边内容 -->
                <div class="content_left col-md-6 d-none d-md-block">
                    <span>欢迎登录</span>
                </div>

                <!-- 右边内容 -->
                <div class="content_right col-md-6 pl-4 mx-auto">
                    <!-- 表单盒子 -->
                    <div class="box p-4">
                        <!-- 表单标题 -->
                        <div class="tit row">
                            <h5 class="col-6">用户登录</h5>
                            <a href="<%=request.getContextPath()%>/tologon" class="col-5 text-right text-danger">用户注册</a>
                        </div>
                        <div>
                            <!-- 验证提示内容 -->
                            <span class="errorMsg text-warning">
<%--                            <%=request.getAttribute("msg")==null?"":request.getAttribute("msg")%>--%>
                                ${empty requestScope.msg ? "":requestScope.msg}
                            </span>
                        </div>

                        <!-- 表单内容 -->
                        <form action="<%=request.getContextPath()%>/user/toIndexLogin" method="post">
                            <%-- 表单隐藏域 --%>
                            <input type="hidden" name="action" value="login">

                            <table>
                                <!-- 用户名 -->
                                <tr>
                                    <td>
                                        <label for="username">用户名：</label>
                                    </td>
                                    <td colspan="2">
                                        <input type="text" placeholder="请输入用户名" class="form-control" name="username" id="username"
                                               value="${requestScope.username}">
<%--                                    value="<%=request.getAttribute("username")==null?"":request.getAttribute("username")%>--%>
                                    </td>
                                </tr>
                                <!-- 密码 -->
                                <tr>
                                    <td>
                                        <label for="password">用户密码：</label>
                                    </td>
                                    <td colspan="2">
                                        <input type="password" placeholder="请输入登录密码" class="form-control" name="password" id="password">
                                    </td>
                                </tr>
                                <!-- 记住密码 -->
                                <tr class="check">
                                    <td>
                                        <input type="checkbox">记住密码
                                    </td>
                                    <td colspan="3" class="text-right">
                                        <a href="">记住密码</a>
                                    </td>
                                </tr>
                                <!-- 注册按钮 -->
                                <tr>
                                    <td colspan="3" class="text-center">
                                        <input type="submit" class="btn btn-primary" id="sub_btn" value="登录" style="width: 280px;">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--页脚部分--%>
    <%@include file="pages/common/footer.jsp"%>
</body>

</html>