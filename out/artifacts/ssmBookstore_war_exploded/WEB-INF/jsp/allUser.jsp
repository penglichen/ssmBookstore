<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单页面</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="../../css/list.css" type="text/css" />
    <script src="<%=application.getContextPath()%>/js/jquery-1.10.2.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"
            type="text/javascript"></script>
    <style>
        ul li{
            margin-top:5px;
            margin-left: 14px;
            padding-left: 7px;
        }
    </style>
</head>
<body>
<div class="container">
    <%--        清除--%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <span>用户列表显示</span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-7 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/toAddUser">新增用户</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/allUser">显示所有用户</a>
        </div>
        <div class="col-5">
            <%--查询用户--%>
            <form class="form-inline" action="${pageContext.request.contextPath}/user/queryUser" method="post" style="float: right">
                <span style="color:red;font-weight:bold;">${error}</span>
                <%--name属性是用于提交给后台的--%>
                <input type="text" name="queryUserByName" class="form-control" placeholder="请输入要查询的用户名称">
                <input type="submit" value="查询" class="btn btn-primary">
            </form>
        </div>
    </div>
    <div class="row clearfix">
        <div class="listtable">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>用户编码</th>
                    <th>用户姓名</th>
                    <th>用户密码</th>
                    <th>用户邮箱</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${list}">
                    <tr>
                        <td>${list.userId}</td>
                        <td>${list.userName}</td>
                        <td>${list.userPassword}</td>
                        <td>${list.userEmail}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user/toupdate?userId=${list.userId}">修改</a>|
                            <a href="${pageContext.request.contextPath}/user/deleteUser/${list.userId}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
        <div></div>
        <nav>
            <ul class="pagination">
                <li <c:if test="${!page.hasPreviouse}">class="page-item disabled"</c:if>>
                    <a class="page-link" href="?page.start=0">
                        <span>首页</span>
                    </a>
                </li>

                <li <c:if test="${!page.hasPreviouse}">class="page-item disabled"</c:if>>
                    <a class="page-link" href="?page.start=${page.start-page.count}">
                        <span>上一页</span>
                    </a>
                </li>

                <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">

                    <c:if test="${status.count*page.count-page.start<=50 && status.count*page.count-page.start>=-10}">
                        <li <c:if test="${status.index*page.count==page.start}">class="page-item disabled"</c:if>>
                            <a class="page-link" href="?page.start=${status.index*page.count}"
                               <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                            >${status.count}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <li <c:if test="${!page.hasNext}">class="page-item disabled"</c:if>>
                    <a class="page-link" href="?page.start=${page.start+page.count}">
                        <span>下一页</span>
                    </a>
                </li>
                <li <c:if test="${!page.hasNext}">class="page-item disabled"</c:if>>
                    <a class="page-link" href="?page.start=${page.last}">
                        <span>尾页</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>

<script>
    $(function () {
        $("ul.pagination li.disabled a").click(function () {

            return false;
        });
    });
</script>
</body>
</html>
