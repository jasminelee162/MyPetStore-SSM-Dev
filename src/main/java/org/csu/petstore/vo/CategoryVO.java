package org.csu.petstore.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.csu.petstore.entity.Product;

import java.util.List;

@Data
public class CategoryVO {
    private String categoryId;
    private String categoryName;
    // setter 方法
    // getter 方法
    @Setter
    @Getter
    private List<Product> productList;
}
