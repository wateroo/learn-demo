//package com.watero.config;
//
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//public class WebSecurityConfigurer
//        extends WebSecurityConfigurerAdapter {
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        super.configure(web);
//    }
//
////    @Override
////    protected void configure(HttpSecurity http) throws Exception {
////        http.authorizeRequests()
////                .anyRequest().authenticated()
////                .and()
////                .formLogin()
////                .loginPage("/index.html")//自定义登陆页面
////                .permitAll();
////        //formLogin().permitAll()方法允许向所有用户授予与基于表单的登录相关的所有 URL 的访问权限
////    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http
//                .logout().logoutUrl("/logout")
//                .logoutSuccessUrl("")
//                .invalidateHttpSession(true)
//                .and()
//                .authorizeRequests() //(1)
//                .antMatchers("/resources/**", "/signup", "/about").permitAll() //(2)  放行静态资源
//                .antMatchers("/admin/**").hasRole("ADMIN") //(3)
//                .antMatchers("/db/**").access("hasRole('ADMIN') and hasRole('DBA')") //(4)
//                .anyRequest().authenticated() //(5)
//                .and()
//                // ...
//                .formLogin();
////        (1) http.authorizeRequests()方法有多个子级，每个匹配器均按声明 Sequences 考虑。
////        (2) 我们指定了任何用户都可以访问的多个 URL 模式。具体来说，如果 URL 以“/resources /”开头，等于“/signup”或等于“/about”，则任何用户都可以访问请求。
////        (3) 任何以“/admin /”开头的 URL 都将限于角色为“ ROLE_ADMIN”的用户。您将注意到，由于我们正在调用hasRole方法，因此无需指定“ ROLE_”前缀。
////        (4) 任何以“/db /”开头的 URL 都要求用户同时具有“ ROLE_ADMIN”和“ ROLE_DBA”。您会注意到，由于我们使用的是hasRole表达式，因此无需指定“ ROLE_”前缀。
////        (5) 尚未匹配的任何 URL 仅要求对用户进行身份验证
//
//    }
//}
