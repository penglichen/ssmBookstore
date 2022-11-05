<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="../../css/addpaper.css" type="text/css" />
    <style>
        .col-12 {
            margin-left: 76px !important;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="page-header">
            <span>新增订单</span>
        </div>
    </div>
    <div class="row clearfix">
        <form action="${pageContext.request.contextPath}/order/addOrder" method="post">
            <div class="divhead">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/order/allOrder1">返回列表</a>
                <input type="submit" class="btn btn-primary" value="添加">
            </div>
            <div class="row">
                <div class="col-5 form-group ">
                    <label for="orderId">订单编号：</label>
                    <%--name属性要与Booktype的属性字段值一致--%>
                    <input type="text" name="orderId" class="form-control" id="orderId" required>
                </div>
                <div class="col-5 form-group">
                    <label for="userId">用户id：</label>
                    <input type="text" name="userId" class="form-control" id="userId" required>
                </div>
            </div>
                <div class="row">
                <div class="col-5 form-group">
                    <label for="bookId">图书id：</label>
                    <input type="text" name="bookId" class="form-control" id="bookId" required>
                </div>
                <div class="col-5 form-group">
                    <label for="orderMount">订单编号：</label>
                    <input type="text" name="orderMount" class="form-control" id="orderMount" required>
                </div>
                </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="totalPrice">总金额：</label>
                    <input type="text" name="totalPrice" class="form-control" id="totalPrice" required>
                </div>
                <div class="col-5 form-group">
                    <label for="orderDate">订单日期：</label>
                    <input type="text" name="orderDate" class="form-control" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime())%>"  id="orderDate" required>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="payMethod">付款方式：</label>
                    <input type="text" name="payMethod" class="form-control" id="payMethod" required>
                </div>
                <div class="col-5 form-group">
                    <label for="postMethod">邮寄方式：</label>
                    <input type="text" name="postMethod" class="form-control" id="postMethod" required>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="receverName">收件人：</label>
                    <input type="text" name="receverName" class="form-control" id="receverName" required>
                </div>
                <div class="col-5 form-group">
                    <label for="receverTel">电话号码：</label>
                    <input type="text" name="receverTel" class="form-control" id="receverTel" required>
                </div>

            </div>
            <div class="row">
                <div class="col-12 form-group">
                    <label for="receverAddr">收件地址：</label>
                    <input type="text" name="receverAddr" class="form-control" id="receverAddr" style="width: 75%" required>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-group">
                    <label for="priceStatus">订单备注：</label>
                    <input type="text" name="priceStatus" class="form-control" id="priceStatus" style="width: 75%" required>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
