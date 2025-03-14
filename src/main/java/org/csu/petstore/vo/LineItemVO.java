package org.csu.petstore.vo;

import lombok.Data;
import org.csu.petstore.entity.Item;

import java.math.BigDecimal;

@Data
public class LineItemVO {
    private int orderId;
    private int lineNumber;
    private int quantity;
    private String itemId;
    private BigDecimal unitPrice;
    private ItemVO item;   //修改为ItemVO
    private BigDecimal total;
}
