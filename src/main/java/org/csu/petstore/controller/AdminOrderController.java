package org.csu.petstore.controller;

import org.csu.petstore.entity.LineItem;
import org.csu.petstore.entity.Order;
import org.csu.petstore.entity.OrderStatus;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/adminOrder")
public class AdminOrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private CatalogService catalogService;

    @GetMapping("/order")
    public String viewOrderList(Model model) {
        // 获取所有订单
        List<OrderVO> orders = orderService.getAllOrdersWithStatus();
        // 将订单数据传递到视图
        model.addAttribute("orders", orders);
        return "adminOrder/order";
    }

    @GetMapping("/search")
    @ResponseBody
    public Map<String, Object> searchOrders(@RequestParam String orderId) {
        Map<String, Object> response = new HashMap<>();

        // 参数校验
        if (orderId == null || orderId.trim().isEmpty()) {
            response.put("status", "error");
            response.put("message", "订单编号不能为空！");
            return response;
        }

        // 模糊查询订单（支持部分匹配！）
        // 前缀查询订单（只匹配以 orderId 开头的订单）
        List<Order> orderList = orderService.searchOrdersByPrefix(orderId.trim());

        if (orderList == null || orderList.isEmpty()) {
            response.put("status", "not_found");
            response.put("message", "未找到相关订单！");
        } else {
            response.put("status", "success");

            // 把 VO 列表转成 Map 列表，防止前端传多余数据
            List<Map<String, Object>> orders = orderList.stream()
                    .map(orderService::convertOrderToMap)
                    .toList();

            response.put("orders", orders);
        }

        return response;
    }

    @GetMapping("/all")
    @ResponseBody
    public Map<String, Object> getAllOrders() {
        Map<String, Object> result = new HashMap<>();

        try {
            List<OrderVO> orders = orderService.getAllOrdersWithStatus(); // 查询所有订单
            result.put("status", "success");
            result.put("orders", orders);
        } catch (Exception e) {
            result.put("status", "error");
            result.put("message", "查询所有订单失败！");
        }

        return result;
    }

    @PostMapping("/ship")
    public ResponseEntity<Map<String, String>> shipOrder(@RequestBody ShipOrderRequest request) {
        String orderId = request.getOrderId();

        // 获取订单信息
        String orderStatus = orderService.getOrderStatus(orderId);

        if (!Objects.equals(orderStatus, "P")) {
            // 如果订单不存在或订单状态不是 "P"，直接返回错误信息
            Map<String, String> response = new HashMap<>();
            response.put("status", "error");
            response.put("message", "错误操作：订单不存在或订单状态不为待发货（P）");
            return ResponseEntity.ok(response);
        }

        // 如果订单状态为 "P"，继续执行发货逻辑
        boolean success = orderService.updateStatusToShipped(orderId);
        List<LineItem> lineItems = orderService.getLineItemsByOrderId(orderId);

        Map<String, String> response = new HashMap<>();
        if (success) {
            try {
                for (LineItem item : lineItems) {
                    String itemId = item.getItemid();
                    int quantity = item.getQuantity();

                    // 调用 CatalogService 减少库存
                    boolean inventoryUpdated = catalogService.decreaseInventory(itemId, quantity);
                    if (!inventoryUpdated) {
                        // 如果库存更新失败，回滚订单状态并返回错误信息
                        orderService.updateStatusToPending(orderId);
                        response.put("status", "error");
                        response.put("message", "发货失败：库存不足或库存更新失败");
                        return ResponseEntity.ok(response);
                    }
                }

                response.put("status", "success");
                response.put("message", "发货成功，库存已更新");
            } catch (Exception e) {
                // 如果发生异常，回滚订单状态并返回错误信息
                orderService.updateStatusToPending(orderId);
                response.put("status", "error");
                response.put("message", "发货失败：" + e.getMessage());
            }
        } else {
            response.put("status", "error");
            response.put("message", "发货失败：订单状态更新失败");
        }

        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/delete")
    @ResponseBody
    public ResponseEntity<Map<String, String>> deleteOrder(@RequestBody DeleteOrderRequest request) {
        String orderId = request.getOrderId();
        boolean success = orderService.deleteOrder(orderId);

        Map<String, String> response = new HashMap<>();
        if (success) {
            response.put("status", "success");
            response.put("message", "删除成功");
        } else {
            response.put("status", "error");
            response.put("message", "删除失败");
        }

        return ResponseEntity.ok(response);
    }

    public static class ShipOrderRequest {
        private String orderId;

        public String getOrderId() {
            return orderId;
        }

        public void setOrderId(String orderId) {
            this.orderId = orderId;
        }
    }

    public static class DeleteOrderRequest {
        private String orderId;

        public String getOrderId() {
            return orderId;
        }

        public void setOrderId(String orderId) {
            this.orderId = orderId;
        }
    }

    @GetMapping("/detail")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getOrderDetails(@RequestParam String orderId) {
        Map<String, Object> response = new HashMap<>();

        try {
            OrderVO order = orderService.getOrderDetails(orderId);
            if (order != null) {
                response.put("status", "success");
                response.put("order", order);
            } else {
                response.put("status", "not_found");
                response.put("message", "未找到订单详情！");
            }
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "获取订单详情失败！");
        }

        return ResponseEntity.ok(response);
    }

    @PutMapping("/update")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateOrder(@RequestBody UpdateOrderRequest request) {
        Map<String, Object> response = new HashMap<>();

        try {
            String orderId = request.getOrderId();
            String userId = request.getUserId();
            String totalPrice = request.getTotalPrice();
            String status = request.getStatus();
            List<LineItem> lineItems = request.getLineItems();

            System.out.println("接收到的 orderId = " + orderId);
            System.out.println("接收到的 userId = " + userId);
            System.out.println("接收到的 totalPrice = " + totalPrice);
            System.out.println("接收到的 status = " + status);
            System.out.println("接收到的 lineItems = " + lineItems);

            Integer orderIntId = Integer.valueOf(orderId);

            boolean success = orderService.updateOrder(orderId, userId, totalPrice, status, lineItems);

            if (success) {
                response.put("status", "success");
                response.put("message", "订单更新成功");
            } else {
                response.put("status", "error"); // ✅ 改了！
                response.put("message", "订单更新失败");
            }
        } catch (Exception e) {
            e.printStackTrace(); // ✅ 打印异常信息
            response.put("status", "error");
            response.put("message", "服务器异常：" + e.getMessage());
        }

        return ResponseEntity.ok(response);
    }

    public static class UpdateOrderRequest {
        private String orderId;
        private String userId;
        private String totalPrice;
        private String status;
        private List<LineItem> lineItems;

        // Getters and Setters
        public String getOrderId() {
            return orderId;
        }

        public void setOrderId(String orderId) {
            this.orderId = orderId;
        }

        public String getUserId() {
            return userId;
        }

        public void setUserId(String userId) {
            this.userId = userId;
        }

        public String getTotalPrice() {
            return totalPrice;
        }

        public void setTotalPrice(String totalPrice) {
            this.totalPrice = totalPrice;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public List<LineItem> getLineItems() {
            return lineItems;
        }

        public void setLineItems(List<LineItem> lineItems) {
            this.lineItems = lineItems;
        }
    }

    @GetMapping("/getOrderById")
    @ResponseBody
    public Map<String, Object> getOrderById(@RequestParam String orderId) {
        Map<String, Object> response = new HashMap<>();

        try {
            // 1. 获取订单主信息
            Order order = orderService.getOrderById(orderId);
            //OrderStatus orderStatus = orderService.

            if (order != null) {
                // 2. 获取订单明细（子项）
                List<LineItem> lineItems = orderService.getLineItemsByOrderId(orderId);


                // 3. 构建返回数据
                Map<String, Object> orderData = new HashMap<>();
                orderData.put("orderId", order.getOrderId());
                orderData.put("userId", order.getUserId());
                orderData.put("totalPrice", order.getTotalPrice());
                orderData.put("status", "");
                orderData.put("lineItems", lineItems);  // 加入子订单明细

                // 4. 封装统一响应结构
                response.put("status", "success");
                response.put("order", orderData);


            } else {
                response.put("status", "not_found");
                response.put("message", "订单未找到");
            }

        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "服务器异常：" + e.getMessage());
        }

        return response;
    }

}