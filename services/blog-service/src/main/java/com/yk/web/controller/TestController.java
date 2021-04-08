package com.yk.web.controller;


import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName: TestController
 * @program: yk-project
 * @description: 测试控制层
 * @author: yk
 * @create: 2021-02-09 14:14
 */
@RequestMapping("r")
@RestController
public class TestController {


    @PreAuthorize("hasAuthority('insertd')")
    @GetMapping("/r1")
    public Object r1(){
        return "Success r1";
    }

    @PreAuthorize("hasAuthority('selectd')")
    @GetMapping("/r2")
    public Object r2(){
        return "Success r2";
    }
}
    
    