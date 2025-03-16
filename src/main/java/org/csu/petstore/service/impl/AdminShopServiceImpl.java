package org.csu.petstore.service.impl;

import org.csu.petstore.entity.Category;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.Product;
import org.csu.petstore.persistence.CategoryMapper;
import org.csu.petstore.persistence.ItemMapper;
import org.csu.petstore.persistence.ProductMapper;
import org.csu.petstore.service.AdminShopService;
import org.csu.petstore.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service("adminShopService")
public class AdminShopServiceImpl implements AdminShopService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ItemMapper itemMapper;

    @Autowired
    private CatalogService catalogService;

    @Override
    public void addCategory(String categoryId, String categoryName, String description) {
        Category category = new Category();
        category.setCategoryId(categoryId);
        category.setName(categoryName);
        category.setDescription(description);

        categoryMapper.insert(category);
    }


    // 添加商品方法
    @Override
    public void addProduct(String categoryId, String productId, String productName, String description) {
        Product product = new Product();
        product.setCategoryId(categoryId);
        product.setProductId(productId);
        product.setName(productName);
        product.setDescription(description);

        // 插入商品到数据库
        productMapper.insert(product);
    }

    // 添加商品项方法
    @Override
    public void addItem(String productId, String itemId, String listPrice, String quantity) {
        Item item = new Item();
        item.setProductId(productId);
        item.setItemId(itemId);
        item.setListPrice(BigDecimal.valueOf(Double.parseDouble(listPrice)));
//        item.setQuantity(Integer.parseInt(quantity));
        item.setSupplierId(1);
        // 插入商品项到数据库
        itemMapper.insert(item);
    }

    @Override
    public void updateCategory(String categoryId, String categoryName, String description) {
        Category category = new Category();
        category.setCategoryId(categoryId);
        category.setName(categoryName);
        category.setDescription(description);

        categoryMapper.updateById(category);
    }

    @Override
    public void updateProduct(String productId, String productName, String description) {
        Product product = new Product();
        product.setProductId(productId);
        product.setName(productName);
        product.setDescription(description);

        productMapper.updateById(product);
    }

    @Override
    public void updateItem(String itemId, String listPrice, String quantity) {
        Item item = new Item();
        item.setItemId(itemId);
        item.setListPrice(BigDecimal.valueOf(Double.parseDouble(listPrice)));
//        item.setQuantity(Integer.parseInt(quantity));
        item.setSupplierId(1);
        itemMapper.updateById(item);
    }


}
