<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改仓库</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="../../css/addpaper.css" type="text/css"/>
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
            <span>修改订单</span>
        </div>
    </div>
    <div class="row clearfix">
        <form action="${pageContext.request.contextPath}/order/updateOrder" method="post">
            <div class="divhead">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/order/allOrder1">返回列表</a>
                <input type="submit" class="btn btn-primary" value="修改">
            </div>
            <%--前端传递隐藏域--%>
            <input type="hidden" name="id" value="${QOrder.id}">
            <div class="row">
                <div class="col-5 form-group ">
                    <label for="orderId">订单编号：</label>
                    <input type="text" name="orderId" class="form-control" value="${QOrder.orderId}" id="orderId" readonly>
                </div>
                <div class="col-5 form-group">
                    <label for="userId">用户id：</label>
                    <input type="text" name="userId" class="form-control" value="${QOrder.userId}" id="userId" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="bookId">图书id：</label>
                    <input type="text" name="bookId" class="form-control" value="${QOrder.bookId}" id="bookId" readonly>
                </div>
                <div class="col-5 form-group">
                    <label for="bookName">图书名称：</label>
                    <input type="text" name="bookName" class="form-control" value="${QOrder.book.bookName}"  id="bookName" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="orderMount">订单编号：</label>
                    <input type="text" name="orderMount" class="form-control" value="${QOrder.orderMount}"  id="orderMount" readonly>
                </div>
                <div class="col-5 form-group">
                    <label for="totalPrice">总金额：</label>
                    <input type="text" name="totalPrice" class="form-control" value="${QOrder.totalPrice}" id="totalPrice" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="orderDate">订单日期：</label>
                    <input type="text" name="orderDate" class="form-control" value="${QOrder.orderDate}" id="orderDate" readonly>
                </div>
                <div class="col-5 form-group">
                    <label for="payMethod">付款方式：</label>
                    <input type="text" name="payMethod" class="form-control" value="${QOrder.payMethod}" id="payMethod" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group">
                    <label for="postMethod">邮寄方式：</label>
                    <input type="text" name="postMethod" class="form-control" value="${QOrder.postMethod}" id="postMethod" readonly>
                </div>
                <div class="col-5 form-group">
                    <label for="receverName">收件人：</label>
                    <input type="text" name="receverName" class="form-control" value="${QOrder.receverName}" id="receverName" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-5 form-group ">
                    <label for="receverAddr">收件地址：</label>
                    <%--name属性要与order的属性字段值一致--%>
                    <input type="text" name="receverAddr" class="form-control" value="${QOrder.receverAddr}" id="receverAddr"
                           required>
                </div>
                <div class="col-5 form-group ">
                    <label for="receverTel">电话号码：</label>
                    <%--name属性要与order的属性字段值一致--%>
                    <input type="text" name="receverTel" class="form-control" value="${QOrder.receverTel}" id="receverTel"
                           required>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-group">
                    <label for="priceStatus">订单备注：</label>
                    <input type="text" name="priceStatus" class="form-control" id="priceStatus" style="width: 75%" readonly>
                </div>
            </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
