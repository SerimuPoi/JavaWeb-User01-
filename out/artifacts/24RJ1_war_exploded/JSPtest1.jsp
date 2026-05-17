<%@ page import="java.util.Date" %>
<%@ page import="com.neu.user.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.jws.soap.SOAPBinding" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 29/4/2026
  Time: 下午5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>JSPtest1</title>
    <style type="text/css">
      .lisi{
        font-size: 40px;
        color: coral;
      }
    </style>
</head>
<body>

  <%
    Date date = new Date();
    User zhangsan = new User(1,"张三","123","1");
    User lisi = new User(2,"李四","1234","2");
    User wangwu = new User(3,"王五","12345","3");
    List<User> list = new ArrayList<User>();
    list.add(zhangsan);
    list.add(lisi);
    list.add(wangwu);
    request.setAttribute("list",list);//将list存入作用域中
      request.setAttribute("date1", date);

  %>

  <%=date%>
  <%=zhangsan.getUsername()%>
<br/>
  <p class = "lisi">
    <%=lisi.getUsername()%>
  </p>

<%--<div class = "login">--%>
<%--    <jsp:include flush="false" page="login.jsp"></jsp:include>--%>
<%--</div>--%>

  
<%--获取request中的数据--%>
<%
    Date date1 = (Date) request.getAttribute("date1");
%>

<%=date1%>

<table>
    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>类型</td>
    </tr>

    <c:forEach items = "${list}" var="user">

        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.password}</td>
            <td>${user.type}</td>
        </tr>
    </c:forEach>

    <div>姓名:${zhangsan.uname}</div>
</table>
</body>
</html>
