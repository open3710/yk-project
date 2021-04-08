package com.yk.authentication.service.impl;

import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yk.authentication.dao.SysPermissionDao;
import com.yk.authentication.service.SysPermissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * (SysPermission)表服务实现类
 *
 * @author yk
 * @since 2021-04-08 21:47:32
 */
@Service("sysPermissionService")
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionDao, entity.SysPermission> implements SysPermissionService {

    @Resource
    private SysPermissionDao sysPermissionDao;

    @Override
    public R<List<Map<String, Object>>> selectPermissionByUserName(String userName) {
        String name = Optional.ofNullable(userName).get();
        if (name == null) {
            // todo 此处加异常日志
            return R.failed("用户名为空操作失败");
        }
        // todo 成功过日志
        return R.ok(sysPermissionDao.selectPermissionByUserName(userName));
    }
}