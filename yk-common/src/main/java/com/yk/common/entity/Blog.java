package com.yk.common.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.util.Date;

/**
 * 博客表 博客表(Blog)表实体类
 *
 * @author yk
 * @since 2020-11-27 21:43:09
 */
@SuppressWarnings("serial")
@Data
@TableName(value = "b_blog")
public class Blog {

    /**
     * 主键 暂时UUID的方式
     */
    @TableId(value = "blog_guid",type= IdType.ASSIGN_UUID)
    private String blogGuid;

    /**
     * 博客标题
     */
    private String blogTitle;

    /**
     * 博客内容
     */
    private String blogContent;

    /**
     * 原创/转载
     */
    private String blogType;

    /**
     * 公开/私密 /VIP可见
     */
    private String blogForm;

    /**
     * 正常 /已删除
     */
    private String blogStatus;

    /**
     * 喜欢数量
     */
    private Integer blogLikeNum;

    /**
     * 评论数
     */
    private Integer blogCommentsNum;

    /**
     * 对应用户 对应用户
     */
    private String userGuid;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 修改时间
     */
    @TableField(fill = FieldFill.UPDATE)
    private Date updateTime;

    /**
     * 删除标识 逻辑删除 1 已删除 0 未删除
     */
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Integer deleted;

    /**
     * 乐观锁
     */
    @Version
    @TableField(fill = FieldFill.INSERT)
    private Integer version;


}