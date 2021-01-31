package com.yk.blog.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yk.common.entity.Blog;
import com.yk.blog.service.BlogService;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

/**
 * 博客表 博客表(Blog)表控制层
 *
 * @author yk
 * @since 2020-11-28 14:18:12
 */
@RestController
@RequestMapping("blog")
public class BlogController extends ApiController {
    /**
     * 服务对象
     */
    @Resource
    private BlogService blogService;

    @Resource
    private RedisTemplate<String,String> redisTemplate;
    /**
     * 分页查询所有数据
     *
     * @param page 分页对象
     * @param blog 查询实体
     * @return 所有数据
     */
    @GetMapping("/selectAll")
    public R selectAll(Page<Blog> page, Blog blog) {
        return success(this.blogService.page(page, new QueryWrapper<>(blog)));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("/selectOne/{id}")
    public R selectOne(@PathVariable Serializable id) {
       /* redisTemplate.opsForValue().set("myKey","myValue");
        System.out.println(redisTemplate.opsForValue().get("myKey"));
        redisTemplate.opsForHash().put("blog",null,null);*/
        System.out.println("id = " + id);
        return success(this.blogService.getById(id));
    }

    /**
     * 新增数据
     *
     * @param blog 实体对象
     * @return 新增结果
     */
    @PostMapping("/insert")
    public R insert(@RequestBody Blog blog) {
        return success(this.blogService.save(blog));
    }

    /**
     * 修改数据
     *
     * @param blog 实体对象
     * @return 修改结果
     */
    @PostMapping("/update")
    public R update(@RequestBody Blog blog) {
        return success(this.blogService.updateById(blog));
    }

    /**
     * 删除数据
     *
     * @param idList 主键结合
     * @return 删除结果
     */
    @PostMapping("/delete")
    public R delete(@RequestParam("idList") List<String> idList) {
        return success(this.blogService.removeByIds(idList));
    }
}