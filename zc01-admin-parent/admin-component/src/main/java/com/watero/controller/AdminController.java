package com.watero.controller;

import cn.hutool.crypto.SecureUtil;
import com.watero.entity.User;
import com.watero.service.UserService;
import com.watero.util.CommonConfigConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 后台登录控制器
 */
@RequestMapping("/admin")
@Controller
public class AdminController {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    UserService userService;

    /**
     * 用户登录
     *
     * @param loginAcct    登陆账户
     * @param userPassword 登陆密码
     * @param request      HttpServletRequest对象
     * @return  主页视图
     */
    @PostMapping("/login")
    public String login(@RequestParam(value = "loginAcct") String loginAcct,
                        @RequestParam(value = "userPassword") String userPassword, HttpServletRequest request) {
        logger.info("loginAcct={},userPassword={}", loginAcct, userPassword);
        User loginUser = userService.login(loginAcct, userPassword);
        HttpSession session = request.getSession();
        session.setAttribute(CommonConfigConstant.ATTR_LOGIN_USER, loginUser);
        return "redirect:/main.html";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        logger.info("注销用户 ：{}", request.getSession().getAttribute(CommonConfigConstant.ATTR_LOGIN_USER));
        if (request.getSession() != null) {
            request.getSession().invalidate();
        }
        return "redirect:/index.html";
    }


    public static void main(String[] args) {
        System.out.println(SecureUtil.md5("123"));
    }

}
