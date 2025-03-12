package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("profile") // 对应数据库表名
public class Profile {

    @TableId(value = "userid", type = IdType.INPUT) // 指定主键
    private String userid;

    @TableField("langpref")
    private String langpref;

    @TableField("favcategory")
    private String favcategory;

    @TableField("mylistopt")
    private boolean mylistopt;

    @TableField("banneropt")
    private boolean banneropt;
}
