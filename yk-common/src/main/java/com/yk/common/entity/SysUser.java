package com.yk.common.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * (User)表实体类
 *
 * @author yk
 * @since 2021-04-05 17:49:56
 */
@SuppressWarnings("serial")
@Data
@TableName("sys_user")
public class SysUser implements UserDetails {

    /**
     * 用户主键
     */
    @TableId(value = "user_guid",type= IdType.ASSIGN_UUID)
    private String userGuid;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 生日
     */
    private Date userBirthday;

    /**
     * 手机
     */
    private String userPhone;

    /**
     * 密码
     */
    private String userPwd;

    /**
     * 邮箱
     */
    private String userEmail;

    /**
     * 头像
     */
    private String userImgUrl;

    /**
     * 性别 0 男 1 女
     */
    private Integer userSex;

    /**
     * 状态
     */
    private Integer userStatus;

    /**
     * 创建时间
     */
    private Date userCreateTime;

    /**
     * 最后登录时间
     */
    private Date userLastLoginTime;

    /**
     * 是否禁用
     */
    private Integer userEnabled;

    /**
     * 是否过期
     */
    private Integer userAccountNonExpired;

    /**
     * 是否锁定
     */
    private Integer userAccountNonLocked;

    /**
     * 证书是否过期
     */
    private Integer userCredentialsNonExpired;

    /**
     * 用户token
     */
    private String userToken;


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

    /**
     * 权限列表
     */
    @TableField(exist = false)
    private List<GrantedAuthority> grantedAuthority;


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getGrantedAuthority();
    }

    @Override
    public String getPassword() {
        return userPwd;
    }

    @Override
    public String getUsername() {
        return userName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}