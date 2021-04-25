<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>查询学生ajax</title>
    <base href="<%=basePath%>" />
    <script type="text/javascript" src="js/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="layui-v2.6.4/layui/css/layui.css">
    <script type="text/javascript">
        $(function (){
            loadStudentData();
            $("#btnload").click(function (){
                loadStudentData();
            })
        })

        function loadStudentData(){
            $.ajax({
                url:"student/queryStudent.do",
                type:"get",
                dataType:"json",
                success: function (resp){
                    $("#info").html("");
                    $.each(resp,function (i,n){
                        $("#info").append("<tr align='center'>")
                            .append("<td align='center'>" +n.id+   "</td>")
                            .append("<td align='center'>" +n.name+ "</td>")
                            .append("<td align='center'>" +n.age+  "</td>")
                            .append("</tr>")
                    })
                }
            })
        }
    </script>

</head>
<body>
    <div align="center">
        <table class="layui-table"  >
            <colgroup>
                <col width="100">
                <col width="100">
                <col width="100">
            </colgroup>
            <thead>
            <tr align="center" ><h3>查询所有用户</h3></tr><br>
            <input align="center" type="button" class="layui-btn layui-btn-warm" id="btnload"  value="查询数据"/>

            <tr>
                <td align="center">学号</td>
                <td align="center">姓名</td>
                <td align="center">年龄</td>
            </tr>
            </thead>
            <tbody id="info">

            </tbody>
        </table>

    </div>
</body>
</html>
