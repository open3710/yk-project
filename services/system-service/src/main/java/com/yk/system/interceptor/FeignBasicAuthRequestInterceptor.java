package com.yk.system.interceptor;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName: Interceptor
 * @program: yk-project
 * @description: openFeign 调用其他服务设置token
 * @author: yk
 * @create: 2021-04-05 16:33
 */
@Configuration
public class FeignBasicAuthRequestInterceptor implements RequestInterceptor {

    @Override
    public void apply(RequestTemplate requestTemplate) {
        // 注意token必须有其他模块的权限才能调用成功
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String authorization = request.getHeader("Authorization");
        requestTemplate.header("Authorization", authorization);

    }
}
    
    