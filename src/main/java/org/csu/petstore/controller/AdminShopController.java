package org.csu.petstore.controller;

import org.csu.petstore.service.AdminShopService;
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
@RequestMapping("/adminShop")
public class AdminShopController {
    @Autowired
    private CatalogService catalogService;

    @Autowired
    private AdminShopService adminShopService;


    @GetMapping("/catalog")
    public String viewCatalog(Model model) {
        List<CategoryVO> categories = catalogService.getAllCategories();
        model.addAttribute("categories", categories);
        return "adminShop/catalog";
    }

    @GetMapping("/category")
    public String viewCategory(String categoryId, Model model) {
        CategoryVO categoryVO = catalogService.getCategory(categoryId);
        model.addAttribute("category", categoryVO);
        return "adminShop/category";
    }

    @GetMapping("/product")
    public String viewProduct(String productId, Model model) {
        ProductVO productVO = catalogService.getProduct(productId);
        model.addAttribute("product", productVO);
        return "adminShop/product";
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
        adminShopService.addCategory(categoryId, categoryName, description);
        return "redirect:/adminShop/catalog";
    }

    @PostMapping("/addProduct")
    public String addProduct(@RequestParam String categoryId,
                             @RequestParam String productId,
                             @RequestParam String productName,
                             @RequestParam String description) {
        // 调用服务层保存商品信息
        adminShopService.addProduct(categoryId, productId, productName, description);
        return "redirect:/adminShop/category?categoryId=" + categoryId;  // 返回商品类别页面
    }

    @PostMapping("/addItem")
    public String addItem(@RequestParam String productId,
                          @RequestParam String itemId,
                          @RequestParam String listPrice,
                          @RequestParam String quantity) {
        // 调用服务层保存商品项信息
        adminShopService.addItem(productId, itemId, listPrice, quantity);
        return "redirect:/adminShop/product?productId=" + productId;  // 返回商品详情页面
    }

    @PostMapping("/updateCategory")
    public String updateCategory(@RequestParam String categoryId,
                                 @RequestParam String categoryName,
                                 @RequestParam String description) {
        // 调用服务层更新类别信息
        adminShopService.updateCategory(categoryId, categoryName, description);
        return "redirect:/adminShop/catalog";
    }

    @PostMapping("/updateProduct")
    public String updateProduct(@RequestParam String categoryId,
                                @RequestParam String productId,
                                @RequestParam String productName,
                                @RequestParam String description) {
        // 调用服务层更新商品信息
        adminShopService.updateProduct(productId, productName, description);
        return "redirect:/adminShop/category?categoryId=" + categoryId;  // 返回该类别的商品页面
    }

    @PostMapping("/updateItem")
    public String updateItem(@RequestParam String productId,
                             @RequestParam String itemId,
                             @RequestParam String listPrice,
                             @RequestParam String quantity) {
        // 调用服务层更新商品项信息
        adminShopService.updateItem(itemId, listPrice, quantity);
        return "redirect:/adminShop/product?productId=" + productId;  // 返回商品详情页面
    }

}
