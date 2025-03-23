package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("signon") // 对应数据库表名
public class SignOn {

    @TableId(value = "username", type = IdType.INPUT) // 指定主键
    private String username;

    @TableField("password")
    private String password;

    @TableField("admin")
    private boolean admin;
}
