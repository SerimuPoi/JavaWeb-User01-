<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.neu.user.biz.UserBiz" %>
<%@ page import="com.neu.user.biz.impl.UserBizImpl" %>
<%@ page import="com.neu.user.entity.User" %>
<%
    // 1. 设置编码，防止中文乱码提交到数据库
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    // 2. 获取从 findUser.jsp 传过来的用户 id
    String idStr = request.getParameter("id");
    int id = 0;
    if (idStr != null && !"".equals(idStr)) {
        id = Integer.parseInt(idStr);
    }

    UserBiz userBiz = new UserBizImpl();

    // 增加一个标记位，记录是否修改失败
    boolean updateFailed = false;

    // 3. 判断是否是点击了“确认修改”提交过来的请求
    String action = request.getParameter("action");
    if ("update".equals(action)) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int type = Integer.parseInt(request.getParameter("type"));

        User updateUser = new User(id, username, password, type);
        int count = userBiz.updateUser(updateUser);

        if (count > 0) {
            response.sendRedirect("findUser.jsp");
            return;
        } else {
            // 修改失败时，将标记设为 true
            updateFailed = true;
        }
    }

    // 4. 初次进入页面：根据 id 查询出当前用户的详细信息
    User user = userBiz.findUserById(id);
%>

<%-- 在 Java 脚本块外部，直接使用 if 判断来展示 HTML/JS 弹窗 --%>
<% if (updateFailed) { %>
<script>alert('修改失败！');</script>
<% } %>
<html>
<head>
    <title>修改用户信息</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* 稍微加一点顶部边距，让表格居中好看些 */
        .container { margin-top: 50px; }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">修改用户信息</h3>
                </div>
                <div class="panel-body">
                    <form action="updateUser.jsp?id=<%=id%>&action=update" method="post">
                        <div class="form-group">
                            <label>编号 (不可修改):</label>
                            <input type="text" class="form-control" name="id" value="<%=user != null ? user.getId() : ""%>" readonly>
                        </div>
                        <div class="form-group">
                            <label>名字:</label>
                            <input type="text" class="form-control" name="username" value="<%=user != null ? user.getUsername() : ""%>" required>
                        </div>
                        <div class="form-group">
                            <label>密码:</label>
                            <input type="text" class="form-control" name="password" value="<%=user != null ? user.getPassword() : ""%>" required>
                        </div>
                        <div class="form-group">
                            <label>类型:</label>
                            <input type="number" class="form-control" name="type" value="<%=user != null ? user.getType() : ""%>" required>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-success">确认修改</button>
                            <a href="findUser.jsp" class="btn btn-default">返回列表</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>