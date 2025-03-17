package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jakarta.transaction.Transactional;
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
import java.util.List;
import java.util.stream.Collectors;

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

    @Override
    @Transactional
    public void deleteCategory(String categoryId) {
        // 1. 先删除该 Category 下的所有 Product
        QueryWrapper<Product> productQuery = new QueryWrapper<>();
        productQuery.eq("category", categoryId);
        List<Product> products = productMapper.selectList(productQuery);

        if (!products.isEmpty()) {
            List<String> productIds = products.stream().map(Product::getProductId).collect(Collectors.toList());

            // 2. 删除所有 Product 关联的 Item
            QueryWrapper<Item> itemQuery = new QueryWrapper<>();
            itemQuery.in("productid", productIds);
            itemMapper.delete(itemQuery);

            // 3. 删除所有 Product
            productMapper.delete(productQuery);
        }

        // 4. 删除 Category
        categoryMapper.deleteById(categoryId);
    }


    @Override
    @Transactional
    public void deleteProduct(String productId) {
        // 1. 先删除该 Product 关联的所有 Item
        QueryWrapper<Item> itemQuery = new QueryWrapper<>();
        itemQuery.eq("productid", productId);
        itemMapper.delete(itemQuery);

        // 2. 删除 Product
        productMapper.deleteById(productId);
    }


    @Override
    public void deleteItem(String itemId) {
        // 直接删除 Item
        itemMapper.deleteById(itemId);
    }

}
