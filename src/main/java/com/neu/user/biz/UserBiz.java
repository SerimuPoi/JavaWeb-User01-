package com.neu.user.biz;

import com.neu.user.entity.User;

import java.util.List;

public interface UserBiz {
    public List<User> findUsers();

    public int delUser(int id);

    List<User> findUser();
    public User findUserById(int id);

    public int updateUser(User user);

    User findByUser(int id);

    public int addUser(User user);
}
