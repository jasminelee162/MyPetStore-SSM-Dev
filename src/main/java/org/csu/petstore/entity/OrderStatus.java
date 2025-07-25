package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("orderstatus") // 数据库表名为 orderstatus
public class OrderStatus {
    @TableId(value = "orderid")
    private Integer orderId; // orderid 是整型

    @TableField("linenum")
    private Integer linenum; // lineum 是整型

    @TableField("timestamp")
    private Date timestamp; // timestamp 是日期类型

    @TableField("status")
    private String status; // status 是字符串类型，长度为2
}