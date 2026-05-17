<%@ page import="com.neu.user.biz.UserBiz" %>
<%@ page import="com.neu.user.biz.impl.UserBizImpl" %>
<%@ page import="com.neu.user.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: wangwei
  Date: 2026/5/11
  Time: 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/js/jquery.js"></script>

  <style type="text/css">
    #main{
      width: 400px;
      height: 500px;
      margin: 0 auto;
    }
  </style>

  <script>
    function updateUser(){
      //通过id获取表单中的数据
      var id=$("#firstid").val();
      //获取用户名：
      var uname=$("#firstname").val();
      //获取密码
      var upwd=$("#firstupwd").val();
      //获取类型
      var type=$("#firsttype").val();
      //将数据传给updateUser.jsp页面.就是一个跳转并传递参数
      location.href="/updateUser.jsp?id="+id+"&uname="+uname+"&upwd="+upwd+"&type="+type;
    }
  </script>
</head>
<body>
<%
  //获取findUser.jsp传的id
  String ids=request.getParameter("id");
  int id=0;
  if(ids != null && !"".equals(ids)){
    id=Integer.parseInt(ids);
  }
  //创建UserBiz的对象
  UserBiz userBiz=new UserBizImpl();
  //调用查询的方法
  User user=userBiz.findByUser(id);
  //将user对象存入作用域中
  request.setAttribute("user",user);
%>

<div id="main">
  <form class="form-horizontal" role="form">

    <div class="form-group">

      <div class="col-sm-10">
        <input type="hidden" class="form-control" id="firstid"
               value="${user.id}" >
      </div>
    </div>

    <div class="form-group">
      <label for="firstname" class="col-sm-2 control-label">姓名</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="firstname"
               value="${user.username}">
      </div>
    </div>

    <div class="form-group">
      <label for="firstupwd" class="col-sm-2 control-label">密码</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="firstupwd"
               value="${user.password}">
      </div>
    </div>

    <div class="form-group">
      <label for="firsttype" class="col-sm-2 control-label">类型</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="firsttype"
               value="${user.type}">
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="button" class="btn btn-default" onclick="updateUser()">提交</button>
      </div>
    </div>
  </form>

</div>
</body>
</html>
