package org.csu.petstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ProductDTO {
    private String status;         // 请求状态
    private String message;        // 消息内容
    private String categoryId;
    private String productId;      // 商品ID
    private String productName;    // 商品名称
    private String imageUrl;       // 商品图片路径
}