package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jakarta.transaction.Transactional;
import org.csu.petstore.entity.Category;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemQuantity;
import org.csu.petstore.entity.Product;
import org.csu.petstore.persistence.CategoryMapper;
import org.csu.petstore.persistence.ItemMapper;
import org.csu.petstore.persistence.ItemQuantityMapper;
import org.csu.petstore.persistence.ProductMapper;
import org.csu.petstore.service.AdminShopService;
import org.csu.petstore.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

    @Autowired
    private ItemQuantityMapper itemQuantityMapper;

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
    public void addItem(String productId, String itemId, String listPrice,String unitCost, String quantity) {
        Item item = new Item();
        item.setProductId(productId);
        item.setItemId(itemId);
        item.setListPrice(BigDecimal.valueOf(Double.parseDouble(listPrice)));
        item.setUnitCost(BigDecimal.valueOf(Double.parseDouble(unitCost)));
        item.setSupplierId(1);
        item.setStatus("N");
        itemMapper.insert(item);

        ItemQuantity itemQuantity = new ItemQuantity();
        itemQuantity.setQuantity(Integer.parseInt(quantity));
        itemQuantity.setItemId(itemId);
        itemQuantityMapper.insert(itemQuantity);
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
    public void updateItem(String itemId, String listPrice,String unitCost,String quantity) {
        Item item = new Item();
        item.setItemId(itemId);
        item.setListPrice(BigDecimal.valueOf(Double.parseDouble(listPrice)));
        item.setUnitCost(BigDecimal.valueOf(Double.parseDouble(unitCost)));
        item.setSupplierId(1);
        itemMapper.updateById(item);

        ItemQuantity itemQuantity = new ItemQuantity();
        itemQuantity.setQuantity(Integer.parseInt(quantity));
        itemQuantity.setItemId(itemId);
        itemQuantityMapper.updateById(itemQuantity);
    }

    @Override
    @Transactional
    public void deleteCategory(String categoryId) {
        // 1. 查询该 Category 下的所有 Product
        QueryWrapper<Product> productQuery = new QueryWrapper<>();
        productQuery.eq("category", categoryId);
        List<Product> products = productMapper.selectList(productQuery);

        if (!products.isEmpty()) {
            List<String> productIds = products.stream().map(Product::getProductId).collect(Collectors.toList());

            // 2. 查询所有 Product 关联的 Item
            QueryWrapper<Item> itemQuery = new QueryWrapper<>();
            itemQuery.in("productid", productIds);
            List<Item> items = itemMapper.selectList(itemQuery);

            if (!items.isEmpty()) {
                List<String> itemIds = items.stream().map(Item::getItemId).collect(Collectors.toList());

                // 3. 先删除 inventory 中对应的 Item 数据
                QueryWrapper<ItemQuantity> inventoryQuery = new QueryWrapper<>();
                inventoryQuery.in("itemid", itemIds);
                itemQuantityMapper.delete(inventoryQuery);

                // 4. 再删除 Item
                itemMapper.delete(itemQuery);
            }

            // 5. 删除所有 Product
            productMapper.delete(productQuery);
        }

        // 6. 删除 Category
        categoryMapper.deleteById(categoryId);
    }

    @Override
    @Transactional
    public void deleteProduct(String productId) {
        // 1. 查询 Product 关联的所有 Item
        QueryWrapper<Item> itemQuery = new QueryWrapper<>();
        itemQuery.eq("productid", productId);
        List<Item> items = itemMapper.selectList(itemQuery);

        if (!items.isEmpty()) {
            List<String> itemIds = items.stream().map(Item::getItemId).collect(Collectors.toList());

            // 2. 先删除 inventory 中的记录
            QueryWrapper<ItemQuantity> inventoryQuery = new QueryWrapper<>();
            inventoryQuery.in("itemid", itemIds);
            itemQuantityMapper.delete(inventoryQuery);

            // 3. 再删除 Item
            itemMapper.delete(itemQuery);
        }

        // 4. 删除 Product
        productMapper.deleteById(productId);
    }

    @Override
    @Transactional
    public void deleteItem(String itemId) {
        // 1. 先删除 inventory 中的记录
        itemQuantityMapper.deleteById(itemId);

        // 2. 再删除 Item
        itemMapper.deleteById(itemId);
    }

    @Override
    @Transactional
    public void updateItemStatus(String itemId, String status) {
        Item item = itemMapper.selectById(itemId);
        if (item != null) {
            item.setStatus(status);
            itemMapper.updateById(item);
        }
    }
}
