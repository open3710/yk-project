package com.yk.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yk.system.dao.SysRoleDao;
import com.yk.system.service.SysRoleService;
import org.springframework.stereotype.Service;

/**
 * (SysRole)表服务实现类
 *
 * @author yk
 * @since 2021-04-09 14:21:05
 */
@Service("sysRoleService")
public class SysRoleServiceImpl extends ServiceImpl<SysRoleDao, entity.SysRole> implements SysRoleService {

}