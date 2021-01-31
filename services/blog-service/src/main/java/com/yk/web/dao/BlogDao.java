package com.yk.web.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yk.common.entity.Blog;
import org.apache.ibatis.annotations.Mapper;

/**
 * 博客表 博客表(Blog)表数据库访问层
 *
 * @author yk
 * @since 2020-11-28 14:18:10
 */
@Mapper
public interface BlogDao extends BaseMapper<Blog> {

}