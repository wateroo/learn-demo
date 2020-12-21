package com.watero.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()//开启登录配置
                .antMatchers("/admin/**").hasRole("admin")//访问/admin/**下的url需要admin这个角色
                .antMatchers("/hello").permitAll()//访问/hello,不需要权限控制
                .anyRequest().authenticated()//其他都需要授权
                .and()
                .formLogin()//定义登录页面，未登录时，访问一个需要登录之后才能访问的接口，会自动跳转到该页面
                .loginPage("/index.html")//自定义登陆页面
                .loginProcessingUrl("/admin/login")//自定义的登陆处理接口
                //登陆成功的处理器
                .successHandler(new AuthenticationSuccessHandler() {
                    @Override
                    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
                        response.setContentType("application/json;charset=utf-8");
                        PrintWriter out = response.getWriter();
                        out.write("login success");
                        out.flush();
                    }
                })
                .permitAll()//和表单登录相关的接口统统都直接通过
                .and()
                .logout()//注销登录
                .logoutUrl("/admin/logout")
                .logoutSuccessHandler(new LogoutSuccessHandler() {
                    @Override
                    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
                        response.setContentType("application/json;charset=utf-8");
                        PrintWriter out = response.getWriter();
                        out.write("logout success");
                        out.flush();
                    }
                })
                .permitAll()//和注销登陆相关的接口统统都直接通过
                .and()
                .httpBasic()
                .and()
                .csrf().disable();//关闭csrf
    }


    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");//放行静态资源
    }
}
