package org.csu.petstore.service;

import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Order;
import org.csu.petstore.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.csu.petstore.entity.OrderStatus;

import java.util.List;

public interface OrderService {

    public ItemVO getItem(String itemId);
    public OrderVO getProduct(String product);
    public SequenceVO getSequence(String sequence);
    public LineItemVO getLineItem(String lineItem);


    //Order数据库操作方法定义
    List<Order> getOrdersByUsername(String username);

    OrderVO getOrder(int orderId);

    boolean insertOrder(OrderVO order);

    boolean insertOrderStatus(OrderStatusVO orderStatus);



    //非数据库方法定义

    //Order初始化，根据loginAccount和cart
    OrderVO initOrder(AccountVO accountVO, CartVO cartvo);

    int getNextId(String name);
}
