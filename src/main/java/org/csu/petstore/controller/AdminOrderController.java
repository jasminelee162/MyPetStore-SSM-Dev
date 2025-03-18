package org.csu.petstore.controller;

import org.csu.petstore.entity.Order;
import org.csu.petstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
}