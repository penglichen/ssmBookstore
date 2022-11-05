<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../../css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/addpaper.css" type="text/css" />
    <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../js/popper.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="page-header">
            <span>新增用户</span>
        </div>
    </div>
    <div class="row clearfix">
        <form action="${pageContext.request.contextPath}/user/addUser" method="post">
            <div class="divhead">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/allUser">返回列表</a>
                <input type="submit" class="btn btn-primary" value="添加" id="sub_btn">
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="userName">用户姓名：</label>
                    <input type="text" name="userName" class="form-control" id="userName" required pattern="[-\w\u4E00-\u9FA5]{1,8}" maxlength="8">
                </div>
                <div class="col-5 form-group">
                    <label for="userPassword">用户密码：</label>
                    <input type="text" name="userPassword" class="form-control" id="userPassword" required pattern="[\dA-Za-z]{4,16}" maxlength="16">
                </div>
            </div>
                <div class="row">
                <div class="col-5 form-group">
                    <label for="userEmail">用户邮箱：</label>
                    <input type="email" name="userEmail" class="form-control" id="userEmail" required>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
