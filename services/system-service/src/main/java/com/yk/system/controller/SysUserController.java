package com.yk.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yk.common.entity.SysUser;
import com.yk.system.feign.BlogFeignService;
import com.yk.system.service.SysUserService;
import com.yk.system.util.RedisUtil;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

/**
 * (SysUser)表控制层
 *
 * @author yk
 * @since 2021-04-09 14:20:02
 */
@RestController
@RequestMapping("sysUser")
public class SysUserController extends ApiController {

    /**
     * 服务对象
     */
    @Resource
    private SysUserService sysUserService;

    /**
     * redisUtil
     */
    @Resource
    private RedisUtil redisUtil;

    /**
     * 博客接口
     */
    @Resource
    private BlogFeignService blogFeignService;


    /**
     * 分页查询所有数据
     *
     * @param page    分页对象
     * @param sysUser 查询实体
     * @return 所有数据
     */
    @GetMapping
    @PreAuthorize("hasAuthority('selectd')")
    public R selectAll(Page<SysUser> page, SysUser sysUser) {
        return success(this.sysUserService.page(page, new QueryWrapper<>(sysUser)));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    @PreAuthorize("hasAuthority('selectd')")
    public R selectOne(@PathVariable Serializable id) {
        SysUser sysUser = (SysUser)redisUtil.get(id+"");
        if (null == sysUser) {
            redisUtil.set(id+"", this.sysUserService.getById(id));
        }else{
            sysUser = (SysUser)redisUtil.get(id+"");
        }
        String o = blogFeignService.test1(1);
        System.out.println("r = " + o);
        return success(sysUser);
    }

    /**
     * 新增数据
     *
     * @param sysUser 实体对象
     * @return 新增结果
     */
    @PostMapping
    public R insert(@RequestBody SysUser sysUser) {
        return success(this.sysUserService.save(sysUser));
    }

    /**
     * 修改数据
     *
     * @param sysUser 实体对象
     * @return 修改结果
     */
    @PutMapping
    public R update(@RequestBody SysUser sysUser) {
        return success(this.sysUserService.updateById(sysUser));
    }

    /**
     * 删除数据
     *
     * @param idList 主键结合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(@RequestParam("idList") List<Long> idList) {
        return success(this.sysUserService.removeByIds(idList));
    }
}