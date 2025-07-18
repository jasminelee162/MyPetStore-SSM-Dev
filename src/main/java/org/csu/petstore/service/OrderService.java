    package org.csu.petstore.service;
    
    import org.csu.petstore.entity.Account;
    import org.csu.petstore.entity.LineItem;
    import org.csu.petstore.entity.Order;
    import org.csu.petstore.vo.*;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.csu.petstore.entity.OrderStatus;
    
    import java.util.List;
    import java.util.Map;
    
    public interface OrderService {
    
        public ItemVO getItem(String itemId);
        public OrderVO getProduct(String product);
        public SequenceVO getSequence(String sequence);
        public LineItemVO getLineItem(String lineItem);
    
    
        //Order数据库操作方法定义
        List<Order> getOrdersByUsername(String username);
    
        OrderVO getOrder(int orderId);
    
        boolean insertOrder(OrderVO orderVO);

        boolean updateOrder(OrderVO order);
    
        boolean insertOrderStatus(OrderStatusVO orderStatus);
    
        boolean updateStatusToShipped(String orderId);

        String getOrderStatus(String orderId);
    
        //获得所有订单
        List<Order> getAllOrders();
    
        List<OrderVO> getAllOrdersWithStatus();

    
        boolean updateOrder(String orderId, String userId, String totalPrice, String status, List<LineItem> lineItems);
    
        Order getOrderById(String orderId);

        //库存不足，回滚
        boolean updateStatusToPending(String orderId);
    
        //非数据库方法定义
    
        //Order初始化，根据loginAccount和cart
        OrderVO initOrder(AccountVO accountVO, CartVO cartvo);
    
        int getNextId(String name);
        Order findOrderById(Integer orderId);
    
        //List<Order> searchOrdersByOrderId(String orderId);
        public List<Order> searchOrdersByPrefix(String orderIdPrefix);

        OrderVO getOrderDetails(String orderId);
    
        Map<String, Object> convertOrderToMap(Order order);
    
        boolean deleteOrder(String orderId);
    
        public List<LineItem> getLineItemsByOrderId(String orderId);
    }

