package com.yk.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

/**
 * @ClassName: TokenConfig
 * @program: yk-project
 * @description: 令牌生成方案
 * @author: yk
 * @create: 2021-02-09 10:51
 */
@Configuration
public class TokenConfig {

    private String SIGNING_KEY = "project";

    @Bean
    public TokenStore tokenStore(){
//        return new InMemoryTokenStore();
        return new JwtTokenStore(accessTokenConverter());
    }


    @Bean
    public JwtAccessTokenConverter accessTokenConverter(){
        JwtAccessTokenConverter jwtAccessTokenConverter = new JwtAccessTokenConverter();
        jwtAccessTokenConverter.setSigningKey(SIGNING_KEY);
        return jwtAccessTokenConverter;
    }
}
    
    