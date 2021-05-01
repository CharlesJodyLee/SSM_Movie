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
    <script  src="layui-v2.6.4/layui/layui.js"></script>
    <script type="text/javascript">
        $(function (){
            hideForm();
            $.ajax({
                url:"student/queryCollectionByStudentId.do",
                type:"post",
                data:{studentId:${studentId}},
                dataType:"json",
                success:function (resp){
                    var studentId = ${studentId};
                    var studentPassword = ${studentPassword};
                    $.each(resp,function (i,n){
                        $.ajax({
                            url:"movie/queryMovieByMovieId.do",
                            type:"post",
                            data:{movieId:n.movieId},
                            dataType:"json",
                            success:function (movie){
                                $("#collectionResult").append(
                                    "<div align='center'>"+
                                        "<a href='pictureJump.jsp?studentId="+studentId+"&studentPassword="+studentPassword+"&movieId="+movie.movieId+"'>"+
                                            "<img width='500px'height='300px' src='"+movie.moviePicture+"'/>"+
                                        "</a>"+
                                        "<h1>"+
                                            movie.movieName+
                                        "</h1>"+
                                    "</div>"

                                );
                            }
                        })
                    });
                }
            });
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

        });
        function hideForm(){
            $("#hideForm1").css('display','none');
            $("#hideForm2").css('display','none');
            $("#hideForm3").css('display','none');
            $("#hideForm4").css('display','none');
        }
    </script>
</head>
<body>
    <%--    导航栏--%>
    <div id="topDiv" align="center">
        <ul class="layui-nav" >
            <li class="layui-nav-item"><a id="a1">主页</a></li>
            <li class="layui-nav-item"><a id="a2">个人中心</a></li>
            <li class="layui-nav-item"><a id="a3" >分类查找</a></li>
            <li class="layui-nav-item layui-this"><a id="a4">个人收藏</a></li>
            <li class="layui-nav-item"><a href="index.jsp">退出</a></li>
        </ul>
    </div>
    <%--    隐藏表单--%>
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
    <div id="collectionResult">
        <div align="center"><h1>${tips}</h1></div>
    </div>
</body>
</html>
