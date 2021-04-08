package com.yk.gateway.filter;

import com.sun.org.apache.xpath.internal.objects.XNull;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * @ClassName: AuthFilter
 * @program: yk-project
 * @description: zuulFiler
 * @author: yk
 * @create: 2021-03-01 15:33
 */
@Component
public class AuthFilter implements GlobalFilter, Ordered {
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {



        ServerHttpRequest request = exchange.getRequest();
        HttpHeaders headers = exchange.getResponse().getHeaders();
        headers.set("age","18");
//        HttpHeaders headers = request.getHeaders();
//        headers.add("age","18");

        String name = exchange.getRequest().getQueryParams().getFirst("name");
        Object Authorization = exchange.getRequest().getHeaders().get("Authorization");
//        request.getHeaders().set("Authorization",null);

        System.out.println("Authorization = " + Authorization);
        System.out.println("name = " + name);
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
    
    