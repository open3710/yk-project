package com.yk.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @ClassName: BlogApplication
 * @program: my-web
 * @description: 博客模块启动类
 * @author: yk
 * @create: 2020-11-27 19:41
 */

@SpringBootApplication
@EnableDiscoveryClient
public class BlogApplication {

    public static void main(String[] args) {
        SpringApplication.run(BlogApplication.class, args);
    }
}
    
    