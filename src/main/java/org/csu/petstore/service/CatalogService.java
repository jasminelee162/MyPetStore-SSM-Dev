package org.csu.petstore.service;

import jakarta.servlet.http.HttpSession;
import org.csu.petstore.entity.Product;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;


import java.util.List;
import java.util.Map;

public interface CatalogService {

    List<CategoryVO> getAllCategories();

    Map<String, Integer> getItemQuantities(List<String> itemIds); // 新增方法

    public CategoryVO getCategory(String categoryId);

    public ProductVO getProduct(String productId);

    public ItemVO getItem(String itemId);

    public void setLog(String type, HttpSession session, String typeId);

    //自动补全
    List<Product> searchProductList(String keyword);

    //减少库存
    boolean decreaseInventory(String itemId, int quantity);
}
