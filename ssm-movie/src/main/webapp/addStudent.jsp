<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
                request.getServerName() + ":" + request.getServerPort() +
                request.getContextPath() + "/";
%>
<html>
<head>
    <title>注册学生</title>
    <base href="<%=basePath%>" />
    <link rel="stylesheet" type="text/css" href="layui-v2.6.4/layui/css/layui.css">
    <script src="layui-v2.6.4/layui/layui.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        layui.use("form",function (){
            var form = layui.form;
        })
    </script>
    <style type="text/css">
        body{
            margin:0px;
            padding:0px;
        }
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
<body >
    <div class="bg"><img src="images/index3.jpg" width="100%" height="100%"></div>
    <div align="center"><h1>注册页面</h1></div>
    <br><br>
    <div class="layui-col-md12 layui-col-md-offset5">
        <form class="layui-form" action="student/addStudent.do" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>ID</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="id" required  lay-verify="required" placeholder="请输入id" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">id设置为数字</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>密码</h1></label>
                <div class="layui-input-inline">
                    <input type="password" name="password" required lay-verify="required" placeholder="请输入password" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>姓名</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="name" required  lay-verify="required" placeholder="请输入name" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>年龄</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="age" required  lay-verify="required" placeholder="请输入age" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>性别</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="gender" required  lay-verify="required" placeholder="请输入gender" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>邮箱</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="email" required  lay-verify="required" placeholder="请输入email" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">注册</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>
</body>
</html>
<%--<div align="center" >--%>
<%--    <form action="student/addStudent.do" method="post">--%>
<%--        <table>--%>
<%--            <span align="center">注册页面</span>--%>
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
<%--                <td>姓名：</td>--%>
<%--                <td><input type="text" name="name"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>年龄：</td>--%>
<%--                <td><input type="text" name="age"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>性别：</td>--%>
<%--                <td><input type="text" name="gender"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>邮箱：</td>--%>
<%--                <td><input type="text" name="email"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>--%>
<%--                <td><input type="submit" value="注册"></td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </form>--%>
<%--</div>--%>