package com.neu.user.dao;

import com.neu.user.entity.User;

import java.util.List;

public interface UserDao {
    public List<User> findUser();

    public int deleteUser(int id);
    //根据id查询User的信息
    public User findUserById(int id);
    //修改数据
    public int updateUser(User user);

    User findByUser(int id);

    //添加
    public int addUser(User user);
}
