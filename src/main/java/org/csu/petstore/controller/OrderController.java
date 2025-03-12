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
