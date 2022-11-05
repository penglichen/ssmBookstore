<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改仓库</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="../../css/addpaper.css" type="text/css"/>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="page-header">
            <span>修改图书分类</span>
        </div>
    </div>
    <div class="row clearfix">
        <form action="${pageContext.request.contextPath}/user/updateUser" method="post">
            <div class="divhead">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/allUser">返回列表</a>
                <input type="submit" class="btn btn-primary" value="修改">
            </div>
            <%--前端传递隐藏域--%>
            <input type="hidden" name="userId" value="${QUser.userId}">
            <div class="row">
                <div class="col-5 form-group ">
                    <label for="userName">用户名称：</label>
                    <%--name属性要与booktype的属性字段值一致--%>
                    <input type="text" name="userName" class="form-control" value="${QUser.userName}" id="userName"
                           required>
                </div>
                <div class="col-5 form-group ">
                    <label for="userPassword">用户密码：</label>
                    <%--name属性要与booktype的属性字段值一致--%>
                    <input type="text" name="userPassword" class="form-control" value="${QUser.userPassword}" id="userPassword"
                           required>
                </div>
                <div class="col-5 form-group ">
                    <label for="userEmail">用户Email：</label>
                    <%--name属性要与booktype的属性字段值一致--%>
                    <input type="text" name="userEmail" class="form-control" value="${QUser.userEmail}" id="userEmail"
                           required>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
