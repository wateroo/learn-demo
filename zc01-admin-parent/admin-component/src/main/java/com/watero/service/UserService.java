package com.watero.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.watero.entity.User;

public interface UserService {
    List<User> queryUserList();

    User login(String userId, String password);

    PageInfo<User> getUserListPageInfo(User user, int pageNum, int pageSize);

    User loadUserByUsername(String username);
}
