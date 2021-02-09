package com.yk.authentication.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @ClassName: UserServiceImpl
 * @program: spring-security
 * @description: user实现层
 * @author: yk
 * @create: 2021-01-01 15:19
 */
@Service
public class UserServiceImpl implements UserDetailsService {



    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        System.out.println("---------------------走了---------------");

        // userName 是客户端传递过来的名字，拿到这个名字去数据库中查拿到已经加密后的密码，和传递的密码进行比较
        // 成功返回UserDetails
        if (!"admin".equals(userName) && !"user".equals(userName)) {
            throw new UsernameNotFoundException("用户名不存在");
        }

        String dbPassword = "123";
        String encode = new BCryptPasswordEncoder().encode(dbPassword);
        UserDetails userDetails = null;
        if("admin".equals(userName)){
            userDetails = User.withUsername(userName).password(encode).authorities("p1").build();
        }else{
            userDetails = User.withUsername(userName).password(encode).authorities("p2").build();

        }
        return userDetails;
    }


}
    
    