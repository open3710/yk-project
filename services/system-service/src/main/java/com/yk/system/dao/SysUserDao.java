package com.yk.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yk.common.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * (SysUser)表数据库访问层
 *
 * @author yk
 * @since 2021-04-09 14:19:59
 */
@Mapper
public interface SysUserDao extends BaseMapper<SysUser> {

}