package com.yk.authentication.config;

import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.OptimisticLockerInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @ClassName: MyBatisPlusConfig
 * @program: my-web
 * @description: MyBatisPlusConfig 配置类
 * @author: yk
 * @create: 2020-11-28 16:11
 * EnableTransactionManagement 开启事务
 */
@MapperScan("com.yk.web.dao")
@EnableTransactionManagement
@Configuration
public class MyBatisPlusConfig {

    /**
     * <p>Description: 注册乐观锁</p>
     * @author yk
     * @date 2020/11/28 16:12
    */
    @Bean
    public MybatisPlusInterceptor MybatisPlusInterceptor() {
        MybatisPlusInterceptor mybatisPlusInterceptor = new MybatisPlusInterceptor();
        //乐观锁
        mybatisPlusInterceptor.addInnerInterceptor(new OptimisticLockerInnerInterceptor());
        //分页配置
        mybatisPlusInterceptor.addInnerInterceptor(new PaginationInnerInterceptor());
        return mybatisPlusInterceptor;
    }
}
    
    