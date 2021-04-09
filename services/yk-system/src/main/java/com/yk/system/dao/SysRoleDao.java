package com.yk.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * (SysRole)表数据库访问层
 *
 * @author yk
 * @since 2021-04-09 14:21:05
 */
@Mapper
public interface SysRoleDao extends BaseMapper<entity.SysRole> {

}