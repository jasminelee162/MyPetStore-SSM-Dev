package org.csu.petstore.service;

public interface AdminShopService {

    //添加
    void addCategory(String categoryId, String categoryName, String description);

    void addProduct(String categoryId, String productId, String productName, String description);

    void addItem(String productId, String itemId, String listPrice,String unitCost,String quantity);

    //更新
    void updateCategory(String categoryId, String categoryName, String description);

    void updateProduct(String productId, String productName, String description);

    void updateItem(String itemId, String listPrice,String unitCost, String quantity);

    //删除
    void deleteCategory(String categoryId);

    void deleteProduct(String productId);

    void deleteItem(String itemId);

    void updateItemStatus(String itemId, String status);
}
