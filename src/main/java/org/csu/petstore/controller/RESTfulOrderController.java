package org.csu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.LineItem;
import org.csu.petstore.entity.Order;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.CartService;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.csu.petstore.common.CommonResponse;

@RestController
@RequestMapping("/order")
public class RESTfulOrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;

    @Autowired
    private AccountService accountService;

    // 创建新订单
    @PostMapping("/newOrder")
    public CommonResponse<OrderVO> newOrder(@RequestParam String username,
                                            @RequestParam(required = false) String selectedItemsParam) {
        try {
            // 获取购物车
            CartVO cartVO = cartService.getCartByUsername(username);
            if (cartVO == null) {
                return CommonResponse.createForError("购物车为空！");
            }

            // 获取选中的商品 ID
            if (selectedItemsParam == null || selectedItemsParam.isEmpty()) {
                return CommonResponse.createForError("没有选择商品！");
            }

            String[] selectedItemIds = selectedItemsParam.split(",");
            List<CartItemVO> selectedItems = new ArrayList<>();

            // 创建一个新的购物车
            CartVO newCartVO = new CartVO();
            BigDecimal newSubTotal = BigDecimal.ZERO;

            // 根据选中的 ID 筛选商品，并添加到新的购物车
            for (String itemId : selectedItemIds) {
                CartItemVO cartItemVO = cartVO.getItemMap().get(itemId);
                if (cartItemVO != null) {
                    selectedItems.add(cartItemVO);
                    newCartVO.getItemList().add(cartItemVO);
                    newSubTotal = newSubTotal.add(cartItemVO.getTotalPrice());
                }
            }

            newCartVO.setSubTotal(newSubTotal);

            // 初始化订单
            AccountVO loginAccount = new AccountVO();  // 模拟获取Account信息
            loginAccount = accountService.getAccountByUsername(username);
            loginAccount.setUsername(username);
            OrderVO orderVO = orderService.initOrder(loginAccount, newCartVO);

            // 返回新订单信息
            return CommonResponse.createForSuccess(orderVO);
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResponse.createForError("创建订单失败！");
        }
    }

    // 确认订单
    @PostMapping("/confirmOrder")
    public CommonResponse<OrderVO> confirmOrder(@RequestBody OrderVO orderVO,
                                                @RequestParam String username,int orderId) {
        try {
            orderVO.setUserId(username);
            orderVO.setOrderDate(new java.sql.Date(System.currentTimeMillis()).toString());
            orderVO.setTimestamp(new java.sql.Timestamp(System.currentTimeMillis()));

            orderVO.setCourier("UPS");
            orderVO.setLocale("CA");
            orderVO.setStatus("P");

            // 保存订单到数据库
            orderService.insertOrder(orderVO,orderId);

            return CommonResponse.createForSuccess(orderVO);
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResponse.createForError("确认订单失败！");
        }
    }

    // 查看订单
    @GetMapping("/viewOrder/{orderId}")
    public CommonResponse<OrderVO> viewOrder(@PathVariable String orderId) {
        try {
            // 获取订单实体
            Order order = orderService.getOrderById(orderId);

            // 检查订单是否存在
            if (order == null) {
                return CommonResponse.createForError("订单不存在！");
            }

            // 手动将 Order 转换为 OrderVO
            OrderVO orderVO = new OrderVO();
            orderVO.setOrderId(order.getOrderId());
            orderVO.setUserId(order.getUserId());
            orderVO.setOrderDate(order.getOrderDate().toString()); // 假设 orderDate 是 Timestamp 类型
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
            orderVO.setTotalPrice(String.valueOf(order.getTotalPrice())); // 假设 totalPrice 是 double 类型，转换为 String
            orderVO.setBillToFirstName(order.getBillToFirstName());
            orderVO.setBillToLastName(order.getBillToLastName());
            orderVO.setShipToFirstName(order.getShipToFirstName());
            orderVO.setShipToLastName(order.getShipToLastName());
            orderVO.setCreditCard(order.getCreditCard());
            orderVO.setExprDate(order.getExprDate());
            orderVO.setCardType(order.getCardType());
            orderVO.setLocale(order.getLocale());
            orderVO.setStatus(null);
            orderVO.setTimestamp(null);

            // 注意：LineItem 需要单独转换，如果需要
            // List<LineItemVO> lineItemVOs = ...; // 这里需要根据需求转换每个 LineItem
            // orderVO.setLineItems(lineItemVOs);

            return CommonResponse.createForSuccess(orderVO);
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResponse.createForError("查看订单失败！");
        }
    }


    // 获取所有订单列表
    @GetMapping("/listOrders")
    public CommonResponse<List<OrderVO>> listOrders(@RequestParam String username) {
        try {
            // 获取指定用户的所有订单
            List<Order> orders = orderService.getOrdersByUsername(username);

            // 检查订单是否为空
            if (orders == null || orders.isEmpty()) {
                return CommonResponse.createForError("没有找到相关订单！");
            }

            // 将 Order 实体列表转换为 OrderVO 列表
            List<OrderVO> orderVOs = new ArrayList<>();
            for (Order order : orders) {
                // 手动转换 Order 为 OrderVO
                OrderVO orderVO = new OrderVO();
                orderVO.setOrderId(order.getOrderId());
                orderVO.setUserId(order.getUserId());
                orderVO.setOrderDate(order.getOrderDate().toString()); // 假设 orderDate 是 Timestamp 类型
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
                orderVO.setTotalPrice(String.valueOf(order.getTotalPrice())); // 假设 totalPrice 是 double 类型，转换为 String
                orderVO.setBillToFirstName(order.getBillToFirstName());
                orderVO.setBillToLastName(order.getBillToLastName());
                orderVO.setShipToFirstName(order.getShipToFirstName());
                orderVO.setShipToLastName(order.getShipToLastName());
                orderVO.setCreditCard(order.getCreditCard());
                orderVO.setExprDate(order.getExprDate());
                orderVO.setCardType(order.getCardType());
                orderVO.setLocale(order.getLocale());
                orderVO.setStatus(null);
                orderVO.setTimestamp(null);

                // 添加到 OrderVO 列表
                orderVOs.add(orderVO);
            }

            return CommonResponse.createForSuccess(orderVOs);
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResponse.createForError("获取订单列表失败！");
        }
    }

    //三大方法测试完成

}
