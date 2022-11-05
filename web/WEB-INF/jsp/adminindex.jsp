<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%--<%@page isELIgnored="false"%>--%>
<html>
<head>
    <title>后台登录首页</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <style>
        body {
            background: #fcfcfc;
            margin: 0 auto;
        }
        .clear:after{
            content: '';
            display: block;
            clear: both;
        }
        #headNav {
            padding: 16px;
            background: #FFF;
            border-bottom: 1px solid #e1e1e1;
            box-shadow: 0px 0px 10px #ccc;
            background: linear-gradient(to bottom, #FFFFFF, #F8F8F8, #E8E8E8, #EAEAEA);
        }
        .innerNav {
            margin: 0 auto;
            width: 95%;
            position: relative;
        }

        .headFont span,.headFont a {
            line-height: 18px;
            font-family: "SimSun";
            font-size: 12px;
            color: #999;
            vertical-align: middle;
        }
        .headFont span a {
            color: #06c;
        }
        .headFont span a:hover {
            color: #f60;
        }
        .headFont>a {
            margin-left: 25px;
            color: #E60012;
        }
        .headFont>a {
            margin-left: 25px;
            color: #333;
        }
        .fr {
            float: right;
        }
        .fm{
            float: right;
            position: absolute;
            bottom: -1px;
            left: 1129px;
        }
        .fl {
            text-align: center;
        }
        .fo{
            position: absolute;
            top: 45%;
            left: 50%;
            background: white;
            box-shadow: 0px 0px 10px #ccc;
            border-radius: 5px;
            transform: translate(-50%,-50%);
        }

        #secBody {
            padding-top: 8px;
            padding-bottom: 30px;
        }

        .innerBody {
            width: 100%;
            height: 100%;
            margin: 0 auto;
        }

        .tableTap h3 {
            font-size: 14px;
            color: #666;
            font-weight: bold;
            line-height: 30px;
        }
        .tableTap a {
            color: #06c;
            line-height: 30px;
        }
        .tableTap a:hover {
            color: #f60;
            line-height: 30px;
        }
        .tableItem {
            position: relative;
            z-index: 100;
            height: 42px;
            margin-right: 5px;
            margin-left: 8px;
            margin-bottom: 10px;
            padding-top: 5px;
            padding-left: 5px;
            border: 1px solid #dedede;
            background: #FFF;
            line-height: 24px;
        }
        .userHead {
            width: 24px;
            height: 24px;
            display: inline-block;
            background: url("<%=request.getContextPath()%>/images/userHead.png") no-repeat;
            background-size: 100% 100%;
            vertical-align: middle;
        }
        .userLock {
            width: 24px;
            height: 24px;
            display: inline-block;
            background: url("<%=request.getContextPath()%>/images/lock.png") no-repeat;
            background-size: 100% 100%;
            vertical-align: middle;
        }
        .tableItem input {
            vertical-align: middle;
            width: 230px;
            height: 24px;
            padding-left: 20px;
            border: 0 none;
            line-height: 24px;
            vertical-align: middle;
            font-family: "Microsoft YaHei";
            font-size: 14px;
            outline: none;
        }

        /*按钮*/
        .tableBtn {
            width: 90px;
            height: 45px;
            border: 0 none;
            border-radius: 3px;
            background: #4ea9df;
            text-align: center;
            font-size: 16px;
            vertical-align: middle;
            margin-left: 35%;
            color: #FFF;
            cursor: pointer;
            text-shadow: 1px 1px 1px #499dd9;
            font-family: "Microsoft YaHei";
        }
    </style>
</head>
<body>
<%@ include file="header.jsp"%>
<div id="secBody">
    <div class="innerBody clear">
        <a class="fl" href="#"><img src="<%=request.getContextPath()%>/images/login.jpg" alt="" style="width: 100%;height: 100%"/></a>
        <div class="tableWrap fo">
            <form action="${pageContext.request.contextPath}/admin/toAdminLogin" method="post">
                <div class="tableTap clear">
                    <h3 class="fl">用户登录</h3>
                </div>
                <div class="tableItem">
                    <i class="userHead"></i>
                    <input type="text" name="adminname" placeholder="用户名" required />
                </div>
                <div class="tableItem">
                    <i class="userLock"></i>
                    <input type="password" name="password" placeholder="密码" required/>
                </div>
                <button class="tableBtn">登录</button>
                <span style="color:red;font-weight:bold;">${error}</span>
            </form>
        </div>
    </div>
</div>
</head>
</body>
</html>

