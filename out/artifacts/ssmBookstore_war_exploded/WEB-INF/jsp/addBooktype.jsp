<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="../../css/addpaper.css" type="text/css" />
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="page-header">
            <span>新增图书分类</span>
        </div>
    </div>
    <div class="row clearfix">
        <form action="${pageContext.request.contextPath}/booktype/addBooktype" method="post">
            <div class="divhead">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/booktype/allBooktype">返回列表</a>
                <input type="submit" class="btn btn-primary" value="添加">
            </div>
            <div class="row">
                <div class="col-5 form-group ">
                    <label for="typeName">分类名称：</label>
                    <%--name属性要与Booktype的属性字段值一致--%>
                    <input type="text" name="typeName" class="form-control" id="typeName" required>
                </div>
                <div class="col-5 form-group">
                    <label for="typeAlias">分类别名：</label>
                    <input type="text" name="typeAlias" class="form-control" id="typeAlias" required>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-group">
                    <label for="typeDescribe">备注：</label>
                    <input type="text" name="typeDescribe" class="form-control" id="typeDescribe" style="width: 75%" required>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
