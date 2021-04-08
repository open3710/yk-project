package com.yk.authentication.fallback;

import org.springframework.stereotype.Component;

/**
 * @ClassName: FeignFallBack
 * @program: springCloud
 * @description:
 * @author: yk
 * @create: 2020-10-22 16:30
 */
@Component
public class FeignFallBack {


    public String r1() {
        return "FeignFallBack r1";
    }

    public String r2() {
        return "FeignFallBack r1";
    }
}
    
    