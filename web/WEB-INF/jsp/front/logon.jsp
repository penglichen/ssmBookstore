<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册页</title>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../../css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/index.css">
    <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../../js/popper.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>

    <style>
        .banner {
            height: 440px;
        }
        
        .box {
            width: 350px;
            border-radius: 10px;
            background-color: rgba(235, 228, 228, 0.3);
        }

        .errorMsg{
            height: 20px;
            font-size: 14px;
        }
        
        table tr td {
            padding-top: 10px;
        }
    </style>
    <!-- 表单验证 -->
    <script type="text/javascript">
        //页面加载完成之后
        $(function() {
            //给注册绑定点击事件
            $("#sub_btn").click(function() {

                // 验证用户名： 必须由字母， 数字下划线组成， 并且长度为5~12 位
                // 1.获取用户名输入框里的内容
                var usernameText = $("#userName").val();
                // 2.创建正则表达式对象
                var usernamePatt = /^\w{5,12}$/;
                // 3.使用test方法验证
                if (!usernamePatt.test(usernameText)) {
                    // 4.提示用户结果
                    $("span.errorMsg").text("用户名不合法！");
                    return false;
                }


                // 验证密码： 必须由字母， 数字下划线组成， 并且长度为5~12 位
                // 1.获取密码输入框里的内容
                var passwordText = $("#userPassword").val();
                // 2.创建正则表达式对象
                var passwordPatt = /^\w{5,12}$/;
                // 3.使用test方法验证
                if (!passwordPatt.test(passwordText)) {
                    // 4.提示用户结果
                    $("span.errorMsg").text("密码不合法！");
                    return false;
                }

                // 验证确认密码： 和密码相同
                // 1.获取确认密码
                var repwdText = $("#repwd").val();
                // 2.和密码相比较
                if (repwdText != passwordText) {
                    // 3.提示用户
                    $("span.errorMsg").text("确认密码和密码不一致！");
                    return false;
                }



                // 验证邮箱： xxxxx @xxx.com
                // 1.获取邮箱里的内容
                var emailText = $("#userEmail").val();
                // 2.创建正则表达式对象
                var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[da-z])?)+(\.{1,2}[a-z]+)+$/
                    // 3.使用test方法验证是否合法
                if (!emailPatt.test(emailText)) {
                    // 4.提示用户
                    $("span.errorMsg").text("邮箱格式不合法");
                    return false;
                }


                // // 验证码： 现在只需验证用户已输入， 因为还没讲到服务器， 验证码生成。
                // var codeText = $("#code").val();
                // //去掉验证码前后空格
                // $.trim(codeText);
                // // 验证验证码是否输入
                // if (codeText == null || codeText == "") {
                //     // 提示用户
                //     $("span.errorMsg").text("验证码不能为空");
                //     return false;
                // }

                $("span.errorMsg").text("");
            });
        });
    </script>
</head>

<body>
<!-- 快捷导航栏 -->
<div class="headTop">
    <!-- 顶部左边 -->
    <div class="headTop_left ml-5">
        <ul class="list-inline">
            <li class="list-inline-item">
                <span>嗨！欢迎来到928网上书店</span>
            </li>
            <li class="list-inline-item">
                <a href="/"><span class="fa fa-home"></span>首页</a>
            </li>
                <li class="list-inline-item">
                    <a href="<%=request.getContextPath()%>/tologin">请登录</a>
                </li>
                <li class="list-inline-item">
                    <a href="<%=request.getContextPath()%>/tologon">欢迎注册</a>
                </li>
            <li class="list-inline-item">
                <a href="${pageContext.request.contextPath}/admin/toadmin">管理员登录</a>
            </li>
        </ul>
    </div>
    <!-- 顶部右边 -->
    <div class="headTop_right mr-5">
        <ul class="list-inline">
            <li class="list-inline-item">
                <a href="/">个人中心</a>
            </li>
            <li class="list-inline-item">
                <a href="<%=request.getContextPath()%>/order/myOrder">我的订单</a>
            </li>
            <li class="list-inline-item">
                <a href="/">客户服务</a>
            </li>
        </ul>
    </div>
</div>
    <!-- 横幅 -->
    <div class="banner bg-light">
        <div class="content container py-4">
            <div class="row">
                <!-- 左边内容 -->
                <div class="content_left col-md-6 d-none d-md-block">
                    <span>欢迎注册</span>
                </div>

                <!-- 右边内容 -->
                <div class="content_right col-md-6 pl-4 mx-auto">
                    <!-- 表单盒子 -->
                    <div class="box p-4">
                        <!-- 表单标题 -->
                        <div class="tit">
                            <h5>用户注册</h5>
                            <!-- 验证提示内容 -->
                            <span class="errorMsg text-warning">
<%--                           <%=request.getAttribute("msg")==null?"":request.getAttribute("msg")%>--%>
                               ${requestScope.msg}
                            </span>
                        </div>

                        <!-- 表单内容 -->
                        <form action="<%=request.getContextPath()%>/user/toinsertUser" method="post">
                            <%-- 表单隐藏域 --%>
                            <input type="hidden" name="action" value="logon">

                            <table>
                                <!-- 用户名 -->
                                <tr>
                                    <td>
                                        <label for="userName">用户名称：</label>
                                    </td>
                                    <td colspan="2">
                                        <input type="text" placeholder="请输入用户名" class="form-control" name="userName" id="userName"
                                               value="${requestScope.userName}">
                                    </td>
                                </tr>
                                <!-- 密码 -->
                                <tr>
                                    <td>
                                        <label for="userPassword">用户密码：</label>
                                    </td>
                                    <td colspan="2">
                                        <input type="password" placeholder="请输入登录密码" class="form-control" name="userPassword" id="userPassword">
                                    </td>
                                </tr>
                                <!-- 确认密码 -->
                                <tr>
                                    <td>
                                        <label for="repwd">确认密码：</label>
                                    </td>
                                    <td colspan="2">
                                        <input type="password" placeholder="确认密码" class="form-control" name="repwd" id="repwd">
                                    </td>
                                </tr>
                                <!-- 邮箱 -->
                                <tr>
                                    <td>
                                        <label for="userEmail">电子邮箱:</label>
                                    </td>
                                    <td colspan="2">
                                        <input type="text" placeholder="请输入电子邮箱" class="form-control" name="userEmail" id="userEmail"
                                        value="${requestScope.userEmail}">
                                    </td>
                                </tr>
<%--                                <!-- 验证码 -->--%>
<%--                                <tr>--%>
<%--                                    <td>--%>
<%--                                        <label for="code">验证码:</label>--%>
<%--                                    </td>--%>
<%--                                    <td>--%>
<%--                                        <input type="text" class="form-control" name="code" id="code" style="width: 130px;">--%>
<%--                                    </td>--%>
<%--                                    <td>--%>
<%--                                        <img src="images/head.jpg" alt="" style="width:60px; height: 30px">--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
                                <!-- 注册按钮 -->
                                <tr>
                                    <td colspan="3" class="text-center">
                                        <input type="submit" class="btn btn-primary" id="sub_btn" value="注册" style="width: 280px;">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--页脚部分--%>
    <%@include file="pages/common/footer.jsp"%>
</body>

</html>