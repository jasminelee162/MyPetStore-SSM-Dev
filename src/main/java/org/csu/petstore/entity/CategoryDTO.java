package org.csu.petstore.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CategoryDTO {
    private String status;
    private String message;
    private String categoryId;
    private String categoryName;
    private String imageUrl;
}
