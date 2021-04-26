package com.yk.web;

import io.seata.spring.annotation.datasource.EnableAutoDataSourceProxy;
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
@EnableAutoDataSourceProxy
public class BlogApplication {

    public static void main(String[] args) {
        SpringApplication.run(BlogApplication.class, args);
    }
}
    
    