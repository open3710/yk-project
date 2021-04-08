package com.yk.authentication.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;


/**
 * (SysRole)表数据库访问层
 *
 * @author yk
 * @since 2021-04-08 21:41:45
 */
@Mapper
public interface SysRoleDao extends BaseMapper<entity.SysRole> {

}