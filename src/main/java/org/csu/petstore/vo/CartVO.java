package org.csu.petstore.vo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
public class CartVO {
    private String username;
    private Map<String, CartItemVO> itemMap = new HashMap<>();
    private List<CartItemVO> itemList = new ArrayList<>(); // 购物车中的商品列表
    private BigDecimal subTotal; // 总价格

    public int getNumberOfItems() {
        return this.itemList.size();
    }
}