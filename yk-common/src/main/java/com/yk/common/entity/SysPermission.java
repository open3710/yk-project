package entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.util.Date;

/**
 * (Permission)表实体类
 *
 * @author yk
 * @since 2021-04-05 17:53:26
 */
@SuppressWarnings("serial")
@Data
@TableName("sys_permission")
public class SysPermission {

    /**
     * 权限id
     */
    @TableId(value = "permission_guid",type= IdType.ASSIGN_UUID)
    private String permissionGuid;

    /**
     * 权限名
     */
    private String permissionName;

    /**
     * 权限标识
     */
    private String permissionTag;

    /**
     * 权限描述
     */
    private String permissionDescription;

    /**
     * 菜单地址
     */
    private String permissionUrl;

    /**
     * 父级菜单
     */
    private String permissionParentGuid;

    /**
     * 是否启用 0 未启用 / 1启用
     */
    private Integer permissionEnabled;

    /**
     * 排序
     */
    private Integer permissionOrder;

    /**
     * 菜单图标
     */
    private String permissionIconcls;

    /**
     * 菜单等级 0为权限
     */
    private Integer permissionGrade;

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