package com.yk.authentication.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


/**
 * (SysPermission)表数据库访问层
 *
 * @author yk
 * @since 2021-04-08 21:47:31
 */
@Mapper
public interface SysPermissionDao extends BaseMapper<entity.SysPermission> {

    /**
     * 根据用户名查询用户对用的权限
     * @param userName 用户名
     * @return
     */
    List<Map<String,Object>> selectPermissionByUserName(String userName);

}