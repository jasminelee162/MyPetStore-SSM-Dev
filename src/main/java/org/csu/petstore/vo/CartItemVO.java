package org.csu.petstore.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CartItemVO {
    private ItemVO item;
    private int quantity;  // 数量
    private boolean inStock;  // 是否有库存
    private BigDecimal totalPrice;  // 该商品的总价
}
