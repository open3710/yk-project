package com.yk.authentication;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;


/**
 * @ClassName: AuthenticationApplication
 * @program: yk-project
 * @description: 认证启动类
 * @author: yk
 * @create: 2021-02-09 10:24
 */
@SpringBootApplication
@EnableDiscoveryClient
public class AuthenticationApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuthenticationApplication.class, args);
    }
}
