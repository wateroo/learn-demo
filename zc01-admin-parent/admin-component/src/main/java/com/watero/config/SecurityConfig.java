package com.watero.config;

import cn.hutool.json.JSON;
import cn.hutool.json.JSONObject;
import com.alibaba.druid.pool.DruidDataSource;
import com.watero.entity.User;
import com.watero.service.UserService;
import com.watero.util.CommonConfigConstant;
import com.watero.util.CustomPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Configuration
@EnableWebSecurity//启用web环境下的权限控制
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserService userService;

    @Autowired
    DruidDataSource druidDataSource;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Bean
    BCryptPasswordEncoder getBCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    UserDetailsService userDetailsService;


    /**
     * SpringSecurity环境下用户登陆相关
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        /**
         * 内存中设置正确的账号密码
         */
        //auth.inMemoryAuthentication().withUser("admin").password("123").roles("admin", "user");
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder);
    }


    /**
     * SpringSecurity环境下用户授权相关
     * 权限小的先设置，大的后设置
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()//开启登录配置
                .antMatchers("/admin/**").hasRole("admin")//访问/admin/**下的url需要admin这个角色
                .antMatchers("/hello").hasRole("root")//访问/hello,不需要权限控制
//                .antMatchers("/hello").permitAll()//访问/hello,不需要权限控制
                .antMatchers("/").permitAll()//访问/,不需要权限控制
                .antMatchers("/accessDenied").permitAll()//访问/,不需要权限控制
                .antMatchers("/index.html").permitAll()//访问/,不需要权限控制
//                .antMatchers("/resources/**").permitAll()//放行静态资源（不推荐）
                .anyRequest().authenticated()//其他任意请求都需要授权
                .and()
                .formLogin()//定义登录页面，未登录时，访问一个需要登录之后才能访问的接口，会自动跳转到该页面
                /**
                 * loginPage() 定制的登录页面之后同时会影响到：
                 * 1.提交登陆表单的地址
                 * 2.退出登录的地址
                 * 3.登陆失败的地址
                 * /index.html  GET  去登陆页面
                 * /index.html  POST    提交表单登录
                 * /index.html？error    GET 登陆失败
                 * /index.html？logout   GET 退出登录
                 */
                .loginPage("/index.html")//自定义登陆页面
                .loginProcessingUrl("/admin/login")//自定义的登陆处理接口
                .usernameParameter("loginAcct")//定制登录账号的请求参数名
                .passwordParameter("userPassword")//定制登录密码的请求参数名
                .defaultSuccessUrl("/main.html")//定制登陆成功之后的前往的地址
                //登陆成功的处理器
//                .successHandler(new AuthenticationSuccessHandler() {
//                    @Override
//                    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
//                        Object credentials = authentication.getCredentials();
//                        String name = authentication.getName();
//                        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
//                        User loginUser = userService.loadUserByUsername(name);
//                        HttpSession session = request.getSession();
//                        session.setAttribute(CommonConfigConstant.ATTR_LOGIN_USER, loginUser);
//                        request.getRequestDispatcher("/WEB-INF/views/admin/admin-main.jsp").forward(request,response);
//                    }
//                })
                .permitAll()//和表单登录相关的接口统统都直接通过
                .and()
                .logout()//注销登录
                .logoutUrl("/admin/logout")
                .logoutSuccessUrl("/index.html")
//                .logoutSuccessHandler(new LogoutSuccessHandler() {
//                    @Override
//                    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
//                        response.setContentType("application/json;charset=utf-8");
//                        PrintWriter out = response.getWriter();
//                        Map<String, String> data = new HashMap<>();
//                        data.put("msg", "logout success");
//                        JSON json = new JSONObject(data);
//                        out.write(json.toJSONString(1));
//                        out.flush();
//                    }
//                })
                .permitAll()//和注销登陆相关的接口统统都直接通过
//                .and()
//                .httpBasic()
                .and()
                .exceptionHandling().accessDeniedPage("/accessDenied")//简单设置错误页面
                .and()
                .csrf().disable();//关闭csrf
    }


    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");//放行静态资源
    }
}
