package com.watero.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.watero.exception.AccessForbiddenException;
import com.watero.exception.LoginFailedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.watero.util.CommonConfigConstant;
import com.watero.util.ResultEntity;

@ControllerAdvice
public class CustomExceptionHandler {

    Logger logger = LoggerFactory.getLogger(getClass());


    /**
     * 处理登陆失败的异常
     *
     * @param handler  controller对象
     * @param ex       异常对象
     * @param request  请求对象
     * @param response 响应对象
     * @return 返回ModelAndView
     * @throws IOException 异常
     */
    @ExceptionHandler(value = {LoginFailedException.class, AccessForbiddenException.class})
    public ModelAndView resolveLoginFailedException(Object handler, LoginFailedException ex, HttpServletRequest request,
                                                    HttpServletResponse response) throws IOException {
        logger.debug("Controller异常处理 : {} ", handler.getClass());
        Throwable exception = parseException(ex);
        String viewName = "admin/admin-login";
        return handle(viewName, exception, request, response);
    }


    @ExceptionHandler
    public ModelAndView resolveException(Exception ex, HttpServletRequest request,
                                         HttpServletResponse response) throws IOException {
        Throwable exception = parseException(ex);
        String viewName = "system-error";
        return handle(viewName, exception, request, response);
    }

    /**
     * 处理异常的公共部分
     *
     * @param viewName 对应的错误视图名称
     * @param ex       异常对象
     * @param request  HttpServletRequest 请求对象
     * @param response HttpServletRequest 响应对象
     * @return 根据请求类型返回 AJAX: JSON    普通请求：ModelAndView
     * @throws IOException 异常
     */
    private ModelAndView handle(String viewName, Throwable ex, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        if (isAjax(request)) {
            ResultEntity<Object> re = ResultEntity.faliledWithData(ex.getMessage());
            Gson gson = new Gson();
            response.setContentType("application/json");
            response.getWriter().write(gson.toJson(re));
            return null;
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName(viewName);
        mv.addObject(CommonConfigConstant.ATTR_NAME_EXCEPTION, ex);
        return mv;
    }

    /**
     * 判断是否是AJAX请求
     *
     * @param request HttpServletRequest请求对象
     * @return boolean
     */
    private boolean isAjax(HttpServletRequest request) {
        String requestedWith = request.getHeader("x-requested-with");
        return (requestedWith != null && requestedWith.equalsIgnoreCase("XMLHttpRequest"));
    }

    /**
     * 获取到最内层的异常
     *
     * @param e 异常对象Throwable
     * @return Throwable
     */
    private static Throwable parseException(Throwable e) {
        Throwable tmp = e;
        int breakPoint = 0;
        while (tmp.getCause() != null) {
            if (tmp.equals(tmp.getCause())) {
                break;
            }
            tmp = tmp.getCause();
            breakPoint++;
            if (breakPoint > 1000) {
                break;
            }
        }
        return tmp;
    }

}
