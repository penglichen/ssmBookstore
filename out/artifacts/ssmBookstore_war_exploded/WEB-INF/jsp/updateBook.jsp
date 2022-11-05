<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改图书信息</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="../../css/addpaper.css" type="text/css"/>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="page-header">
            <span>修改图书信息</span>
        </div>
    </div>
    <div class="row clearfix">
        <form action="${pageContext.request.contextPath}/book/updateBook" method="post" enctype="multipart/form-data">
            <div class="divhead">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">返回列表</a>
                <input type="submit" class="btn btn-primary" value="保存">
            </div>
            <%--前端传递隐藏域--%>
            <input type="hidden" name="bookId" value="${QBook.bookId}">
            <div class="row">
                <div class="col-5 form-group ">
                    <label for="bookName">图书名称：</label>
                    <%--              name属性要与Book的属性字段值一致--%>
                    <input type="text" name="bookName" class="form-control" value="${QBook.bookName}" id="bookName"
                           required>
                </div>
                <div class="col-5 form-group">
                    <label for="bookPrice">图书价格：</label>
                    <input type="number" name="bookPrice" class="form-control" value="${QBook.bookPrice}" id="bookPrice"
                           required>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="delPrice">划线价：</label>
                    <input type="number" name="delPrice" class="form-control" value="${QBook.delPrice}" id="delPrice" required>
                </div>
                <div class="col-5 form-group">
                    <label for="bookAuthor">作者：</label>
                    <input type="text" name="bookAuthor" class="form-control" value="${QBook.bookAuthor}"
                           id="bookAuthor" required>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="bookPress">出版社：</label>
                    <input type="text" name="bookPress" class="form-control" value="${QBook.bookPress}" id="bookPress" required>
                </div>
                <div class="col-5 form-group">
                    <label for="pressDate">出版日期：</label>
                    <input type="text" name="pressDate" class="form-control" id="pressDate" value="${QBook.pressDate}" required>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="bookSales">销量：</label>
                    <input type="number" name="bookSales" class="form-control" value="${QBook.bookSales}" id="bookSales" required>
                </div>
                <div class="col-5 form-group">
                    <label for="bookStock">库存：</label>
                    <input type="number" name="bookStock" class="form-control" value="${QBook.bookStock}" id="bookStock" required>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="bookType">图书类型：</label>
                    <input type="text" name="bookType" class="form-control" value="${QBook.bookType}" id="bookType" required>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-group" id="divimg">
                    <label>图书封面：</label>
                    <c:if test="${QBook.imgPath !=null}">
                        <img src="<%=request.getContextPath()%>/${QBook.imgPath}" width=100 height=100 id="realPic"/>
                        <br/>
                    </c:if>
                    <input type="file" name="imgpath" id="imgpath"/>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
