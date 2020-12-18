package com.watero.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebSecurity
public class WebSecurityConfig implements WebMvcConfigurer {

    /**
     * 配置将创建一个称为springSecurityFilterChain的 Servlet 过滤器，
     * 该过滤器负责应用程序中的所有安全性
     * (保护应用程序 URL，验证提交的用户名和密码，重定向到登录表单等)
     */
    @Bean
    public UserDetailsService userDetailsService() throws Exception {
        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
        manager.createUser(
                User.withDefaultPasswordEncoder()
                        .username("user").password("password")
                        .roles("USER").build()
        );
        return manager;
    }
}