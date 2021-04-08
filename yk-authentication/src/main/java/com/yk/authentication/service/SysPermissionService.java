package com.yk.authentication.service;

import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * (SysPermission)表服务接口
 *
 * @author yk
 * @since 2021-04-08 21:47:32
 */
public interface SysPermissionService extends IService<entity.SysPermission> {

    /**
     * 根据用户名查询用户对用的权限
     * @param userName 用户名
     * @return
     */
    R<List<Map<String, Object>>> selectPermissionByUserName(String userName);

}