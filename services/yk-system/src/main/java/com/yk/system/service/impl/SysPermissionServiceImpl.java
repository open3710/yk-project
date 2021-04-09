package com.yk.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yk.system.dao.SysPermissionDao;
import com.yk.system.service.SysPermissionService;
import org.springframework.stereotype.Service;

/**
 * (SysPermission)表服务实现类
 *
 * @author yk
 * @since 2021-04-09 14:21:32
 */
@Service("sysPermissionService")
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionDao, entity.SysPermission> implements SysPermissionService {

}