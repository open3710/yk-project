package com.yk.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yk.common.entity.SysUser;

/**
 * (SysUser)表服务接口
 *
 * @author yk
 * @since 2021-04-09 14:20:01
 */
public interface SysUserService extends IService<SysUser> {

    Boolean updateUserByGuid(String guid);
}