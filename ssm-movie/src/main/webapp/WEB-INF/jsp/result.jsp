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

  </head>
  <body>
  result.jsp结果页面，结果为:<br>
  ${tips}<br>
  <input type="button" value="返回登录" onclick ="location.href='loginStudent.jsp'"><br>
  <input type="button" value="返回注册" onclick ="location.href='addStudent.jsp'"><br>
  <input type="button" value="返回主页" onclick ="location.href='index.jsp'"><br>



  </body>
</html>
