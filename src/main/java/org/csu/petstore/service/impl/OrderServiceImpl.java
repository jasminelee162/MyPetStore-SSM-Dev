package org.csu.petstore.service.impl;

import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemQuantity;
import org.csu.petstore.entity.Order;
import org.csu.petstore.entity.Product;
import org.csu.petstore.persistence.*;

import org.csu.petstore.service.OrderService;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.LineItemVO;
import org.csu.petstore.vo.OrderVO;
import org.csu.petstore.vo.SequenceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {

    @Autowired
    private ItemMapper itemMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ItemQuantityMapper itemQuantityMapper;

    @Autowired
    private OrderMapper orderMapper;

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



    //Order数据库方法实现
    @Override  //待实现
    public List<Order> getOrdersByUsername(String username) {
        return null;
    }

    @Override
    public OrderVO getOrder(int orderId) {
        OrderVO orderVO = new OrderVO();
        Order order = orderMapper.selectById(orderId);

        orderVO.setOrderId(order.getOrderId());
        orderVO.setUserId(order.getUserId());
        orderVO.setOrderDate(order.getOrderDate());
        orderVO.setShipAddr1(order.getShipAddr1());
        orderVO.setShipAddr2(order.getShipAddr2());
        orderVO.setShipCity(order.getShipCity());
        orderVO.setShipState(order.getShipState());
        orderVO.setShipZip(order.getShipZip());
        orderVO.setShipCountry(order.getShipCountry());
        orderVO.setBillAddr1(order.getBillAddr1());
        orderVO.setBillAddr2(order.getBilladdr2());
        orderVO.setBillCity(order.getBillCity());
        orderVO.setBillState(order.getBillState());
        orderVO.setBillZip(order.getBillZip());
        orderVO.setBillCountry(order.getBillCountry());
        orderVO.setCourier(order.getCourier());
        orderVO.setTotalPrice(order.getTotalPrice());
        orderVO.setBillToFirstName(order.getBillToFirstName());
        orderVO.setBillToLastName(order.getBillToLastName());
        orderVO.setShipToFirstName(order.getShipToFirstName());
        orderVO.setShipToLastName(order.getShipToLastName());
        orderVO.setCreditCard(order.getCreditCard());
        orderVO.setExprDate(order.getExprDate());
        orderVO.setCardType(order.getCardType());
        orderVO.setLocale(order.getLocale());

        //Status和TimeStamp待实现


        return orderVO;
    }

    @Override
    public boolean insertOrder(OrderVO order) {
        return false;
    }

    @Override
    public boolean insertOrderStatus(OrderVO order) {
        return false;
    }
}
