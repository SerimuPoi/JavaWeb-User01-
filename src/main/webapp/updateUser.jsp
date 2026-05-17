<%@ page import="com.neu.user.biz.UserBiz" %>
<%@ page import="com.neu.user.biz.impl.UserBizImpl" %>
<%@ page import="com.neu.user.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 11/5/2026
  Time: 上午8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    //获取传过来的参数，写入数据库
    int id = Integer.parseInt(request.getParameter("id"));
    String uname = request.getParameter("uname");
    String upwd = request.getParameter("upwd");
    int type = Integer.parseInt(request.getParameter("type"));
    //将获取的最新数据给User重新赋值
    User user = new User(id, uname, upwd, type);
    UserBiz userBiz = new UserBizImpl();

    //调用修改的方法
   int count = userBiz.updateUser(user);
   if (count>0){
       //修改完成后跳转到查询页面
       response.sendRedirect("findUser.jsp");
   }
%>
</body>
</html>
