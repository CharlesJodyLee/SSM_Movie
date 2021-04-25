<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>添加电影</title>
    <base href="<%=basePath%>" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    <div align="center"><h1>添加电影页面</h1></div>
    <br><br>
    <div class="layui-col-md12 layui-col-md-offset5">
        <form class="layui-form" action="movie/addMovie.do" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>电影Id</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="movieId" required  lay-verify="required" placeholder="请输入movieId" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>片名</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="movieName" required  lay-verify="required" placeholder="请输入movieName" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>别名</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="movieOtherName" required  lay-verify="required" placeholder="请输入movieOtherName" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div>
                <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间&nbsp;&nbsp;&nbsp;<input type="date" name="movieTime"><br></h1>

            </div>
            <br>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>图片</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="moviePicture" required  lay-verify="required" placeholder="请输入moviePicture" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>类型</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="movieType" required  lay-verify="required" placeholder="请输入movieType" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>国家</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="movieCountry" required  lay-verify="required" placeholder="请输入movieCountry" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>导演</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="movieDirector" required  lay-verify="required" placeholder="请输入movieDirector" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><h1>片长</h1></label>
                <div class="layui-input-inline">
                    <input type="text" name="movieLength" required  lay-verify="required" placeholder="请输入movieLength" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label"><h1>简介</h1></label>
                <div class="layui-input-inline">
                    <textarea name="movieIntroduce" placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">添加电影</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
    </div>
</body>
</html>
<%--<div align="center">--%>
<%--    <form action="movie/addMovie.do" method="post">--%>
<%--        <table>--%>
<%--            <span align="center">添加电影页面</span>--%>
<%--            <p><br></p>--%>
<%--            <tr>--%>
<%--                <td>movieId：</td>--%>
<%--                <td><input type="text" name="movieId"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>movieName：</td>--%>
<%--                <td><input type="text" name="movieName"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>movieOtherName：</td>--%>
<%--                <td><input type="text" name="movieOtherName"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>movieTime：</td>--%>
<%--                <td><input type="date" name="movieTime"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>moviePicture：</td>--%>
<%--                <td><input type="text" name="moviePicture"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>movieType：</td>--%>
<%--                <td><input type="text" name="movieType"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>movieCountry：</td>--%>
<%--                <td><input type="text" name="movieCountry"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>movieDirector：</td>--%>
<%--                <td><input type="text" name="movieDirector"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>movieLength：</td>--%>
<%--                <td><input type="text" name="movieLength"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td >movieIntroduce：</td>--%>
<%--                <td>--%>
<%--                    <textarea style="width: 172px; height: 500px" name="movieIntroduce"></textarea>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>--%>
<%--                <td><input type="submit" value="添加电影"></td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </form>--%>
<%--</div>--%>