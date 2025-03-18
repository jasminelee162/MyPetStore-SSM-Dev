package org.csu.petstore.controller;

import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemQuantity;
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
import java.util.Map;
import java.util.stream.Collectors;

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

        // 获取商品项 ID 列表
        List<String> itemIds = productVO.getItemList().stream().map(Item::getItemId).collect(Collectors.toList());

        // 获取库存信息
        Map<String, Integer> itemQuantities = catalogService.getItemQuantities(itemIds);

        model.addAttribute("product", productVO);
        model.addAttribute("itemQuantities", itemQuantities);

        return "adminShop/product";
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
                          @RequestParam String unitCost,
                          @RequestParam String quantity) {
        // 调用服务层保存商品项信息
        adminShopService.addItem(productId, itemId, listPrice, unitCost, quantity);
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
                             @RequestParam String unitCost,
                             @RequestParam String quantity) {
        // 调用服务层更新商品项信息
        adminShopService.updateItem(itemId, listPrice, unitCost, quantity);
        return "redirect:/adminShop/product?productId=" + productId;  // 返回商品详情页面
    }

    @PostMapping("/deleteCategory")
    public String deleteCategory(@RequestParam String categoryId) {
        adminShopService.deleteCategory(categoryId);
        return "redirect:/adminShop/catalog";  // 返回商品分类管理页面
    }

    @PostMapping("/deleteProduct")
    public String deleteProduct(@RequestParam String categoryId, @RequestParam String productId) {
        adminShopService.deleteProduct(productId);
        return "redirect:/adminShop/category?categoryId=" + categoryId;  // 返回商品类别页面
    }

    @PostMapping("/deleteItem")
    public String deleteItem(@RequestParam String productId, @RequestParam String itemId) {
        adminShopService.deleteItem(itemId);
        return "redirect:/adminShop/product?productId=" + productId;  // 返回商品详情页面
    }


    //上下架
    @PostMapping("/updateItemStatus")
    public String updateItemStatus(@RequestParam String productId,
                                   @RequestParam String itemId,
                                   @RequestParam String status) {
        adminShopService.updateItemStatus(itemId, status);
        return "redirect:/adminShop/product?productId=" + productId;
    }

}
