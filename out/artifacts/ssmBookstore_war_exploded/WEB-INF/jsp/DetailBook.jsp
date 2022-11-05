<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书详情</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="../../css/addpaper.css" type="text/css"/>
    <style>

        .page-header2 {
            margin-top: 2px;
            height: 54px;
            display: flex;
            align-items: center;
            background: linear-gradient(to bottom, #FFFFFF, #F8F8F8, #E8E8E8, #EAEAEA);
        }
        .page-header2 span{
            font-size: 20px;
            color: #886b19;
            padding-left: 14px;
        }
        .listtable{
            border: 1px solid #e7e6e6;
            width: 100%;
            color: #747474;
        }
        #divimg{
            text-align: left !important;
            margin-left: 71px !important;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="page-header">
            <span>查看图书详情</span>

        </div>
    </div>
    <div class="row clearfix">
        <form action="${pageContext.request.contextPath}/book/toUpate?id=${DBook.bookId}" method="post">
            <div class="divhead">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">返回列表</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toUpate?id=${DBook.bookId}">修改</a>
            </div>
            <%--前端传递隐藏域--%>
            <input type="hidden" name="bookId" value="${DBook.bookId}">
            <div class="row">
                <div class="col-12 form-group" id="divimg">
                    <label>图书封面：</label>
                    <c:if test="${DBook.imgPath !=null}">
                        <img src="<%=request.getContextPath()%>/${DBook.imgPath}" width=100 height=100/>
                        <br/>
                    </c:if>
                    <%--                    <input type="file" name="pictureFile" id="imgpath"/>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group ">
                    <label for="bookName">图书名称：</label>
                    <%--              name属性要与Book的属性字段值一致--%>
                    <input type="text" name="bookName" class="form-control" value="${DBook.bookName}" id="bookName" readonly>
                </div>
                <div class="col-5 form-group">
                    <label for="bookPrice">图书价格：</label>
                    <input type="text" name="bookPrice" class="form-control" value="${DBook.bookPrice}" id="bookPrice"
                           readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="delPrice">划线价：</label>
                    <input type="text" name="delPrice" class="form-control" value="${DBook.delPrice}" id="delPrice" readonly>
                </div>
                <div class="col-5 form-group">
                    <label for="bookAuthor">作者：</label>
                    <input type="text" name="bookAuthor" class="form-control" value="${DBook.bookAuthor}"
                           id="bookAuthor" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="bookPress">出版社：</label>
                    <input type="text" name="bookPress" class="form-control" value="${DBook.bookPress}" id="bookPress" readonly>
                </div>
                <div class="col-5 form-group">
                    <label for="pressDate">出版日期：</label>
                    <input type="text" name="pressDate" class="form-control" id="pressDate" value="${DBook.pressDate}" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="bookSales">销量：</label>
                    <input type="text" name="bookSales" class="form-control" value="${DBook.bookSales}" id="bookSales" readonly>
                </div>
                <div class="col-5 form-group">
                    <label for="bookStock">库存：</label>
                    <input type="text" name="bookStock" class="form-control" value="${DBook.bookStock}" id="bookStock" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="bookType">图书类型：</label>
                    <input type="text" name="bookType" class="form-control" value="${DBook.bookType}" id="bookType" readonly>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
</html>

