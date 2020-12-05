package com.watero.service;

import java.util.List;

import com.watero.entity.User;

public interface UserService {
    List<User> queryUserList();

    User login(String userId, String password);
}
