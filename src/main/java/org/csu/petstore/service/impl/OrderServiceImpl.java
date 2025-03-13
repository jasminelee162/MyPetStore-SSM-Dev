package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.*;
import org.csu.petstore.persistence.*;

import org.csu.petstore.service.OrderService;
import org.csu.petstore.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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

    @Autowired
    private OrderStatusMapper orderStatusMapper;

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
    @Override
    public List<Order> getOrdersByUsername(String username) {
        // 使用 QueryWrapper 构建查询条件
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", username); // 假设 userid 字段存储了用户名

        // 调用 Mapper 的 selectList 方法执行查询
        List<Order> orderList = orderMapper.selectList(queryWrapper);

        return orderList;
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
        orderVO.setBillAddr2(order.getBillAddr2());
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
    public boolean insertOrder(OrderVO orderVO) {
        // 将 OrderVO 转换为 Order 实体类
        Order order = new Order();
        order.setOrderId(orderVO.getOrderId());
        order.setUserId(orderVO.getUserId());
        order.setOrderDate(orderVO.getOrderDate());
        order.setShipAddr1(orderVO.getShipAddr1());
        order.setShipAddr2(orderVO.getShipAddr2());
        order.setShipCity(orderVO.getShipCity());
        order.setShipState(orderVO.getShipState());
        order.setShipZip(orderVO.getShipZip());
        order.setShipCountry(orderVO.getShipCountry());
        order.setBillAddr1(orderVO.getBillAddr1());
        order.setBillAddr2(orderVO.getBillAddr2());
        order.setBillCity(orderVO.getBillCity());
        order.setBillState(orderVO.getBillState());
        order.setBillZip(orderVO.getBillZip());
        order.setBillCountry(orderVO.getBillCountry());
        order.setCourier(orderVO.getCourier());
        order.setTotalPrice(orderVO.getTotalPrice());
        order.setBillToFirstName(orderVO.getBillToFirstName());
        order.setBillToLastName(orderVO.getBillToLastName());
        order.setShipToFirstName(orderVO.getShipToFirstName());
        order.setShipToLastName(orderVO.getShipToLastName());
        order.setCreditCard(orderVO.getCreditCard());
        order.setExprDate(orderVO.getExprDate());
        order.setCardType(orderVO.getCardType());
        order.setLocale(orderVO.getLocale());

        // 调用 Mapper 的 insert 方法
        int result = orderMapper.insert(order);

        // 返回插入是否成功
        return result > 0;
    }


    @Override
    public boolean insertOrderStatus(OrderStatusVO orderStatusVO) {
        // 构造 OrderStatus 对象
        OrderStatus orderStatus = new OrderStatus();
        orderStatus.setOrderId(orderStatusVO.getOrderId());
        orderStatus.setLinenum(orderStatusVO.getLinenum());
        orderStatus.setTimestamp(orderStatusVO.getTimestamp() == null ? new Date() : orderStatusVO.getTimestamp()); // 如果未提供时间戳，则使用当前时间
        orderStatus.setStatus(orderStatusVO.getStatus());

        // 调用 Mapper 的 insert 方法
        int result = orderStatusMapper.insert(orderStatus);

        // 返回插入是否成功
        return result > 0;
    }

}
