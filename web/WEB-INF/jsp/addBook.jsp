<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="../../css/addpaper.css" type="text/css" />
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="page-header">
            <span>新增图书</span>
        </div>
    </div>
    <div class="row clearfix">
        <!-- 上传图片是需要指定属性 enctype="multipart/form-data" -->
        <form id="addform" action="${pageContext.request.contextPath}/book/addBook" method="post" enctype="multipart/form-data">
            <div class="divhead">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">返回列表</a>
                <input type="submit" class="btn btn-primary" value="添加">
            </div>
            <div class="row">
                <div class="col-5 form-group" style="text-align: center;">
                    <label>图书封面：</label>
                    <%--                    <c:if test="${DBook.imgPath !=null}">--%>
                    <%--                        <img src="<%=request.getContextPath()%>/${DBook.imgPath}" width=100 height=100/>--%>
                    <%--                        <br/>--%>
                    <%--                    </c:if>--%>
                    <input type="file" name="imgpath" id="imgpath"/>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group ">
                    <label for="bookName">图书名称：</label>
                    <%--              name属性要与Book的属性字段值一致--%>
                    <input type="text" name="bookName" class="form-control" id="bookName" required>
                </div>
                <div class="col-5 form-group">
                    <label for="bookPrice">图书价格：</label>
                    <input type="text" name="bookPrice" class="form-control" id="bookPrice" required>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="delPrice">划线价：</label>
                    <input type="text" name="delPrice" class="form-control" id="delPrice" required>
                </div>
                <div class="col-5 form-group">
                    <label for="bookAuthor">作者：</label>
                    <input type="text" name="bookAuthor" class="form-control" id="bookAuthor" required>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="bookPress">出版社：</label>
                    <input type="text" name="bookPress" class="form-control" id="bookPress" required>
                </div>
                <div class="col-5 form-group">
                    <label for="pressDate">出版日期：</label>
                    <input type="text" name="pressDate" class="form-control" id="pressDate"
                           value="<%=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime())%>" required>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="bookSales">销量：</label>
                    <input type="number" name="bookSales" class="form-control" id="bookSales" required>
                </div>
                <div class="col-5 form-group">
                    <label for="bookStock">库存：</label>
                    <input type="number" name="bookStock" class="form-control" id="bookStock" required>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="bookType">图书类型：</label>
                    <input type="text" name="bookType" class="form-control" id="bookType" required>
                </div>
            </div>


        </form>
    </div>
</div>
</body>
</html>
