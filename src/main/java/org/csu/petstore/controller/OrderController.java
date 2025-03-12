package org.csu.petstore.controller;

import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.service.impl.OrderServiceImpl;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.OrderVO;
import org.csu.petstore.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

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

    //新订单页面控制:还需获得账号查询信息、购物车session信息
    @GetMapping("newOrderForm")
    public String newOrderForm(String itemId, Model model) {
        ItemVO itemVO = orderService.getItem(itemId);
        model.addAttribute("order", itemVO);
        return "order/newOrder";
    }

    //订单确认页面控制：新订单request获得填写信息的Parameter，并放入session
    @GetMapping("confirmOrder")
    public String confirmOrder(String itemId, Model model) {
        ItemVO itemVO = orderService.getItem(itemId);
        model.addAttribute("order", itemVO);
        return "order/confirmOrder";
    }

    //查看最终订单页面控制：session信息打印
    @GetMapping("viewOrder")
    public String viewOrder(String itemId, Model model) {
        ItemVO itemVO = orderService.getItem(itemId);
        model.addAttribute("order", itemVO);
        return "order/viewOrder";
    }

    @GetMapping("viewItem")
    public String viewItem(String itemId, Model model) {
        ItemVO itemVO = orderService.getItem(itemId);
        model.addAttribute("item", itemVO);
        return "catalog/item";
    }
}