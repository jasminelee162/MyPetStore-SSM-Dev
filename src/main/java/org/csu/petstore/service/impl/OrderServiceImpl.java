package org.csu.petstore.service.impl;

import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemQuantity;
import org.csu.petstore.entity.Product;
import org.csu.petstore.persistence.ItemMapper;
import org.csu.petstore.persistence.ItemQuantityMapper;
import org.csu.petstore.persistence.ProductMapper;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.LineItemVO;
import org.csu.petstore.vo.OrderVO;
import org.csu.petstore.vo.SequenceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("OrderService")
public class OrderServiceImpl {

    @Autowired
    private ItemMapper itemMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ItemQuantityMapper itemQuantityMapper;

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

    public OrderVO getProduct(String product){

        return null;
    }

    public SequenceVO getSequence(String sequence){
        return null;
    }
    public LineItemVO getLineItem(String lineItem){
        return null;
    }

}
