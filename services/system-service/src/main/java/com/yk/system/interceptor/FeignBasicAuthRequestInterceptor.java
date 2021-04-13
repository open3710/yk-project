package com.yk.system.interceptor;

import cn.hutool.core.util.StrUtil;
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
        String token = StrUtil.sub(authorization, 7, authorization.length());
//        requestTemplate.header("Authorization", authorization);
        requestTemplate.header("Authorization", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsieWtfYmxvZyJdLCJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbIlJPTEVfQURNSU4iLCJST0xFX0FQSSJdLCJleHAiOjE2MTgzMTAxMzEsImF1dGhvcml0aWVzIjpbImRlbGV0ZWQiLCJpbnNlcnRkIiwidXBkYXRlZCIsInNlbGVjdGQiXSwianRpIjoiNjkwYzc4YjAtNTU2Ni00YmUyLWE0YmQtY2Y5MzNlMTZmZjhiIiwiY2xpZW50X2lkIjoiYmxvZyJ9.1dllY9BxF1iljXjxraVPAjFkqNehr9qS8RsKO4jEjLM");

    }
}
    
    