package com.yk.system.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Component
@FeignClient(value = "yk-blog")
public interface BlogFeignService {
    /**
     * @RequestMapping（method = RequestMethod.GET） 不加也会报错
     * @RequestParam 注解不加报错
     * @param id
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, value = "/blog/blog/test1")
    public String test1(@RequestParam("id") Integer id);
}
