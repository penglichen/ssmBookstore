<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的订单</title>

    <%--  静态包含 base标签、css样式、jQuery文件、bootstrap文件、font字体图标文件  --%>
    <%@ include file="pages/common/headFile.jsp"%>
    <style>
        .whole_all {
            width: 200px;
        }
        
        .cut,
        .add {
            padding: 3px 5px;
            border: 1px solid #000;
        }
        
        table tbody tr {
            height: 60px;
            line-height: 60px;
        }
        
        table tr img {
            width: 50px;
            height: 50px;
        }
        
        .total label {
            font-weight: bold;
            font-size: 24px;
        }
        
        .total span {
            font-size: 25px;
            font-weight: bold;
            color: #f00;
            margin-right: 30px;
        }

    </style>

    <script>
        /*购物车商品数量加减*/
        $(function() {
            $(".cut").click(function() {
                var subval = $(this).next();
                if (parseInt(subval.val()) > 0)
                    subval.val(parseInt(subval.val()) - 1)
            });
            $(".add").click(function() {
                var subval = $(this).prev();
                subval.val(parseInt(subval.val()) + 1)
            });

            //日期格式化
            $(".orderDate").each(
                function (index,obj) {
                    var val = $(obj).html();
                    $(obj).html(formatDate(val))
                }
            );
        });
        function formatDate(date) {
            var d = new Date(date),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;

            return [year, month, day].join('-');
        }
    </script>
</head>

<body>
    <!-- 头部 -->
    <%@ include file="pages/common/head.jsp"%>
    <section>
        <div class="nav_top row">
            <div class="whole_all text-center">
                <a href="<%=request.getContextPath()%>/order/myOrder">我的订单</a>
            </div>
        </div>
        <table class="table table-hover text-center">
            <thead class="bg-light">
                <tr>
                    <th>订单号</th>
                    <th>商品内容</th>
                    <th>购买日期</th>
                    <th>费用</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${orderList.size()>=0}">
            <c:forEach var="order" items="${orderList}">
                <tr>
                    <td>${order.orderId}</td>
                    <td class="text-left">
                        <img src="<%=request.getContextPath()%>/${order.book.imgPath}" alt="">
                        <span>${order.book.bookName}</span>
                    </td>
                    <td class="orderDate">${order.orderDate}</td>
                    <td>${order.totalPrice}</td>
                    <td>${order.priceStatus}</td>
                    <td>
                        <a href="<%=request.getContextPath()%>/book/detail?bid=${order.book.bookId}" type="button" class="btn btn-success">查看详情</a>
                    </td>
                </tr>
            </c:forEach>
            </c:if>
            <c:if test="${empty user}">
                <tr>
                    <td colspan="6">
                        不好意思，您未登录，请<a href="<%=request.getContextPath()%>/tologin" style="color:red">登录</a></td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </section>

    <!-- 底部 -->
    <footer class="text-light">
        <div class="container">
            <div class="row">
                <!-- 底部左边 -->
                <div class="foot_left col-md-7">
                    <ul class="list-inline">
                        <li class="list-inline-item"><a href="#">服务条款</a>|</li>
                        <li class="list-inline-item"><a href="#">隐私政策</a>|</li>
                        <li class="list-inline-item"><a href="#">版权诉讼指引</a>|</li>
                        <li class="list-inline-item"><a href="#">意见反馈</a>|</li>
                        <li class="list-inline-item"><a href="#">广告合作</a>|</li>
                        <li class="list-inline-item"><a href="#">常见问题</a>|</li>
                        <li class="list-inline-item"><a href="#">联系我们</a></li>
                    </ul>
                    <p>我们致力于推动网络正版音乐发展，相关版权合作请联系xuyunying@xyy.com</p>
                    <p>互联网不良信息举报中心：www.12377.cn 违法和不良信息举报邮箱xuyunying@xyy.com： 举报电话：020-00000000 </p>
                    <p>Copyright &copy; 2021-12 XXX音乐网站</p>
                </div>

                <!-- 底部右边 -->
                <div class="foot_right col-md-5 text-right mt-2 d-none d-md-block">
                    <ul class="list-inline pl-1">
                        <li class="list-inline-item pl-2">
                            <a href=""><span class="fa fa-weibo"></span></a>
                        </li>
                        <li class="list-inline-item pl-2">
                            <a href=""><span class="fa fa-weixin"></span></a>
                        </li>
                        <li class="list-inline-item pl-2">
                            <a href=""><span class="fa fa-exclamation-triangle"></span></a>
                        </li>
                        <li class="list-inline-item pl-5">
                            <div class="text-center">关注我们</div>
                            <img src="<%=request.getContextPath()%>/images/head.jpg" alt="" width="80">
                        </li>
                    </ul>
                </div>
            </div>

        </div>

    </footer>

</body>

</html>