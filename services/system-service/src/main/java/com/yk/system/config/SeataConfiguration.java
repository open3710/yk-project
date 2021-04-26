package com.yk.system.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * @ClassName: SeataConfiguration
 * @program: yk-project
 * @description: seata配置类
 * @author: yk
 * @create: 2021-04-26 09:18
 */
@Configuration
public class SeataConfiguration {
    /**
     * Druid数据源配置
     */
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource druidDataSource(){
        return new DruidDataSource();
    }
}
    
    