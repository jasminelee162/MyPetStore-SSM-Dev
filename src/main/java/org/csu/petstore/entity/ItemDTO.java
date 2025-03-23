package org.csu.petstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
public class ItemDTO {
    private BigDecimal totalPrice;
    private BigDecimal subTotal;
    private String status;              // 请求状态
    private String message;             // 消息内容
    private String listPrice;           // 商品项定价
    private String unitCost;            // 商品项成本
    private String quantity;            // 商品项数量
}
