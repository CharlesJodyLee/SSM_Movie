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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="layui-v2.6.4/layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        $(function (){
            hideForm();
            $("#a1").click(function (){
                document.getElementById("hideForm1").submit();
            })
            $("#a2").click(function (){
                document.getElementById("hideForm2").submit();
            })
            $("#a3").click(function (){
                document.getElementById("hideForm3").submit();
            })
            $("#a4").click(function (){
                document.getElementById("hideForm4").submit();
            })

        })
        function hideForm(){
            $("#hideForm1").css('display','none');
            $("#hideForm2").css('display','none');
            $("#hideForm3").css('display','none');
            $("#hideForm4").css('display','none');
        }

    </script>

</head>
<body class="layui-bg-cyan">

    <div id="topDiv" align="center">
        <ul class="layui-nav" >
            <li class="layui-nav-item"><a id="a1">主页</a></li>
            <li class="layui-nav-item layui-this"><a id="a2">个人中心</a></li>
            <li class="layui-nav-item"><a id="a3" >分类查找</a></li>
            <li class="layui-nav-item"><a id="a4">个人收藏</a></li>
            <li class="layui-nav-item"><a href="index.jsp">退出</a></li>
        </ul>
    </div>
    <form id="hideForm1" action="student/loginStudent.do"  method="post">
        <input type="text" name="id" value="${studentId}">
        <input type="text" name="password" value="${studentPassword}">
        <input type="text" name="name" value="${studentName}">
        <input type="submit" value="提交">
    </form>
    <form id="hideForm2" action="student/studentCenter.do"  method="post">
        <input type="text" name="id" value="${studentId}">
        <input type="text" name="password" value="${studentPassword}">
        <input type="text" name="name" value="${studentName}">
        <input type="submit" value="提交">
    </form>
    <form id="hideForm3" action="student/ClassifiedSearch.do"  method="post">
        <input type="text" name="id" value="${studentId}">
        <input type="text" name="password" value="${studentPassword}">
        <input type="text" name="name" value="${studentName}">
        <input type="submit" value="提交">
    </form>
    <form id="hideForm4" action="student/CollectionPage.do"  method="post">
        <input type="text" name="id" value="${studentId}">
        <input type="text" name="password" value="${studentPassword}">
        <input type="text" name="name" value="${studentName}">
        <input type="submit" value="提交">
    </form>


    <div id="PersonMessage">
        <br>
        <div align="center"><h1>个人中心</h1></div>
        <br>
    </div>
    <div class="layui-col-md12 layui-col-md-offset5" >
        <form class="layui-form" action="student/alterStudent.do" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <div class="layui-input-inline">
                    <input type="hidden" name="id" required  lay-verify="required" placeholder="请输入id" autocomplete="off" class="layui-input" value="${studentId}" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>ID</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="readonlyId" required  lay-verify="required" placeholder="请输入id" autocomplete="off" class="layui-input" value="${studentId}" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>密码</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="password" required lay-verify="required" placeholder="请输入password" autocomplete="off" class="layui-input" value="${studentPassword}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>姓名</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="name" required  lay-verify="required" placeholder="请输入name" autocomplete="off" class="layui-input" value="${studentName}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>年龄</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="age" required  lay-verify="required" placeholder="请输入age" autocomplete="off" class="layui-input" value="${studentAge}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>性别</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="gender" required  lay-verify="required" placeholder="请输入gender" autocomplete="off" class="layui-input" value="${studentGender}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>邮箱</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="email" required  lay-verify="required" placeholder="请输入email" autocomplete="off" class="layui-input" value="${studentEmail}">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
                </div>
            </div>

        </form>
    </div>



</body>
</html>

