package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName("lineitem")
public class LineItem {
    @TableId(value = "orderid")
    private Integer orderid;

    @TableField(value = "linenum")
    private Integer linenum;

    @TableField(value = "itemid")
    private String itemid;

    @TableField(value = "quantity")
    private Integer quantity;

    @TableField(value = "unitprice")
    private BigDecimal unitprice;

}