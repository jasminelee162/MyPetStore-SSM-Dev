package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.Category;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemQuantity;
import org.csu.petstore.entity.Product;
import org.csu.petstore.persistence.CategoryMapper;
import org.csu.petstore.persistence.ItemMapper;
import org.csu.petstore.persistence.ItemQuantityMapper;
import org.csu.petstore.persistence.ProductMapper;
import org.csu.petstore.entity.Product;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
        itemVO.setAttributes(item.getAttribute1());
        itemVO.setProductId(product.getProductId());
        itemVO.setProductName(product.getName());
        String[] temp = product.getDescription().split("_");
        itemVO.setDescriptionImage(temp[0]);
        itemVO.setDescriptionText(temp[1].substring(1));

        itemVO.setQuantity(itemQuantity.getQuantity());
        return itemVO;
    }


}