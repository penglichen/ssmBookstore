<%--
  Created by IntelliJ IDEA.
  User: 徐小运
  Date: 2021/12/1
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    body {
        font-family: '宋体';
        background-color: rgba(229, 229, 233, 0.5);
    }

    ul li {
        list-style: none;
    }

    a {
        /*color: #e3e3e3;*/
        text-decoration: none;
    }

    /*a:hover {*/
    /*    color: #fff;*/
    /*    text-decoration: none;*/
    /*}*/

    /* 底部 */
    footer {
        padding: 10px 0;
        /*border-top: 2px solid #f00;*/
        /*background: linear-gradient(-45deg, #3a3d79, #aa72a0, #38b688);*/
        background-color: #666;
    }

    .foot_left ul li a {
        color: #e3e3e3;
        font-size: 14px;
        padding-right: 5px;
    }

    .foot_left ul li a:hover {
        color: #ee5959;
    }

    .foot_left p {
        font-size: 12px;
        margin: 1px;
    }

    .foot_right ul li a {
        font-size: 40px;
        color: #fff;
    }

    .foot_right span:hover {
        color: #82c4eb;
    }
</style>

<!-- 底部 -->
<footer class="text-light mt-3">
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
                <p>我们致力于推动网络正版图书网上销售平台，相关版权合作请联系xuyunying@xyy.com</p>
                <p>互联网不良信息举报中心：www.12377.cn 违法和不良信息举报邮箱xuyunying@xyy.com： 举报电话：020-00000000 </p>
                <p>Copyright &copy; 2021-12 XXX网上书店</p>
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
                        <img src="static/images/head.jpg" alt="" width="80">
                    </li>
                </ul>
            </div>
        </div>

    </div>

</footer>
