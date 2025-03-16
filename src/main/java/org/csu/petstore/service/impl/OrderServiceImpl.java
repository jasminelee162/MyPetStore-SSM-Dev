package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.*;
import org.csu.petstore.persistence.*;

import org.csu.petstore.service.OrderService;
import org.csu.petstore.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

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

    @Autowired
    private SequenceMapper sequenceMapper;

    @Autowired
    private LineItemMapper lineItemMapper;

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
    @Transactional(rollbackFor = Exception.class)
    public boolean insertOrder(OrderVO orderVO) {
        try {
            // 获取订单 ID
            int orderId = getNextId("ordernum");
            orderVO.setOrderId(String.valueOf(orderId));

            // 转换 OrderVO 到 Order 实体
            Order order = convertOrderVOToOrder(orderVO);

            // 更新库存数量
//            for (LineItemVO lineItemVO : orderVO.getLineItems()) {
//                String itemId = lineItemVO.getItemId();
//                Integer increment = lineItemVO.getQuantity();
//
//                // 更新库存数量
//                QueryWrapper<Item> queryWrapper = new QueryWrapper<>();
//                queryWrapper.eq("itemid", itemId);
//                Item item = itemMapper.selectOne(queryWrapper);
//                if (item != null) {
//                    itemMapper.updateById(item);
//                }
//            }

            // 插入订单
            orderMapper.insert(order);

            // 插入订单状态
            OrderStatus orderStatus = new OrderStatus();
            orderStatus.setOrderId(orderId);
            orderStatus.setLinenum(orderId);
            orderStatus.setStatus("P");
            orderStatus.setTimestamp(new Date());
            orderStatusMapper.insert(orderStatus);

            // 插入订单明细
//            for (LineItemVO lineItemVO : orderVO.getLineItems()) {
//                LineItem lineItem = convertLineItemVOToLineItem(lineItemVO, orderId);
//                lineItemMapper.insert(lineItem);
//            }

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
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



    //非数据库方法实现

    //Order初始化
    @Override
    public OrderVO initOrder(AccountVO accountVO, CartVO cartVO) {
        OrderVO orderVO = new OrderVO();

        orderVO.setUserId(accountVO.getUsername());
        orderVO.setOrderDate(LocalDate.now().toString());

        orderVO.setShipToFirstName(accountVO.getFirstname());
        orderVO.setShipToLastName(accountVO.getLastname());
        orderVO.setShipAddr1(accountVO.getAddr1());
        orderVO.setShipAddr2(accountVO.getAddr2());
        orderVO.setShipCity(accountVO.getCity());
        orderVO.setShipState(accountVO.getState());
        orderVO.setShipZip(accountVO.getZip());
        orderVO.setShipCountry(accountVO.getCountry());

        orderVO.setBillToFirstName(accountVO.getFirstname());
        orderVO.setBillToLastName(accountVO.getLastname());
        orderVO.setBillAddr1(accountVO.getAddr1());
        orderVO.setBillAddr2(accountVO.getAddr2());
        orderVO.setBillCity(accountVO.getCity());
        orderVO.setBillState(accountVO.getState());
        orderVO.setBillZip(accountVO.getZip());
        orderVO.setBillCountry(accountVO.getCountry());

        orderVO.setTotalPrice(cartVO.getSubTotal().toString());

        orderVO.setCreditCard("999 9999 9999 9999");
        orderVO.setExprDate("12/03");
        orderVO.setCardType("Visa");
        orderVO.setCourier("UPS");
        orderVO.setLocale("CA");
        orderVO.setStatus("P");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        orderVO.setTimestamp(Timestamp.valueOf(LocalDateTime.now().format(formatter)));

        // 转换 CartItemVO 到 LineItemVO
        List<LineItemVO> lineItems = cartVO.getItemList().stream()
                .map(cartItemVO -> convertCartItemVOToLineItemVO(cartItemVO, cartVO.getItemList().indexOf(cartItemVO) + 1))
                .collect(Collectors.toList());

        orderVO.setLineItems(lineItems);

        return orderVO;
    }

    private LineItemVO convertCartItemVOToLineItemVO(CartItemVO cartItemVO, int lineNumber) {
        LineItemVO lineItemVO = new LineItemVO();
        lineItemVO.setLineNumber(lineNumber);
        lineItemVO.setItemId(cartItemVO.getItem().getItemId());
        lineItemVO.setQuantity(cartItemVO.getQuantity());
        lineItemVO.setUnitPrice(cartItemVO.getItem().getListPrice());
        lineItemVO.setItem(cartItemVO.getItem());
        lineItemVO.setTotal(cartItemVO.getTotalPrice());
        return lineItemVO;
    }

    @Override
    public int getNextId(String name) {
        // 获取当前序列值
        Sequence sequence = sequenceMapper.selectById(name);
        if (sequence == null) {
            throw new RuntimeException("Error: A null sequence was returned from the database (could not get next " + name + " sequence).");
        }

        // 更新序列值
        int nextId = sequence.getNextId();
        sequence.setNextId(nextId + 1);
        sequenceMapper.updateById(sequence);

        return nextId;
    }

    private Order convertOrderVOToOrder(OrderVO orderVO) {
        Order order = new Order();
        order.setOrderId(orderVO.getOrderId());
        order.setUserId(orderVO.getUserId());

        // 使用 SimpleDateFormat 格式化日期
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = dateFormat.format(new Date());
        order.setOrderDate(formattedDate);

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
        order.setTotalPrice(String.valueOf(new BigDecimal(orderVO.getTotalPrice())));
        order.setBillToFirstName(orderVO.getBillToFirstName());
        order.setBillToLastName(orderVO.getBillToLastName());
        order.setShipToFirstName(orderVO.getShipToFirstName());
        order.setShipToLastName(orderVO.getShipToLastName());
        order.setCreditCard(orderVO.getCreditCard());
        order.setExprDate(orderVO.getExprDate());
        order.setCardType(orderVO.getCardType());
        order.setLocale(orderVO.getLocale());
        return order;
    }

    private LineItem convertLineItemVOToLineItem(LineItemVO lineItemVO, int orderId) {
        LineItem lineItem = new LineItem();
        lineItem.setOrderid(orderId);
        lineItem.setLinenum(lineItemVO.getLineNumber());
        lineItem.setItemid(lineItemVO.getItemId());
        lineItem.setQuantity(lineItemVO.getQuantity());
        lineItem.setUnitprice(lineItemVO.getUnitPrice());
        return lineItem;
    }

}
