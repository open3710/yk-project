package com.yk.authentication.config;

import com.yk.authentication.interceptor.FeignBasicAuthRequestInterceptor;
import feign.RequestInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @ClassName: FeignSupportConfig
 * @program: yk-project
 * @description:  Feign配置注册（全局）
 * @author: yk
 * @create: 2021-04-05 16:34
 */

@Configuration
public class FeignSupportConfig {
    /**
     * feign请求拦截器
     *
     * @return
     */
    @Bean
    public RequestInterceptor requestInterceptor(){
        return new FeignBasicAuthRequestInterceptor();
    }
}
    
    