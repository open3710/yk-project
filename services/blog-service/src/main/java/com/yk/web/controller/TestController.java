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


    @PreAuthorize("hasAuthority('p2')")
    @GetMapping("/r1")
    public String r1(){
        return "Success";
    }
}
    
    