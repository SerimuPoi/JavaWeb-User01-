<%@ page import="com.neu.user.biz.UserBiz" %>
<%@ page import="com.neu.user.biz.impl.UserBizImpl" %>
<%@ page import="com.neu.user.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 17/5/2026
  Time: 上午8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String uname = request.getParameter("uname");
    String upwd = request.getParameter("upwd");
    int type = Integer.parseInt(request.getParameter("type"));

    UserBiz userbiz = new UserBizImpl();

    User user = new User(id,uname,upwd,type);
    int count = userbiz.addUser(user);
    if (count>0){
        request.getRequestDispatcher("findUser.jsp").forward(request,response);
    }
%>
</body>

</html>
