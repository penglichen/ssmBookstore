<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书分类页面</title>
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
                <span>图书分类列表显示</span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-7 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/booktype/toAddBooktype">新增分类</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/booktype/allBooktype">显示所有分类</a>
        </div>
        <div class="col-5">
            <%--查询分类--%>
            <form class="form-inline" action="${pageContext.request.contextPath}/booktype/queryAllBooktype" method="post" style="float: right">
                <span style="color:red;font-weight:bold;">${error}</span>
                <%--name属性是用于提交给后台的--%>
                <input type="text" name="queryBooktypeByName" class="form-control" placeholder="请输入要查询的分类名称">
                <input type="submit" value="查询" class="btn btn-primary">
            </form>
        </div>
    </div>
    <div class="row clearfix">
        <div class="listtable">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>分类编号</th>
                    <th>分类名称</th>
                    <th>分类别名</th>
                    <th>分类描述</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="booktype" items="${list}">
                    <tr>
                        <td>${booktype.typeId}</td>
                        <td>${booktype.typeName}</td>
                        <td>${booktype.typeAlias}</td>
                        <td>${booktype.typeDescribe}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/booktype/toUpate?typeId=${booktype.typeId}">修改</a>|
                            <a href="${pageContext.request.contextPath}/booktype/deleteBooktypecode/${booktype.typeId}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                <!-- 下面的一行是导航条 -->
<%--                <tr><td colspan="7">${pageNav}</td></tr>--%>
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
