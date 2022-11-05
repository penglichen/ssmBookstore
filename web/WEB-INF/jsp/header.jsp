<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <title></title>
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
            width: 100%;
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
            margin-left: 0px;
            color: #333;
        }

        .fm{
            float: right;
            position: absolute;
            bottom: -5px;
            left: 1129px;
        }

        .helpLink {
            color: #333;
            font-size: 12px;
        }
        .helpLink:hover {
            color: #E60012;
        }


    </style>
</head>
<body>
<div id="headNav">
    <div class="innerNav clear">
        <h3>网上图书后台管理系统</h3>
        <div class="headFont fm">
            <c:if test="${adminname==null}">
                <font color="red">尚未登录！</font>
            </c:if>
            <%--            <c:if test="${sessionScope.username!=null}">--%>
            <%--                欢迎您：<font color="green">${username}</font>--%>
            <%--            </c:if>--%>
<%--            <a class="helpLink" href="#">注册账号</a>--%>
<%--            &nbsp;|&nbsp;--%>
<%--            <a class="helpLink" href="#">帮助中心</a>--%>
        </div>
    </div>
</div>
</body>
</html>
