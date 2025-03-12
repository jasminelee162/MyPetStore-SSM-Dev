package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("account") // 对应数据库表名，如果类名和表名一致，可以省略
public class Account {

    @TableId(value = "userid", type = IdType.INPUT) // 指定主键，使用 userid 对应数据库列名
    private String username;

    @TableField("password") // 对应数据库字段名，如果字段名和属性名一致，可以省略
    private String password;

    @TableField("email")
    private String email;

    @TableField("firstname")
    private String firstname;

    @TableField("lastname")
    private String lastname;

    @TableField("status")
    private String status;

    @TableField("addr1")
    private String addr1;

    @TableField("addr2")
    private String addr2;

    @TableField("city")
    private String city;

    @TableField("state")
    private String state;

    @TableField("zip")
    private String zip;

    @TableField("country")
    private String country;

    @TableField("phone")
    private String phone;

    @TableField("uncategorizable")
    private String uncategorizable;

}

