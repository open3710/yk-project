package entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.util.Date;

/**
 * (Role)表实体类
 *
 * @author yk
 * @since 2021-04-05 17:53:27
 */
@SuppressWarnings("serial")
@Data
@TableName("sys_role")
public class SysRole {

    /**
     * 角色主键
     */
    @TableId(value = "role_guid",type= IdType.ASSIGN_UUID)
    private String roleGuid;

    /**
     * 角色名
     */
    private String roleName;

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