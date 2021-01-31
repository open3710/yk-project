package com.yk.web.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yk.common.entity.Blog;
import com.yk.web.dao.BlogDao;
import com.yk.web.service.BlogService;
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