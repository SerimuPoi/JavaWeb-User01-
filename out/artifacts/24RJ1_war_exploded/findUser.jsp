<%@ page import="com.neu.user.biz.UserBiz" %>
<%@ page import="com.neu.user.biz.impl.UserBizImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.neu.user.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: wangwei
  Date: 2026/5/7
  Time: 8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
    function delUser(id){
      if(confirm("是否删除!")){
        location.href="/delUser.jsp?id="+id;
      }
    }

    /*根据id查询User的详情信息*/
    function findByUser(id){
      location.href="/findByUser.jsp?id="+id;
    }
  </script>

  <style type="text/css">
    #main{
      width: 800px;
      height: 600px;
      margin: 0 auto;
    }
  </style>

  <script>
    function addUser(){
      location.href="addUser.jsp"
    }
  </script>
</head>
<body>
<%
  //创建UserBiz的对象
  UserBiz userBiz=new UserBizImpl();
  //调用查询用户信息的方法
  List<User> list=userBiz.findUser();
  //将list存入作用域中
  request.setAttribute("list",list);
%>

<div id="main">
  <div class="addUser">
    <button type="button" class="btn btn-primary" onclick="addUser()">添加用户</button>
  </div>
  <table class="table">
    <caption>用户信息表</caption>
    <thead>
    <tr>
      <th>编号</th>
      <th>用户名</th>
      <th>密码</th>
      <th>类型</th>
      <th>操作</th>
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
          <button type="button" class="btn btn-primary" onclick="delUser(${user.id})">删除</button>
          <button type="button" class="btn btn-primary" onclick="findByUser(${user.id})">修改</button>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
