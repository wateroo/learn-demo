package com.watero.service.impl;

import cn.hutool.Hutool;
import cn.hutool.crypto.digest.DigestAlgorithm;
import cn.hutool.crypto.digest.Digester;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.watero.entity.User;
import com.watero.entity.UserExample;
import com.watero.exception.LoginFailedException;
import com.watero.mapper.UserMapper;
import com.watero.service.UserService;
import com.watero.util.CommonConfigConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> queryUserList() {
        return userMapper.selectByExample(new UserExample());
    }

    @Override
    public User login(String userId, String password) {
        if (userId == null || "".equals(userId)) {
            throw new LoginFailedException(CommonConfigConstant.MESSAGE_LOGIN_USERID_NOTNULL);
        }
        if (password == null || "".equals(password)) {
            throw new LoginFailedException(CommonConfigConstant.MESSAGE_LOGIN_PASSWORD_NOTNULL);
        }
        UserExample userExample = new UserExample();
        UserExample.Criteria userExampleCriteria = userExample.createCriteria();
        userExampleCriteria.andUserIdEqualTo(userId);
        List<User> users = userMapper.selectByExample(userExample);
        if (users.size() == 0 || users.get(0) == null) {
            throw new LoginFailedException(CommonConfigConstant.MESSAGE_LOGIN_USER_ISNULL);
        }
        User user = users.get(0);
        Digester md5 = new Digester(DigestAlgorithm.MD5);
        String digestHex = md5.digestHex(password);
        if (!user.getPassword().equals(digestHex)) {
            throw new LoginFailedException(CommonConfigConstant.MESSAGE_LOGIN_INFO_ERROR);
        }
        return user;
    }

    @Override
    public PageInfo<User> getUserListPageInfo(User user, int pageNum, int pageSize) {
        // 开启分页
        PageHelper.startPage(pageNum, pageSize);
        List<User> list = userMapper.getUserListPageInfo(user);
        PageInfo<User> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }
}
