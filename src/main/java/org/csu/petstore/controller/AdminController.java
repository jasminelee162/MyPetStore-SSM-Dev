package org.csu.petstore.controller;

import org.csu.petstore.service.AdminService;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private CatalogService catalogService;

    @Autowired
    private AdminService adminService;

    @GetMapping("/index")
    public String index() {
        return "admin/index";
    }

    @GetMapping("/catalog")
    public String viewCatalog(Model model) {
        List<CategoryVO> categories = catalogService.getAllCategories();
        model.addAttribute("categories", categories);
        return "admin/catalog";
    }

    @GetMapping("/category")
    public String viewCategory(String categoryId, Model model) {
        CategoryVO categoryVO = catalogService.getCategory(categoryId);
        model.addAttribute("category", categoryVO);
        return "admin/category";
    }

    @GetMapping("/product")
    public String viewProduct(String productId, Model model) {
        ProductVO productVO = catalogService.getProduct(productId);
        model.addAttribute("product", productVO);
        return "admin/product";
    }

    @GetMapping("/item")
    public String viewItem(String itemId, Model model) {
        ItemVO itemVO = catalogService.getItem(itemId);
        model.addAttribute("item", itemVO);
        return "catalog/item";
    }

    @PostMapping("/addCategory")
    public String addCategory(@RequestParam String categoryId,
                               @RequestParam String categoryName,
                               @RequestParam String description) {
        // 调用服务层保存类别信息
        adminService.addCategory(categoryId, categoryName, description);
        return "redirect:/admin/catalog";
    }

    @PostMapping("/addProduct")
    public String addProduct(@RequestParam String categoryId,
                              @RequestParam String productId,
                              @RequestParam String productName,
                              @RequestParam String description) {
        // 调用服务层保存商品信息
        adminService.addProduct(categoryId, productId, productName, description);
        return "redirect:/admin/category?categoryId=" + categoryId;  // 返回商品类别页面
    }

    @PostMapping("/addItem")
    public String addItem(@RequestParam String productId,
                           @RequestParam String itemId,
                           @RequestParam String listPrice,
                           @RequestParam String quantity) {
        // 调用服务层保存商品项信息
        adminService.addItem(productId, itemId, listPrice, quantity);
        return "redirect:/admin/product?productId=" + productId;  // 返回商品详情页面
    }


}
