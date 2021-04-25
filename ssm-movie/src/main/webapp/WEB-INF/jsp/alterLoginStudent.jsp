<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>" />
    <link rel="stylesheet" type="text/css" href="layui-v2.6.4/layui/css/layui.css">
    <script src="layui-v2.6.4/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        layui.use("form",function (){
            var form = layui.form;
        })
    </script>
    <style type="text/css">
        .bg{
            position:absolute;
            left:0px;
            top:0px;
            width:100%;
            height:100%;
            z-index:-1;
        }
    </style>
</head>
<body>
    <div class="bg"><img src="images/index3.jpg" width="100%" height="100%"></div>
    <div align="center"><h1>登录页面</h1></div>
    <div>&nbsp;</div>
    <div class="layui-col-md6 layui-col-md-offset5">
        <form class="layui-form" action="student/loginStudent.do" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>ID</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="id" required  lay-verify="required" placeholder="请输入ID" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>密码</h1></label>
                <div class="layui-input-inline">
                    <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" >
                <div class="layui-input-block">
                    <button class="layui-btn" type="submit" lay-filter="formDemo">登录</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
    <%--        <table>--%>
    <%--            <p><br></p>--%>
    <%--            <tr>--%>
    <%--                <td>id：</td>--%>
    <%--                <td><input type="text" name="id"></td>--%>
    <%--            </tr>--%>
    <%--            <tr>--%>
    <%--                <td>密码：</td>--%>
    <%--                <td><input type="password" name="password"></td>--%>
    <%--            </tr>--%>
    <%--            <tr>--%>
    <%--                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>--%>
    <%--                <td><input type="submit" value="登录"></td>--%>
    <%--            </tr>--%>
    <%--        </table>--%>
        </form>
    </div>
</body>
</html>
