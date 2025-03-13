package org.csu.petstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
public class ItemDTO {
    private BigDecimal totalPrice;
    private BigDecimal subTotal;
}
