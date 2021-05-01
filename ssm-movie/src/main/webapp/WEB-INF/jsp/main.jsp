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
            loadNew();
            loadHot();
            loadAll();
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
        function mytime(){
            var a = new Date();
            var b = a.toLocaleTimeString();
            var c = a.toLocaleDateString();
            document.getElementById("time").innerHTML = c+"&nbsp"+b;
        }
        setInterval(function() {mytime()});
        function loadNew(){
            $.ajax({
                url:"movie/queryAllMovie.do",
                dataType:"json",
                success:function (resp){
                       // 查询最新的值
                    $.ajax({
                        url:"movie/queryNew.do",
                        dataType:"json",
                        success:function (hot){
                            var maxNew = 0 ;
                            maxNew = hot;
                            //加载最新电影的图片，更新到页面
                            var studentId = ${studentId};
                            var studentPassword = ${studentPassword};
                            $.each(resp,function (i,n){
                                if(n.isNew == maxNew){
                                    $("#NewHotMovie").append(
                                        "<table>"+
                                            "<tr>"+
                                                "<td>"+
                                                    "<a href='pictureJump.jsp?studentId="+studentId+"&studentPassword="+studentPassword+"&movieId="+n.movieId+"'> <img width='500px'height='300px' src='"+n.moviePicture+"'/></a>"+
                                                "</td>"+
                                                "<td>"+
                                                    "<p align='center'><h1 align='center'>新鲜度第1</h1></p>"+
                                                    "<p align='center'>"+ n.movieName +"</p>"+
                                                    "<p align='center'>"+ n.movieDirector +" </p>"+
                                                    "<p align='center'>"+ n.movieTime +"</p>"+
                                                    "<p align='center'style='width:700px; height:20px;'>"+ n.movieIntroduce +" </p>"+
                                                "</td>"+
                                            "</tr>"+
                                        "</table>");
                                }
                            })
                        }
                    })
                }
            })
        }
        function loadHot(){
            var maxHot = 0 ;
            $.ajax({
                url:"movie/queryAllMovie.do",
                dataType:"json",
                success:function (resp){
                    //查询最新的值
                    $.ajax({
                        url:"movie/queryHot.do",
                        dataType:"json",
                        success:function (hot){
                            maxHot = hot;
                            //加载最新电影的图片，更新到页面
                            $.each(resp,function (i,n){
                                if(n.isHot == maxHot){
                                    var studentId = ${studentId};
                                    var studentPassword = ${studentPassword};
                                    $("#NewHotMovie").append(
                                        "<table>"+
                                            "<tr>"+
                                                "<td>"+
                                                    "<a href='pictureJump.jsp?studentId="+studentId+"&studentPassword="+studentPassword+"&movieId="+n.movieId+"'> <img width='500px'height='300px' src='"+n.moviePicture+"'/></a>"+
                                                "</td>"+
                                                "<td>"+
                                                    "<p align='center'><h1 align='center'>"+ "热度第1"+"</h1></p>"+
                                                    "<p align='center'>"+ n.movieName +"</p>"+
                                                    "<p align='center'>"+ n.movieDirector +" </p>"+
                                                    "<p align='center'>"+ n.movieTime +"</p>"+
                                                    "<p align='center'style='width:700px; height:20px;'>"+ n.movieIntroduce +" </p>"+
                                                "</td>"+
                                            "</tr>"+
                                        "</table>");
                                }
                            })
                        }
                    })
                }
            })
        }
        function loadAll(){
            $.ajax({
                url:"movie/queryMovieOrderByMovieTimeDesc.do",
                dataType:"json",
                success:function (resp){
                    //加载最新电影的图片，更新到页面
                    var studentId = ${studentId};
                    var studentPassword = ${studentPassword};
                    $.each(resp,function (i,n){
                            $("#AllMovie").append(
                                "<table>"+
                                    "<tr>"+
                                        "<td>"+
                                            "<a href='pictureJump.jsp?studentId="+studentId+"&studentPassword="+studentPassword+"&movieId="+n.movieId+"'> <img width='500px'height='300px' src='"+n.moviePicture+"'/></a>"+
                                        "</td>"+
                                        "<td>"+
                                            "<p align='center'>"+ n.movieName +"</p>"+
                                            "<p align='center'>"+ n.movieDirector +" </p>"+
                                            "<p align='center'>"+ n.movieTime +"</p>"+
                                            "<p align='center'style='width:700px; height:20px;'>"+ n.movieIntroduce +"</p>"+
                                        "</td>"+
                                    "</tr>"+
                                "</table>");

                    })
                }
            })
        }
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function(){
            var element = layui.element;
        });
        //隐藏表单
        function hideForm(){
            $("#hideForm1").css('display','none');
            $("#hideForm2").css('display','none');
            $("#hideForm3").css('display','none');
            $("#hideForm4").css('display','none');
        }
    </script>
</head>
<body>
    <div id="topDiv" align="center">
        <ul class="layui-nav" >
            <li class="layui-nav-item layui-this" ><a id="a1">主页</a></li>
            <li class="layui-nav-item"><a id="a2">个人中心</a></li>
            <li class="layui-nav-item"><a id="a3" >分类查找</a></li>
            <li class="layui-nav-item"><a id="a4">个人收藏</a></li>
            <li class="layui-nav-item"><a href="index.jsp">退出</a></li>
        </ul>
    </div>
    <form id="hideForm1" action="student/loginStudent.do"  method="post">
        <input type="hidden" name="id" value="${studentId}">
        <input type="hidden" name="password" value="${studentPassword}">
        <input type="hidden" name="name" value="${studentName}">
        <input type="submit" value="提交" style="display:none;">
    </form>
    <form id="hideForm2" action="student/studentCenter.do"  method="post">
        <input type="hidden" name="id" value="${studentId}">
        <input type="hidden" name="password" value="${studentPassword}">
        <input type="hidden" name="name" value="${studentName}">
        <input type="submit" value="提交" style="display:none;">
    </form>
    <form id="hideForm3" action="student/ClassifiedSearch.do"  method="post">
        <input type="hidden" name="id" value="${studentId}">
        <input type="hidden" name="password" value="${studentPassword}">
        <input type="hidden" name="name" value="${studentName}">
        <input type="submit" value="提交" style="display:none;">
    </form>
    <form id="hideForm4" action="student/CollectionPage.do"  method="post">
        <input type="hidden" name="id" value="${studentId}">
        <input type="hidden" name="password" value="${studentPassword}">
        <input type="hidden" name="name" value="${studentName}">
        <input type="submit" value="提交" style="display:none;">
    </form>


    <div class="layui-bg-green">
        <h1 align="center">HELLO MAIN</h1><br>
        <div align="left">当前用户:${studentId} ${studentName}
            <label id="time" style="color: #FFB800; "></label>
        </div>

        <div align="center">
            <form method="post" action="movie/queryOneMovieByName.do">
                <input type="hidden" name="studentId" value=${studentId} />
                <input type="hidden" name="studentPassword" value=${studentPassword} />
                <input type="text" name="movieName"/>
                <input type="submit"  value="搜索电影" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm"/>
            </form>
        </div>
        <div id="NewHotMovie" align="center">
    <%--        自动加载最新和最热电影的图片--%>
        </div>
        <div align="center">
            <h1>
                <b>全部影片</b>
            </h1>
        </div>
        <div id="AllMovie" align="center">
        </div>

    </div>

</body>
</html>
