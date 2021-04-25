<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String basePath = request.getScheme() + "://" +
          request.getServerName() + ":" + request.getServerPort() +
          request.getContextPath() + "/";
%>
<html>
  <head>
    <title>Result</title>
    <base href="<%=basePath%>" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="layui-v2.6.4/layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
    <script  src="layui-v2.6.4/layui/layui.js"></script>
    <script type="text/javascript">
      $(function (){
        //查询传入的id和password是否匹配
        $.ajax({
          url:"student/queryStudent.do",
          dataType:"json",
          success:function (data){
            var studentId =${param.studentId};
            var studentPassword =${param.studentPassword};
            var movieId = ${param.movieId};
            //判断用户是否有权力进入该页面，因为涉及到评论功能
            $.each(data,function (i,n) {
              if (n.id == studentId && n.password == studentPassword) {
                //加载该电影基础信息
                $.ajax({
                  url: "movie/queryAllMovie.do",
                  dataType: "json",
                  success: function (resp) {
                    //查找电影id，并更新选中的电影信息到页面
                    $.each(resp, function (i, n) {
                      if (n.movieId == movieId) {
                        var movieIntroduce = n.movieIntroduce;
                        $("#movieMessage").append(
                                "<div align='center'>" +
                                  "<div>" +
                                    "<h6>id编号:" + n.movieId + "</h6>" +
                                  "</div>" +
                                  "<div>" +
                                    "<h1>片名:" + n.movieName + "</h1>" +
                                  "</div>" +
                                  "<div>" +
                                    "<h2>别名:" + n.movieOtherName + "</h2>" +
                                  "</div>" +
                                  "<div>" +
                                    "<h2>上映时间:" + n.movieTime + "</h2>" +
                                  "</div>" +
                                  "<div>" +
                                    "<h3>海报</h3>" +
                                    "<img src='" + n.moviePicture + "'/>" +
                                  "</div>" +
                                  "<div>" +
                                    "<h3>类型:" + n.movieType + "</h3>" +
                                  "</div>" +
                                  "<div>" +
                                    "<h3>热度:" + n.isHot + "</h3>" +
                                  "</div>" +
                                  "<div>" +
                                    "<h3>新鲜度:" + n.isNew + "</h3>" +
                                  "</div>" +
                                  "<div>" +
                                    "<h3>国家:" + n.movieCountry + "</h3>" +
                                  "</div>" +
                                  "<div>" +
                                    "<h3>导演:" + n.movieDirector + "</h3>" +
                                  "</div>" +
                                  "<div>" +
                                    "<h3>片长:" + n.movieLength + "分钟</h3>" +
                                  "</div>" +
                                "</div>");
                        $("#jianjie").append(
                                "<p>"+movieIntroduce+
                                "</p>");
                      }
                    })
                  }
                });
                // 加载该电影的评论
                $.ajax({
                  url: "movie/queryAllCommentByMovieId.do",
                  data: {movieId: movieId},
                  dataType: "json",
                  success: function (resp2) {
                    //返回的是所有该电影的评论List，逐条将评论更新到页面
                    $.each(resp2,function (i,n){
                      $("#comment").append(
                        "<tr align='center'>"+
                          "<td align='center'>"+n.commentId+"</td>"+
                          "<td align='center'>"+n.studentId+"</td>"+
                          "<td align='center'>"+n.commentTime+"</td>"+
                          "<td align='center'>"+n.commentContent+"</td>"+
                        "</tr>");
                    })
                  }
                });
                //查询收藏，若已收藏则变实心
                $.ajax({
                  url: "movie/queryCollectionYesOrNotByStudentId.do",
                  data: {movieId:movieId,studentId:studentId},
                  dataType: "text",
                  success: function (resp3) {
                    if(resp3==0){
                      $("#heart").attr("class","layui-icon &#xe68c layui-icon-heart-fill")
                    }
                  }
                })
              }
            })
          }
        })
        $("#heart").click(function (){
          var flag = $("#heart").attr("class");
          if(flag !="layui-icon &#xe68c layui-icon-heart-fill"){
            $.ajax({
              url:"movie/addCollection.do",
              data:{movieId:${param.movieId},studentId:${param.studentId}},
              dataType:"text",
              success:function (resp){
                //返回无所谓，重点是要成功增加收藏后，把爱心变实心
                if(resp==1){
                  $("#heart").attr("class","layui-icon &#xe68c layui-icon-heart-fill")
                  layer.msg('添加收藏成功！');
                }else{
                  layer.msg('添加收藏失败！');
                }
              }
            })
          }else{
            $.ajax({
              url:"movie/subCollection.do",
              data:{movieId:${param.movieId},studentId:${param.studentId}},
              dataType:"text",
              success:function (resp){
                if (resp==0){
                  $("#heart").attr("class","layui-icon &#xe68c layui-icon-heart")
                  layer.msg('取消收藏成功！');
                }else{
                  layer.msg('取消收藏失败！');
                }
              }
            })
          }
        })
      })

      layui.use('element', function(){
        var element = layui.element;
      });
      function mytime(){
        var a = new Date();
        var time = a.getFullYear() + '-' + (a.getMonth() + 1) + '-' + a.getDate()+ ' ' + a.getHours() + ':' + a.getMinutes() + ':' + a.getSeconds();
        $("#inputTime").val(time);
      }
      setInterval(function() {mytime()});
    </script>
  </head>
  <body>
  <div id="timeTable">
    <h3><label id="time" style="color: #ac2925; "></label></h3>
  </div>
  <div id="movieMessage">

  </div>
  <div id="topIntroduce" >
    <div class="layui-collapse">
      <div class="layui-colla-item">
        <h2 class="layui-colla-title">简介</h2>
        <div id="jianjie" class="layui-colla-content layui-show"></div>
      </div>
    </div>
  </div>
  <div id="collection" align="center">
    <i id="heart" class="layui-icon &#xe68c layui-icon-heart" style="font-size: 50px; "></i><h3>&nbsp;收藏电影</h3>
  </div>
  <div id="commentForm" class="layui-col-md12 layui-col-md-offset5">
    <form action="movie/addComment.do" >
      <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline">
          <input type="hidden" name="movieId" required  lay-verify="required" value="${param.movieId}"  placeholder="用户权力不能修改" autocomplete="off" class="layui-input" readonly>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline">
          <input type="hidden" name="studentId" required  lay-verify="required" value="${param.studentId}"  placeholder="用户权力不能修改" autocomplete="off" class="layui-input" readonly>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">系统时间</label>
        <div class="layui-input-inline">
          <input id="inputTime" type="text" name="commentTime" required  lay-verify="required" placeholder="系统时间不能修改" autocomplete="off" class="layui-input" readonly>
        </div>
      </div>
      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">评论</label>
        <div class="layui-input-inline">
          <textarea name="commentContent" required placeholder="请输入评论内容" class="layui-textarea"></textarea>
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="formDemo">提交评论</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
    </form>
  </div>
  <div id="midComment">
    <div align="center">
    <table class="layui-table">
      <colgroup>
        <col width="150">
        <col width="150">
        <col width="200">
        <col width="300">
        </colgroup>
      <thead>
      <tr align="center">
        <td>评论id</td>
        <td>用户id</td>
        <td>评论时间</td>
        <td>评论内容</td>
        </tr>
      </thead>
      <tbody id="comment">

      </tbody>
      </table>
    </div>
  </div>

  </body>
</html>
