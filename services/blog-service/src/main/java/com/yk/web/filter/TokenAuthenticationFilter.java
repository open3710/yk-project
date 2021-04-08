package com.yk.web.filter;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @ClassName: TokenAuthenticationFilter
 * @program: yk-project
 * @description:
 * @author: yk
 * @create: 2021-04-04 19:22
 */
public class TokenAuthenticationFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {

        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken("user",null,
                        AuthorityUtils.createAuthorityList("111","222"));

        authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(httpServletRequest));
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);


        String token = httpServletRequest.getHeader("age");
        String Authorization = httpServletRequest.getHeader("Authorization");
        System.out.println("Authorization = " + Authorization);
        System.out.println("token = " + token);
        filterChain.doFilter(httpServletRequest,httpServletResponse);
    }
}
    
    