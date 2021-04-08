package com.yk.authentication.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yk.common.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * (SysUser)表数据库访问层
 *
 * @author yk
 * @since 2021-04-08 19:49:57
 */
@Mapper
public interface SysUserDao extends BaseMapper<SysUser> {

    public List<Map<String,Object>> queryAll();
}