package com.yk.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yk.common.entity.SysUser;
import com.yk.system.dao.SysUserDao;
import com.yk.system.feign.BlogFeignService;
import com.yk.system.service.SysUserService;
import com.yk.system.util.RedisUtil;
import io.seata.spring.annotation.GlobalTransactional;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * (SysUser)表服务实现类
 *
 * @author yk
 * @since 2021-04-09 14:20:01
 */
@Service("sysUserService")
public class SysUserServiceImpl extends ServiceImpl<SysUserDao, SysUser> implements SysUserService {


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


    @Override
    @GlobalTransactional(name = "update-user",rollbackFor = Exception.class)
    public Boolean updateUserByGuid(String guid) {
        SysUser sysUser = (SysUser)redisUtil.get(guid+"");
        if (null == sysUser) {
            redisUtil.set(guid+"", this.getById(guid));
        }else{
            sysUser = (SysUser)redisUtil.get(guid+"");
        }
        sysUser.setUserName("测试分布式事务user");
        boolean update = this.update(sysUser, null);
        System.out.println("update = " + update);
        String o = blogFeignService.test1("1de20a25b21ae395079b8a4dd9acf495");
        System.out.println("r = " + o);
        return null;
    }
}