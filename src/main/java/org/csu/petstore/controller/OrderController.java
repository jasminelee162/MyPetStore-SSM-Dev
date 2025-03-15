package org.csu.petstore.controller;

import org.csu.petstore.entity.Account;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.service.impl.OrderServiceImpl;
import org.csu.petstore.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
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
    private CatalogService catalogService;

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

        // 将 OrderVO 对象添加到模型中
        model.addAttribute("order", orderVO);

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
    @GetMapping("viewOrder")
    public String viewOrder(String orderId, Model model) {
        OrderVO orderVO = new OrderVO();
        orderVO.setOrderId(orderId);
        model.addAttribute("order", orderVO);
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