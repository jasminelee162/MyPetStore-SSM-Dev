package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("cartitem")
public class CartItem {

    @TableId
    private String username;

    @TableField(value = "itemid")
    private String itemId;

    @TableField(value = "quantity")
    private int quantity;

    @TableField(value = "in_stock")
    private boolean inStock;
}
