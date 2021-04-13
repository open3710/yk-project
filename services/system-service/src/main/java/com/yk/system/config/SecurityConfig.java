package com.yk.system.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * @ClassName: SecurityConfig
 * @program: spring-security
 * @description: SpringSecurity配置
 * @author: yk
 * @create: 2021-01-01 13:40
 */

@Configuration
@EnableGlobalMethodSecurity(securedEnabled = true,prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                // 基于web
//                .antMatchers("/r/**").hasAnyAuthority("p1")
                // 基于方法
                .antMatchers("/sysUser/**").authenticated()
                .antMatchers("/sysRole/**").authenticated()
                .antMatchers("/sysPermission/**").authenticated()
                // 除了/r/**其他都可以访问
                .anyRequest().permitAll();
    }


}
    
    