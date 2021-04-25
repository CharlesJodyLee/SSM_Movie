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
    <script src="layui-v2.6.4/layui/layui.js"></script>
    <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        $(function (){
            hideForm();
            loadFiveHot();
            loadType();
            loadCountry();
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

            $("#sortSearch").click(function (){
                var obj1 = $("#movieType>option:selected");
                var obj2 = $("#movieCountry>option:selected");
                var obj3 = $("#movieTime>option:selected");
                // alert(obj1.val()+" "+obj2.val()+" "+obj3.val())
                $.ajax({
                    url:"movie/queryMovieBySort.do",
                    type:"post",
                    data:{movieType:obj1.val(),movieCountry:obj2.val(),movieTime:obj3.val()},
                    dataType:"json",
                    success:function (resp){
                        var studentId = ${studentId};
                        var studentPassword = ${studentPassword};
                        $("#sortResult").html("");
                        $.each(resp,function (i,n){
                            $("#sortResult").append(
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
                                "</table>"
                            );
                        });
                    }
                });

            })
        })
        function hideForm(){
            $("#hideForm1").css('display','none');
            $("#hideForm2").css('display','none');
            $("#hideForm3").css('display','none');
            $("#hideForm4").css('display','none');

        }
        layui.use('carousel', function(){
            var carousel = layui.carousel;
            //建造实例
            carousel.render({
                elem: '#test1'
                ,width: '50%' //设置容器宽度
                ,height:'250px'
                ,arrow: 'always' //始终显示箭头
                //,anim: 'updown' //切换动画方式
            });
        });
        function loadFiveHot(){
            $.ajax({
                url:"movie/queryFiveHot.do",
                dataType:"json",
                success:function (resp){
                    $.each(resp,function (i,n){
                         //alert("<div><img src='"+ n.moviePicture +"'/></div>")
                        if(i==0){
                            $("#img1").attr("src",n.moviePicture);
                            var href1 = "pictureJump.jsp?studentId="+${studentId}+"&studentPassword="+${studentPassword}+"&movieId="+n.movieId;
                            $("#pic1").attr("href",href1);
                        }
                        if(i==1){
                            $("#img2").attr("src",n.moviePicture);
                            var href2 = "pictureJump.jsp?studentId="+${studentId}+"&studentPassword="+${studentPassword}+"&movieId="+n.movieId;
                            $("#pic2").attr("href",href2);
                        }
                        if(i==2){
                            $("#img3").attr("src",n.moviePicture);
                            var href3 = "pictureJump.jsp?studentId="+${studentId}+"&studentPassword="+${studentPassword}+"&movieId="+n.movieId;
                            $("#pic3").attr("href",href3);
                        }
                        if(i==3){
                            $("#img4").attr("src",n.moviePicture);
                            var href4 = "pictureJump.jsp?studentId="+${studentId}+"&studentPassword="+${studentPassword}+"&movieId="+n.movieId;
                            $("#pic4").attr("href",href4);
                        }
                        if(i==4){
                            $("#img5").attr("src",n.moviePicture);
                            var href5 = "pictureJump.jsp?studentId="+${studentId}+"&studentPassword="+${studentPassword}+"&movieId="+n.movieId;
                            $("#pic5").attr("href",href5);
                        }
                    });
                }
            })
        }
        function loadType(){
            $.ajax({
                url:"movie/queryAllMovieType.do",
                dataType:"json",
                success:function (type){
                    $.each(type,function (i,n){
                        $("#movieType").append(
                            "<option>"+n.movieType+"</option>"
                        )
                    });
                }
            })
        }
        function loadCountry(){
            $.ajax({
                url:"movie/queryAllMovieCountry.do",
                dataType:"json",
                success:function (country){
                    $.each(country,function (i,n){
                        $("#movieCountry").append(
                            "<option>"+n.movieCountry+"</option>"
                        )
                    });
                }
            })
        }


    </script>

</head>
<body class="layui-bg-orange">
<%--    导航栏--%>
    <div id="topDiv" align="center">
        <ul class="layui-nav" >
            <li class="layui-nav-item"><a id="a1">主页</a></li>
            <li class="layui-nav-item"><a id="a2">个人中心</a></li>
            <li class="layui-nav-item layui-this"><a id="a3" >分类查找</a></li>
            <li class="layui-nav-item"><a id="a4">个人收藏</a></li>
            <li class="layui-nav-item"><a href="index.jsp">退出</a></li>
        </ul>
    </div>
<%--    隐藏表单--%>
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
<%--    轮播图和标题--%>
    <div id="PersonMessage">
        <br>
        <div align="center"><h1>分类查找页</h1></div>
        <br>
    </div>
    <div class="layui-carousel layui-col-md12 layui-col-md-offset3" id="test1" >
        <div id="lunbo" carousel-item>
            <div>><a id="pic1" href="pictureJump.jsp"><img id="img1" src="images/1.jpg" width="800px"></a></div>
            <div><a id="pic2" href="pictureJump.jsp"><img id="img2" src="images/1.jpg" width="800px"></a></div>
            <div><a id="pic3" href="pictureJump.jsp"><img id="img3" src="images/1.jpg" width="800px"></a></div>
            <div><a id="pic4" href="pictureJump.jsp"><img id="img4" src="images/1.jpg" width="800px"></a></div>
            <div><a id="pic5" href="pictureJump.jsp"><img id="img5" src="images/1.jpg" width="800px"></a></div>
        </div>
    </div>
<%--    选择框--%>
    <div class="layui-col-md12 layui-col-md-offset3">
        <select id="movieType" class="layui-form-label" style="width:155px;" >
            <option value="null">请选择影片类型</option>
        </select>
        <select id="movieCountry" class="layui-form-label" style="width:155px;" >
            <option value="null">请选择影片国家</option>
        </select>
        <select id="movieTime" class="layui-form-label" style="width:155px;" >
            <option value="null">请选择影片时间</option>
            <option value="2021">2021</option>
            <option value="2020">2020</option
            <option value="2019">2019</option>
            <option value="2018">2018</option>
            <option value="2017">2017</option>
            <option value="2016">2016</option>
            <option value="2015">2015</option>
            <option value="2014">2014</option>
            <option value="2013">2013</option>
            <option value="2012">2012</option>
            <option value="2011">2011</option>
            <option value="2010">2010</option>
            <option value="2009">2009</option>
            <option value="2008">2008</option>
            <option value="2007">2007</option>
            <option value="2006">2006</option>
            <option value="2005">2005</option>
            <option value="2004">2004</option>
            <option value="2003">2003</option>
            <option value="2002">2002</option>
            <option value="2001">2001</option>
            <option value="2000">2000</option>
            <option value="1999">1999</option>
        </select>
        <button id="sortSearch" class="layui-btn">搜素</button>
    </div>
    <div id="sortResult" align="center">

    </div>


</body>
</html>

