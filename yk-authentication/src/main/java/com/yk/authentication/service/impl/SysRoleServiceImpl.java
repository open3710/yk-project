package com.yk.authentication.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yk.authentication.dao.SysRoleDao;
import com.yk.authentication.service.SysRoleService;
import org.springframework.stereotype.Service;

/**
 * (SysRole)表服务实现类
 *
 * @author yk
 * @since 2021-04-08 21:41:45
 */
@Service("sysRoleService")
public class SysRoleServiceImpl extends ServiceImpl<SysRoleDao, entity.SysRole> implements SysRoleService {

}