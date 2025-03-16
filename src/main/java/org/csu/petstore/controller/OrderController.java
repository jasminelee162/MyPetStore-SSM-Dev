package org.csu.petstore.controller;

import org.csu.petstore.entity.Account;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.LogService;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.service.impl.OrderServiceImpl;
import org.csu.petstore.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.pulsar.PulsarConnectionDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import jakarta.servlet.http.HttpSession;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private LogService logService;

    @GetMapping("index")
    public String index() {
        return "catalog/main";
    }

//    //新订单页面控制:还需获得账号查询信息、购物车session信息
//    @GetMapping("newOrderForm")
//    public String newOrderForm(String itemId, Model model) {
//        ItemVO itemVO = orderService.getItem(itemId);
//        model.addAttribute("order", itemVO);
//        return "order/newOrder";
//    }

    //订单确认页面控制：新订单request获得填写信息的Parameter，并放入session
    @PostMapping("/confirmOrder")
    public String confirmOrder(OrderVO orderVO, HttpSession session, Model model) {
        // 获取账户
        AccountVO loginAccount = (AccountVO) session.getAttribute("loginAccount");
        if (loginAccount == null) {
            return "redirect:/signonForm";
        }

        // 设置用户 ID 和订单日期
        orderVO.setUserId(loginAccount.getUsername());
        orderVO.setOrderDate(new java.sql.Date(System.currentTimeMillis()).toString());
        orderVO.setTimestamp(new java.sql.Timestamp(System.currentTimeMillis()));

        // 将 OrderVO 对象添加到模型中和session中
        model.addAttribute("order", orderVO);
        session.setAttribute("order", orderVO);


        // 跳转到订单确认页面
        return "order/confirmOrder";
    }

    @GetMapping("listOrders")
    public String listOrders(String orderId, Model model) {
        OrderVO orderVO = new OrderVO();
        orderVO.setOrderId(orderId);
        model.addAttribute("order", orderVO);
        return "order/listOrders";
    }

    //查看最终订单页面控制：session信息打印
    @PostMapping("viewOrder")
    public String viewOrder(HttpSession session, Model model) {
        // 从会话中获取当前订单对象
        OrderVO orderVO = (OrderVO) session.getAttribute("order");
        if (orderVO == null) {
            return "redirect:/error"; // 如果订单不存在重定向到错误页面
        }

//        // 将订单对象添加到模型中
//        model.addAttribute("order", orderVO);

        orderVO.setOrderId("9875");
        System.out.println("111111111111111111111111111111111111111111");
        System.out.println(orderVO.getOrderId());
        System.out.println(orderVO.getCourier());
        orderVO.setCourier("UIO");
        orderVO.setTotalPrice("123");
        orderVO.setLocale("ads");
        // 将订单保存到数据库
        boolean insertSuccess = orderService.insertOrder(orderVO);
        System.out.println("Order ID: " + orderVO.getOrderId());
        if (!insertSuccess) {
            return "redirect:/error"; // 如果保存失败，重定向到错误页面
        }

        // 获取购物车和选中的商品
        CartVO cartVO = (CartVO) session.getAttribute("cart");
        CartVO selectedCart = (CartVO) session.getAttribute("selectedCart");

        if (orderVO.getLineItems() == null || orderVO.getLineItems().isEmpty()) {
            List<LineItemVO> lineItems = new ArrayList<>();

            if (selectedCart != null) {
                List<CartItemVO> selectedItems = selectedCart.getItemList();

                int lineNumber = 1;
                for (CartItemVO cartItem : selectedItems) {
                    LineItemVO lineItem = new LineItemVO();
                    lineItem.setLineNumber(lineNumber++);
                    lineItem.setQuantity(cartItem.getQuantity());
                    lineItem.setUnitPrice(cartItem.getItem().getListPrice());
                    lineItem.setItem(cartItem.getItem());

                    lineItems.add(lineItem);

                    System.out.println("LineItem: itemId = " + cartItem.getItem().getItemId() +
                            ", quantity = " + cartItem.getQuantity() +
                            ", price = " + cartItem.getItem().getListPrice());
                }

                orderVO.setLineItems(lineItems);

                // 打印 lineItems 验证
                if (orderVO.getLineItems() != null) {
                    System.out.println("LineItems 数量: " + orderVO.getLineItems().size());

                    // 遍历 lineItems 给 item.attribute1 赋值
                    for (LineItemVO lineItem : orderVO.getLineItems()) {
                        ItemVO item = lineItem.getItem();
                        if (item != null) {
                            item.setAttribute1(item.getDescriptionText());
                            System.out.println("itemId = " + item.getItemId() + ", attribute1 = " + item.getAttribute1());
                        }
                    }
                }

            } else {
                System.out.println("selectedCart 为 null，无法初始化 lineItems！");
            }
        }

        if (orderVO.getLineItems() != null && !orderVO.getLineItems().isEmpty()) {
            BigDecimal totalPrice = BigDecimal.ZERO;

            for (LineItemVO lineItem : orderVO.getLineItems()) {
                BigDecimal unitPrice = lineItem.getUnitPrice();
                int quantity = lineItem.getQuantity();
                BigDecimal itemTotal = unitPrice.multiply(BigDecimal.valueOf(quantity));

                totalPrice = totalPrice.add(itemTotal);
            }

            orderVO.setTotalPrice(cartVO.getSubTotal().toString());

            System.out.println("计算出来的 TotalPrice = " + orderVO.getTotalPrice());
        } else {
            System.out.println("订单明细为空，无法计算总价");
        }

        // 打印 lineItems 验证
        if (orderVO.getLineItems() != null) {
            System.out.println("LineItems 数量: " + orderVO.getLineItems().size());
        }


        if (selectedCart != null) {
            List<CartItemVO> selectedItems = selectedCart.getItemList();

            // 遍历已选商品并从购物车中移除
            for (CartItemVO selectedItem : selectedItems) {
                cartVO.getItemMap().remove(selectedItem.getItem().getItemId());
                cartVO.getItemList().remove(selectedItem);
            }

            // 重新计算购物车的小计
            BigDecimal subTotal = BigDecimal.ZERO;
            for (CartItemVO cartItem : cartVO.getItemMap().values()) {
                subTotal = subTotal.add(cartItem.getTotalPrice());
            }
            cartVO.setSubTotal(subTotal);


            // 清空已购买的商品记录
            session.removeAttribute("selectedCart");
        }

        // 更新 session 中的购物车
        session.setAttribute("cart", cartVO);
        // 将订单对象添加到模型中
        model.addAttribute("order", orderVO);

        // 跳转到查看订单页面
        return "order/viewOrder";
    }

    @GetMapping("viewItem")
    public String viewItem(String itemId, Model model) {
        ItemVO itemVO = orderService.getItem(itemId);
        model.addAttribute("item", itemVO);
        return "catalog/item";
    }



    //新Order页面控制
    // 新订单页面控制
    @PostMapping("newOrder")
    public String newOrder(@RequestParam(value = "selectedItems", required = false) String selectedItemsParam,
                           HttpSession session,
                           Model model) {
        try {
            // 获取购物车
            CartVO cartVO = (CartVO) session.getAttribute("cart");
            if (cartVO == null) {
                cartVO = new CartVO();
                session.setAttribute("cart", cartVO);
            }

            // 检查用户是否登录
            AccountVO loginAccount = (AccountVO) session.getAttribute("loginAccount");
            if (loginAccount == null) {
                return "redirect:/signonForm";
            }

            // 获取选中的商品 ID
            if (selectedItemsParam == null || selectedItemsParam.isEmpty()) {
                return "redirect:/cartForm";
            }

            String[] selectedItemIds = selectedItemsParam.split(",");
            List<CartItemVO> selectedItems = new ArrayList<>();

            // 创建一个新的购物车
            CartVO newCartVO = new CartVO();

            // 根据选中的 ID 筛选商品，并添加到新的购物车
            BigDecimal newSubTotal = BigDecimal.ZERO;
            for (String itemId : selectedItemIds) {
                CartItemVO cartItemVO = cartVO.getItemMap().get(itemId);
                if (cartItemVO != null) {
                    selectedItems.add(cartItemVO);
                    newCartVO.getItemList().add(cartItemVO); // 添加商品到新的购物车
                    newSubTotal = newSubTotal.add(cartItemVO.getTotalPrice()); // 计算新的小计
                }
            }

            // 更新新的购物车小计
            newCartVO.setSubTotal(newSubTotal);

            // 设置新的购物车到 session 中
            session.setAttribute("selectedCart", newCartVO);

            // 初始化订单
            OrderVO orderVO = orderService.initOrder(loginAccount, newCartVO);

            // 设置信用卡类型
            session.setAttribute("creditCardTypes", orderVO.getCardType());

            // 将 OrderVO 对象添加到模型中，键为 "orderForm"
            model.addAttribute("orderForm", orderVO);

            System.out.println(orderVO.getBillAddr1());

            return "order/newOrder";
        } catch (Exception e) {
            // 记录异常信息
            e.printStackTrace();
            // 返回错误页面或重定向到错误页面
            return "redirect:/error";
        }
    }

    @GetMapping("shoppingForm")
    public String shippingForm(String orderId, Model model) {
        OrderVO orderVO = new OrderVO();
        orderVO.setOrderId(orderId);
        model.addAttribute("orderForm", orderVO);
        return "order/shoppingForm";
    }
}