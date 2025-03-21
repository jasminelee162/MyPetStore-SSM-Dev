package org.csu.petstore.controller;

import org.csu.petstore.entity.LineItem;
import org.csu.petstore.entity.Order;
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

@Controller
@RequestMapping("/adminOrder")
public class AdminOrderController {

    @Autowired
    private OrderService orderService;

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
    @ResponseBody
    public ResponseEntity<Map<String, String>> shipOrder(@RequestBody ShipOrderRequest request) {
        String orderId = request.getOrderId();
        boolean success = orderService.updateStatusToShipped(orderId);

        Map<String, String> response = new HashMap<>();
        if (success) {
            response.put("status", "success");
            response.put("message", "发货成功");
        } else {
            response.put("status", "error");
            response.put("message", "发货失败");
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

            Integer orderIntId = Integer.valueOf(orderId);

            boolean success = orderService.updateOrder(String.valueOf(orderIntId), userId, totalPrice, status, lineItems);

            if (success) {
                response.put("status", "success");
                response.put("message", "订单更新成功");
            } else {
                response.put("status", "error");
                response.put("message", "订单更新失败");
            }
        } catch (Exception e) {
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
    public ResponseEntity<Map<String, Object>> getOrderById(@RequestParam String orderId) {
        Map<String, Object> response = new HashMap<>();

        try {
            Order order = orderService.getOrderById(orderId);
            if (order != null) {
                response.put("status", "success");
                response.put("order", order);
            } else {
                response.put("status", "not_found");
                response.put("message", "订单未找到");
            }
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "服务器异常：" + e.getMessage());
        }

        return ResponseEntity.ok(response);
    }
}