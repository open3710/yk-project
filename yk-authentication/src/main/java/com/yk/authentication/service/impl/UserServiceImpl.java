package com.yk.authentication.service.impl;


import cn.hutool.log.Log;
import cn.hutool.log.LogFactory;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import com.yk.authentication.dao.SysUserDao;
import com.yk.authentication.service.SysPermissionService;
import com.yk.common.entity.SysUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * (User)表服务实现类
 *
 * @author yk
 * @since 2021-04-05 17:57:54
 */
@Service("UserServiceImpl")

public class UserServiceImpl implements UserDetailsService {
    Log log = LogFactory.get();
    @Resource
    private SysUserDao userDao;

    @Resource
    private SysPermissionService permissionService;


    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        // 根据用户名获取用户信息
        SysUser param = new SysUser();
        param.setUserName(userName);
        QueryWrapper queryWrapper = new QueryWrapper(param);
        SysUser resUser = userDao.selectOne(queryWrapper);
        if (null == resUser) {
            log.info("loadUserByUsername 用户名不存在");
            throw new UsernameNotFoundException("用户名不存在");
        }
        // 根据用户名字获取对应权限
        R res = permissionService.selectPermissionByUserName(userName);
        log.info("loadUserByUsername 授权成功："+res.getData());
        List<Map<String, Object>> pers = (List<Map<String, Object>>)res.getData();
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        pers.forEach(data -> {grantedAuthorities.add(new SimpleGrantedAuthority(data.get("permission_tag").toString()));});
        // 设置权限
        resUser.setGrantedAuthority(grantedAuthorities);
        return resUser;
    }


}