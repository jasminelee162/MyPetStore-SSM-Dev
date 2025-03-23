package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jakarta.servlet.http.HttpSession;
import org.csu.petstore.entity.*;
import org.csu.petstore.persistence.*;
import org.csu.petstore.entity.Product;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.LogService;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("catalogService")
public class CatalogServiceImpl implements CatalogService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ItemMapper itemMapper;

    @Autowired
    private ItemQuantityMapper itemQuantityMapper;

    @Autowired
    private LogService logService;


    @Override
    public List<CategoryVO> getAllCategories() {
        List<Category> categories = categoryMapper.selectList(null);
        return categories.stream().map(category -> {
            CategoryVO vo = new CategoryVO();
            vo.setCategoryId(category.getCategoryId());
            vo.setCategoryName(category.getName());
            vo.setDescription(category.getDescription());
            return vo;
        }).collect(Collectors.toList());
    }

    @Override
    public Map<String, Integer> getItemQuantities(List<String> itemIds) {
        if (itemIds == null || itemIds.isEmpty()) {
            return Collections.emptyMap();
        }
        List<ItemQuantity> quantities = itemQuantityMapper.selectBatchIds(itemIds);
        return quantities.stream().collect(Collectors.toMap(ItemQuantity::getItemId, ItemQuantity::getQuantity));
    }

    @Override
    public CategoryVO getCategory(String categoryId) {
        CategoryVO categoryVO = new CategoryVO();
        Category category = categoryMapper.selectById(categoryId);

        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("category", categoryId);
        List<Product> productList = productMapper.selectList(queryWrapper);

        categoryVO.setProductList(productList);
        categoryVO.setCategoryName(category.getName());
        categoryVO.setCategoryId(categoryId);
        categoryVO.setDescription(category.getDescription());

        return categoryVO;
    }

    @Override
    public ProductVO getProduct(String productId) {
        ProductVO productVO = new ProductVO();
        Product product = productMapper.selectById(productId);
        QueryWrapper<Item> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("productid", productId);
        List<Item> itemList = itemMapper.selectList(queryWrapper);

        productVO.setItemList(itemList);
        productVO.setProductName(product.getName());
        productVO.setProductId(productId);
        productVO.setCategoryId(product.getCategoryId());

        return productVO;
    }

    @Override
    public ItemVO getItem(String itemId) {
        ItemVO itemVO = new ItemVO();
        Item item = itemMapper.selectById(itemId);
        Product product = productMapper.selectById(item.getProductId());
        ItemQuantity itemQuantity = itemQuantityMapper.selectById(itemId);

        itemVO.setItemId(itemId);
        itemVO.setListPrice(item.getListPrice());
        itemVO.setUnitCost(item.getUnitCost());
        itemVO.setStatus(item.getStatus());
        itemVO.setAttribute1(item.getAttribute1());
        itemVO.setProductId(product.getProductId());
        itemVO.setProductName(product.getName());
        String[] temp = product.getDescription().split("_");
        itemVO.setDescriptionImage(temp[0]);
        itemVO.setDescriptionText(temp[1].substring(1));

        itemVO.setQuantity(itemQuantity.getQuantity());

        return itemVO;
    }

    @Override
    public void setLog(String type, HttpSession session, String typeId) {
        AccountVO account = (AccountVO) session.getAttribute("loginAccount");
        String username = account.getUsername();
        String message = "User " + username + " viewed " + type + ": " + typeId;
        logService.setLog(message);
    }

    @Override
    public List<Product> searchProductList(String keyword) {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();

        // 判断关键字是否为空，避免全表查
        if (keyword != null && !keyword.trim().isEmpty()) {
            // 模糊查询，假设搜索字段是产品名(name)
            queryWrapper.like("name", keyword);
        }

        // 查询符合条件的产品列表
        List<Product> productList = productMapper.selectList(queryWrapper);

        return productList;
    }

    /**
     * 减少库存
     * @param itemId 商品ID
     * @param quantity 减少的数量
     * @return 是否成功
     */
    public boolean decreaseInventory(String itemId, int quantity) {
        ItemQuantity itemQuantity = itemQuantityMapper.selectById(itemId);
        if (itemQuantity == null || itemQuantity.getQuantity() < quantity) {
            // 库存不足
            return false;
        }

        // 更新库存数量
        itemQuantity.setQuantity(itemQuantity.getQuantity() - quantity);
        return itemQuantityMapper.updateById(itemQuantity) > 0;
    }

}