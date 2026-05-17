<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 13/5/2026
  Time: 下午6:16
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

    <script type="text/javascript">
        function addUser(){
            //通过id获取表单中的数据
            var id=$("#firstid").val();
            //获取用户名：
            var uname=$("#firstname").val();
            //获取密码
            var upwd=$("#firstupwd").val();
            //获取类型
            var type=$("#firsttype").val();
            //将数据传给updateUser.jsp页面.就是一个跳转并传递参数
            location.href="/quAddUser.jsp?id="+id+"&uname="+uname+"&upwd="+upwd+"&type="+type;
        }

    </script>
</head>
<body>
    //添加用户信息
    <div id="main">
        <form class="form-horizontal" role="form">

            <div class="form-group">
                <label for="firstid" class="col-sm-2 control-label">编号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="firstid">
                </div>
            </div>

            <div class="form-group">
                <label for="firstname" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="firstname">
                </div>
            </div>

            <div class="form-group">
                <label for="firstupwd" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="firstupwd">
                </div>
            </div>

            <div class="form-group">
                <label for="firsttype" class="col-sm-2 control-label">类型</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="firsttype">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" onclick="addUser()">提交</button>
                </div>
            </div>
        </form>

    </div>
</body>
</html>
