<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="pages/common/headFile.jsp"%>

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
<!-- 头部 -->
<%@ include file="pages/common/head.jsp"%>
<section>

    <div class="main">
        <div class="content">${msg}&nbsp;<a href="/" style="color: red">返回首页</a></div>
    </div>
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
