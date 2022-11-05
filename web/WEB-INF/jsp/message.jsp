<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>提示信息页面</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <style>
        .main{
            width:100%;
            height:300px;
            margin:0px auto;
            text-align:center;
        }
        .content{
            font-size: 26px;
            margin-top:100px;
        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<div class="main">
    <div class="content">${error}&nbsp;<a href="${pageContext.request.contextPath}/admin/toadmin">返回管理员登录主页</a></div>
</div>
</body>
</html>