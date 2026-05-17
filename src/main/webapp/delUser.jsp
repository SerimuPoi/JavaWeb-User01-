<%@ page import="java.util.List" %>
<%@ page import="com.neu.user.entity.User" %>
<%@ page import="com.neu.user.biz.UserBiz" %>
<%@ page import="com.neu.user.biz.impl.UserBizImpl" %><%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 7/5/2026
  Time: 上午10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
    // 获取 delUser 的 id
    String ids = request.getParameter("id");
    int id = 0;
    UserBiz userBiz = new UserBizImpl();

    // 1. 修复字符串比较的漏洞
    if (ids != null && !"".equals(ids)){
        id = Integer.parseInt(ids);
        // 执行删除操作
        int count = userBiz.delUser(id);
    }

    // 2. 将查询动作移到外面，并统一使用 findUsers() 方法
    List<User> list = userBiz.findUsers();
    request.setAttribute("list", list);
%>
<div id="main">
    <table class="table">
        <caption>User</caption>
        <thead>
        <tr>
            <th>编号</th>
            <th>名字</th>
            <th>密码</th>
            <th>类型</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="user">
            <tr class="active">
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.type}</td>
                <td>
                    <button type="button" class="btn btn-primary"onclick="delUser($(user.id))" >删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
  <%=id%>
</body>
</html>
