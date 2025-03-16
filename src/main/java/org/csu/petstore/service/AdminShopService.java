package org.csu.petstore.service;

public interface AdminShopService {

    void addCategory(String categoryId, String categoryName, String description);

    // 添加商品方法
    void addProduct(String categoryId, String productId, String productName, String description);

    // 添加商品项方法
    void addItem(String productId, String itemId, String listPrice, String quantity);

   void updateItem(String itemId, String listPrice, String quantity);

   void updateProduct(String productId, String productName, String description);

   void updateCategory(String categoryId, String categoryName, String description);
}
