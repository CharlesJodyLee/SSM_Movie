<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>功能入口</title>
    <base href="<%=basePath%>" />
    <link rel="stylesheet" type="text/css" href="layui-v2.6.4/layui/css/layui.css">
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
    <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        $(function (){
            hideForm();
            $("#powerUp").click(function (){
                $("#hideFormPower").css('display','block');
            });
        });
        function hideForm(){
            $("#hideFormPower").css('display','none');
            $("#tr1").css('display','none');
            $("#tr2").css('display','none');
            $("#tr3").css('display','none');
        };
    </script>


</head>
<body>
    <div class="bg"><img src="images/index3.jpg" width="100%" height="100%"></div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br>
    <h1 align="center">首页</h1>
    <br><br><br><br><br><br><br><br><br><br><br>
    <div >
        <table align="center" >
            <tr>
                <td><a href="loginStudent.jsp" class="layui-btn layui-btn-normal" >
                        &nbsp;&nbsp;&nbsp;&nbsp;登录&nbsp;&nbsp;&nbsp;
                    </a></td>
            </tr>

            <tr>
                <td><a id="powerUp" class="layui-btn">权限up！</a></td>
            </tr>
        </table>
    </div>
    <div align="center">
        <form id="hideFormPower" action="student/powerCheck.do" method="post">
            <input type="hidden" name="id" value="99999" readonly/>
            root账号:<input type="text" name="showName" value="99999" readonly/>
            通行密码:<input type="password" name="password" />
            <br><input id="powerCheck" type="submit"  value="检测权限信息" />
        </form>
    </div>


</body>
</html>
