package com.neu.user.dao.impl;

import com.neu.user.dao.UserDao;
import com.neu.user.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDaoimpl implements UserDao {

    @Override
    public List<User> findUser() {
        // 创建存储User类型的集合
        List<User> list = new ArrayList<User>();

        try {
            // 1.加载数据库驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 2.创建数据库连接
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC","root","root");
            // 3.编写查询所有用户信息的sql语句
            String sql = "select * from user1";
            // 4.创建statement接口对象，加载sql语句
            Statement st = conn.createStatement();
            // 5.加载sql语句并返回结果集
            ResultSet rs = st.executeQuery(sql);

            // 6.循环结果集中的数据
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                list.add(user);
            }

            // 建议：实际开发中记得在这里关闭 rs, st, conn 以释放资源
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int deleteUser(int id) {
        int count = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC","root","root");

            // 【修复】：补充了实际的删除逻辑
            Statement st = conn.createStatement();
            String sql = "delete from user1 where id=" + id;
            count = st.executeUpdate(sql); // 执行删除并返回影响的行数

            st.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public User findUserById(int id) {
        User user = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC","root","root");

            Statement st = conn.createStatement();
            String sql = "select * from user1 where id=" + id;
            ResultSet rs = st.executeQuery(sql);

            if (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // 【修复】：补充实现接口中缺失的方法
    @Override
    public User findByUser(int id) {
        // 由于这个方法和 findUserById 功能完全重复，
        // 为了满足接口要求并减少代码冗余，我们直接复用 findUserById 的逻辑即可。
        return findUserById(id);
    }

    @Override
    public int updateUser(User user) {
        int count=0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useUnicode=true&characterEncoding=utf-8",
                    "root","root");
            Statement st=conn.createStatement();
            String sql="update user1 set uname='"+user.getUsername()+"',upwd='"+user.getPassword()+"',type="+user.getType()+" where id="+user.getId()+"";
            //加载sql语句
            count=st.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public int addUser(User user) {
        int count=0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useUnicode=true&characterEncoding=utf-8",
                    "root","root");
            Statement st=conn.createStatement();

            String sql ="insert into user1(id,uname,upwd,type)"+
                    "values("+user.getId()+",'"+user.getUsername()+"','"+user.getPassword()+"',"+user.getType()+")";

            count=st.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
//@Override
//public int updateUser(User user) {
//    int count = 0;
//    Connection conn = null;
//    PreparedStatement ps = null;
//    try {
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC","root","root");
//
//        // 这里的列名必须和数据库中一模一样：name 和 upwd
//        String sql = "update user1 set name=?, upwd=?, type=? where id=?";
//        ps = conn.prepareStatement(sql);
//
//        // 从实体类中获取数据，按顺序填入上面的问号中
//        ps.setString(1, user.getUsername());
//        ps.setString(2, user.getPassword());
//        ps.setInt(3, Integer.parseInt(user.getType()));
//        ps.setInt(4, user.getId());
//
//        count = ps.executeUpdate();
//
//    } catch (Exception e) {
//        e.printStackTrace();
//    } finally {
//        try {
//            if (ps != null) ps.close();
//            if (conn != null) conn.close();
//        } catch (Exception e) {}
//    }
//
//    return count;
//}
}