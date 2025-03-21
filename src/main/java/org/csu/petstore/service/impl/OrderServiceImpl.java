package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.*;
import org.csu.petstore.persistence.*;

import org.csu.petstore.service.OrderService;
import org.csu.petstore.vo.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
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
        itemVO.setAttribute1(item.getAttribute1());
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
        Order order = orderMapper.selectById(orderId);
        if (order == null) {
            return null;  // 查不到，直接返回 null，Controller 已经处理 null 返回了
        }
        OrderVO orderVO = new OrderVO();
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

            System.out.println(orderVO.getLineItems());

            // 更新库存数量
            for (LineItemVO lineItemVO : orderVO.getLineItems()) {
                String itemId = lineItemVO.getItemId();
                Integer increment = lineItemVO.getQuantity();

                // 更新库存数量
                QueryWrapper<Item> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("itemid", itemId);
                Item item = itemMapper.selectOne(queryWrapper);
                if (item != null) {
                    itemMapper.updateById(item);
                }
            }

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
            for (LineItemVO lineItemVO : orderVO.getLineItems()) {
                LineItem lineItem = convertLineItemVOToLineItem(lineItemVO, orderId);
                lineItemMapper.insert(lineItem);
            }

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

    @Override
    public boolean updateStatusToShipped(String orderId) {
        try {
            // 调用 Mapper 更新状态
            int rowsAffected = orderStatusMapper.updateStatusToShipped(orderId);
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Order> getAllOrders() {
        // 调用 Mapper 的 selectList 方法查询所有订单
        return orderMapper.selectList(null); // 不传入任何查询条件，表示查询所有数据


    }

    public List<OrderVO> getAllOrdersWithStatus() {
        // 查询所有订单
        List<Order> orders = orderMapper.selectList(null);

        // 创建一个列表来存储 OrderVO 对象
        List<OrderVO> orderVOList = new ArrayList<>();

        // 遍历每个订单，查询其最新状态并设置到 OrderVO 中
        for (Order order : orders) {
            OrderVO orderVO = new OrderVO();
            BeanUtils.copyProperties(order, orderVO);

            // 查询该订单的最新状态
            OrderStatus latestStatus = orderStatusMapper.getLatestStatusByOrderId(order.getOrderId());
            if (latestStatus != null) {
                orderVO.setStatus(latestStatus.getStatus());

                // 获取 java.util.Date 类型的 timestamp
                java.util.Date date = latestStatus.getTimestamp();

                // 如果 date 不为 null，将其转换为 java.sql.Timestamp
                if (date != null) {
                    java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
                    orderVO.setTimestamp(timestamp);
                } else {
                    orderVO.setTimestamp(null);
                }
            } else {
                orderVO.setStatus("未知状态");
                orderVO.setTimestamp(null);
            }

            // 查询该订单的所有订单项
            List<LineItem> lineItems = lineItemMapper.selectListByOrderId(Integer.valueOf(order.getOrderId()));
            List<LineItemVO> lineItemVOList = new ArrayList<>();

            // 将 LineItem 转换为 LineItemVO
            for (LineItem lineItem : lineItems) {
                LineItemVO lineItemVO = new LineItemVO();
                lineItemVO.setOrderId(lineItem.getOrderid());
                lineItemVO.setLineNumber(lineItem.getLinenum());
                lineItemVO.setQuantity(lineItem.getQuantity());
                lineItemVO.setItemId(lineItem.getItemid());
                lineItemVO.setUnitPrice(lineItem.getUnitprice());

                // 假设你已经实现了 ItemVO 的获取逻辑
                // ItemVO itemVO = itemService.getItemById(lineItem.getItemid());
                // lineItemVO.setItem(itemVO);

                // 计算总价
                lineItemVO.setTotal(lineItem.getUnitprice().multiply(BigDecimal.valueOf(lineItem.getQuantity())));

                lineItemVOList.add(lineItemVO);
            }

            orderVO.setLineItems(lineItemVOList);

            // 直接从 Order 对象中获取总价值
            orderVO.setTotalPrice(order.getTotalPrice());

            orderVOList.add(orderVO);
        }

        return orderVOList;
    }

    public boolean updateOrder(String orderId, String userId, String totalPrice, String status, List<LineItem> lineItems) {
        try {
            // 校验 orderId 是否为空
            if (orderId == null || orderId.trim().isEmpty()) {
                throw new RuntimeException("订单编号不能为空！");
            }

            // 将 orderId 转换为 Integer 类型
            Integer orderIntId = Integer.valueOf(orderId);

            // 更新订单基本信息
            Order order = orderMapper.selectById(orderIntId);
            if (order == null) {
                throw new RuntimeException("订单不存在！");
            }

            order.setUserId(userId);
            order.setTotalPrice(totalPrice);
            orderMapper.updateById(order);

            // 更新订单状态
            orderStatusMapper.updateStatus(orderId, status);

            // 更新订单明细数量
            for (LineItem lineItem : lineItems) {
                int updateCount = lineItemMapper.updateQuantity(orderIntId, lineItem.getItemid(), lineItem.getQuantity());
                if (updateCount == 0) {
                    // 如果更新失败，可能是该订单明细不存在，可以选择插入新的订单明细
                    lineItem.setOrderid(orderIntId);
                    lineItemMapper.insert(lineItem);
                }
            }

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Order getOrderById(String orderId) {
        try {
            Integer orderIntId = Integer.valueOf(orderId);
            return orderMapper.selectById(orderIntId);
        } catch (NumberFormatException e) {
            throw new RuntimeException("订单编号格式不正确！");
        }
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

        System.out.println("init test point");
        System.out.println(orderVO.getLineItems());

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

    @Override
    public Order findOrderById(Integer orderId) {
        if (orderId == null) {
            throw new IllegalArgumentException("订单ID不能为空！");
        }

        // 调用 Mapper 查询
        return orderMapper.selectById(orderId);
    }

    @Override
    public List<Order> searchOrdersByPrefix(String partialOrderId) {
        if (partialOrderId == null || partialOrderId.trim().isEmpty()) {
            throw new IllegalArgumentException("订单ID不能为空！");
        }

        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        // 使用 like 进行模糊匹配
        queryWrapper.like("orderid", partialOrderId);

        List<Order> orders = orderMapper.selectList(queryWrapper);

        return orders;
    }

    @Override
    public OrderVO getOrderDetails(String orderId) {
        try {
            // 查询订单基本信息
            Order order = orderMapper.selectById(orderId);
            if (order == null) {
                return null;
            }

            // 查询订单的最新状态
            OrderStatus latestStatus = orderStatusMapper.getLatestStatusByOrderId(orderId);
            String status = latestStatus != null ? latestStatus.getStatus() : "未知状态";

            // 查询订单项
            List<LineItemVO> lineItems = lineItemMapper.selectByOrderId(orderId);

            // 封装 OrderVO
            OrderVO orderVO = new OrderVO();
            orderVO.setOrderId(order.getOrderId());
            orderVO.setUserId(order.getUserId());
            orderVO.setTotalPrice(order.getTotalPrice());
            orderVO.setStatus(status); // 设置订单状态
            orderVO.setLineItems(lineItems);

            return orderVO;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Map<String, Object> convertOrderToMap(Order order) {
        if (order == null) {
            throw new IllegalArgumentException("订单对象不能为空！");
        }

        Map<String, Object> orderMap = new HashMap<>();

        orderMap.put("orderId", order.getOrderId());
        orderMap.put("userId", order.getUserId());
        orderMap.put("orderDate", order.getOrderDate());
        orderMap.put("shipAddr1", order.getShipAddr1());
        orderMap.put("shipAddr2", order.getShipAddr2());
        orderMap.put("shipCity", order.getShipCity());
        orderMap.put("shipState", order.getShipState());
        orderMap.put("shipZip", order.getShipZip());
        orderMap.put("shipCountry", order.getShipCountry());
        orderMap.put("billAddr1", order.getBillAddr1());
        orderMap.put("billAddr2", order.getBillAddr2());
        orderMap.put("billCity", order.getBillCity());
        orderMap.put("billState", order.getBillState());
        orderMap.put("billZip", order.getBillZip());
        orderMap.put("billCountry", order.getBillCountry());
        orderMap.put("courier", order.getCourier());
        orderMap.put("totalPrice", order.getTotalPrice());
        orderMap.put("billToFirstName", order.getBillToFirstName());
        orderMap.put("billToLastName", order.getBillToLastName());
        orderMap.put("shipToFirstName", order.getShipToFirstName());
        orderMap.put("shipToLastName", order.getShipToLastName());
        orderMap.put("creditCard", order.getCreditCard());
        orderMap.put("exprDate", order.getExprDate());
        orderMap.put("cardType", order.getCardType());
        orderMap.put("locale", order.getLocale());

        return orderMap;
    }

    public boolean deleteOrder(String orderId) {
        try {
            // 删除 orderstatus 表中的记录
            int rowsAffectedStatus = orderStatusMapper.deleteByOrderId(orderId);
            // 删除 orders 表中的记录
            int rowsAffectedOrder = orderMapper.deleteOrder(orderId);

            return rowsAffectedStatus > 0 && rowsAffectedOrder > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
