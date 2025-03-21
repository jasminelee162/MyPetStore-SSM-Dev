package org.csu.petstore.controller;

import org.csu.petstore.entity.Order;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        List<Order> orders = orderService.getAllOrders();
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

//        List<Order> orderList = orderService.searchOrdersByOrderId(orderId.trim());

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
            List<Order> orders = orderService.getAllOrders(); // 查询所有订单
            result.put("status", "success");
            result.put("orders", orders);
        } catch (Exception e) {
            result.put("status", "error");
            result.put("message", "查询所有订单失败！");
        }

        return result;
    }

}



