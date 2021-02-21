package com.yk.authentication.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;
import org.springframework.security.oauth2.provider.code.AuthorizationCodeServices;
import org.springframework.security.oauth2.provider.code.InMemoryAuthorizationCodeServices;
import org.springframework.security.oauth2.provider.code.JdbcAuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

import javax.sql.DataSource;
import java.util.Arrays;

/**
 * @ClassName: config
 * @program: yk-project
 * @description: 授权服务配置类
 * @author: yk
 * @create: 2021-02-09 10:32
 */
@Configuration
@EnableAuthorizationServer
public class AuthorizationServer extends AuthorizationServerConfigurerAdapter {


    @Autowired
    private TokenStore tokenStore;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private AuthorizationCodeServices authorizationCodeServices;
    @Autowired
    private ClientDetailsService clientDetailsService;
    @Autowired
    private JwtAccessTokenConverter jwtAccessTokenConverter;

    // 配置到数据库
    @Bean
    public ClientDetailsService clientDetailsService(DataSource dataSource){
        ClientDetailsService clientDetailsService = new JdbcClientDetailsService(dataSource);
        ((JdbcClientDetailsService) clientDetailsService).setPasswordEncoder(passwordEncoder());
        return clientDetailsService;
    }


    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        // 保存到数据库
        clients.withClientDetails(clientDetailsService);

        // 内存方式
        /*clients.inMemory()
                // 客户端id
                .withClient("yk")
                // 秘钥
                .secret(passwordEncoder().encode("secret"))
                // 可访问的资源
                .resourceIds("blog")
                // 允许授权类型
                .authorizedGrantTypes("authorization_code","password","client_credentials","refresh_token")
                // 允许授权范围
                .scopes("all")
                // 是否跳到授权页面
                .autoApprove(false)
                // 雁阵回调地址
                .redirectUris("http://www.baidu.com");*/
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    /**
     * 令牌访问服务
     */
    @Bean
    public AuthorizationServerTokenServices tokenServices(){
        DefaultTokenServices services = new DefaultTokenServices();
        // 客户端信息服务
        services.setClientDetailsService(clientDetailsService);
        // 是否刷新令牌
        services.setSupportRefreshToken(true);
        // 令牌存储策略
        services.setTokenStore(tokenStore);
        TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
        tokenEnhancerChain.setTokenEnhancers(Arrays.asList(jwtAccessTokenConverter));
        services.setTokenEnhancer(tokenEnhancerChain);
        // 令牌有效期
        services.setAccessTokenValiditySeconds(7700);
        // 刷新令牌默认有效期三天
        services.setRefreshTokenValiditySeconds(259200);
        return services;
    }

    /**
     * 令牌授权端点
     此配置方法有以下几个用处：
     不同的授权类型（Grant Types）需要设置不同的类：
     authenticationManager：当授权类型为密码模式(password)时，需要设置此类
     AuthorizationCodeServices： 授权码模式(authorization_code) 下需要设置此类，用于实现授权码逻辑
     implicitGrantService：隐式授权模式设置此类。
     tokenGranter：自定义授权模式逻辑

     通过pathMapping<默认链接,自定义链接> 方法修改默认的端点URL
     /oauth/authorize：授权端点。
     /oauth/token：令牌端点。
     /oauth/conﬁrm_access：用户确认授权提交端点。
     /oauth/error：授权服务错误信息端点。
     /oauth/check_token：用于资源服务访问的令牌解析端点。
     /oauth/token_key：提供公有密匙的端点，如果你使用JWT令牌的话。
     http://localhost:3711/oauth/authorize?response_type=code&client_id=yk&scope=ROLE_ADMIN&redirect_uri=http://www.baidu.com
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {

        endpoints
                // 密码模式
                .authenticationManager(authenticationManager)
                // 授权码模式
                .authorizationCodeServices(authorizationCodeServices)
                // 令牌管理服务
                .tokenServices(tokenServices())
                // 允许post请求
                .allowedTokenEndpointRequestMethods(HttpMethod.POST);

    }

    /**
     * 令牌访问安全策略
     * @param security
     * @throws Exception
     */
    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
        security.tokenKeyAccess("permitAll()")
                .checkTokenAccess("permitAll()")
                .allowFormAuthenticationForClients();
    }

    /**
     * 授权码服务基于内存
     */
   /* @Bean
    public AuthorizationCodeServices authorizationCodeServices(){
        return new InMemoryAuthorizationCodeServices();
    }*/

    /**
     * 授权码保存在数据库
     */

    @Bean
    public AuthorizationCodeServices authorizationCodeServices(DataSource dataSource){
        return new JdbcAuthorizationCodeServices(dataSource);
    }


}
    
    