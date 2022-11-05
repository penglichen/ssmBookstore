<%--
  Created by IntelliJ IDEA.
  User: 徐小运
  Date: 2021/12/1
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%--动态获取--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";
%>

<!--  写base标签，永远固定相对路径跳转的结果  -->
<base href="<%=basePath%>">

<%--<link type="text/css" rel="stylesheet" href="static/css/bootstrap.min.css">--%>
<%--<link type="text/css" rel="stylesheet" href="static/css/font-awesome.min.css">--%>
<%--<link type="text/css" rel="stylesheet" href="static/css/index.css">--%>
<%--<script type="text/javascript" src="static/js/jquery-3.4.1.min.js"></script>--%>
<%--<script type="text/javascript" src="static/js/popper.js"></script>--%>
<%--<script type="text/javascript" src="static/js/bootstrap.min.js"></script>--%>

<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popper.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
