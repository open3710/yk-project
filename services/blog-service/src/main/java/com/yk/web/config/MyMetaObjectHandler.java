package com.yk.web.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @ClassName: MyMetaObjectHandler
 * @program: my-web
 * @description: 自动填充
 * @author: yk
 * @create: 2020-11-28 15:00
 */
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        // 起始版本 3.3.0(推荐使用)
        this.strictInsertFill(metaObject, "createTime", Date.class, new Date());
        // 版本默认1
        this.strictInsertFill(metaObject, "version", Integer.class, 1);
        // 删除表示 默认0未删除
        this.strictInsertFill(metaObject, "deleted", Integer.class, 0);


    }

    @Override
    public void updateFill(MetaObject metaObject) {
        // 起始版本 3.3.3(推荐)
        this.strictUpdateFill(metaObject, "updateTime", () -> new Date(), Date.class);
    }
}
    
    