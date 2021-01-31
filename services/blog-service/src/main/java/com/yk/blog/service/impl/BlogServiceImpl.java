package com.yk.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yk.common.entity.Blog;
import com.yk.blog.dao.BlogDao;
import com.yk.blog.service.BlogService;
import org.springframework.stereotype.Service;

/**
 * 博客表 博客表(Blog)表服务实现类
 *
 * @author yk
 * @since 2020-11-28 14:18:11
 */
@Service("blogService")
public class BlogServiceImpl extends ServiceImpl<BlogDao, Blog> implements BlogService {

}