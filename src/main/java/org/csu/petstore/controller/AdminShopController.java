package org.csu.petstore.controller;

import jakarta.servlet.http.HttpSession;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemQuantity;
import org.csu.petstore.service.AdminShopService;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.FileStorageService;
import org.csu.petstore.service.LogService;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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

    @Autowired
    private FileStorageService fileStorageService;

    @Autowired
    private LogService logService;


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

    @GetMapping("/logAnalysis")
    public String viewUserLog(Model model) {
        Map<String, Object> logData = logService.analyzeLogs();
        model.addAttribute("topCategoryId", logData.get("topCategoryId"));
        model.addAttribute("topCategoryCount", logData.get("topCategoryCount"));

        model.addAttribute("topProductId", logData.get("topProductId"));
        model.addAttribute("topProductCount", logData.get("topProductCount"));

        model.addAttribute("topItemId", logData.get("topItemId"));
        model.addAttribute("topItemCount", logData.get("topItemCount"));

        model.addAttribute("totalOrderSubmissions", logData.get("totalOrderSubmissions"));
        return "adminShop/logAnalysis";
    }

    @PostMapping("/addCategory")
    public String addCategory(@RequestParam String categoryId,
                              @RequestParam String categoryName,
                              @RequestParam("description") MultipartFile file) throws IOException {
        String imageUrl = file.isEmpty() ? null : fileStorageService.saveFile(file, categoryId);
        System.out.println("imageUrl" + imageUrl);
        adminShopService.addCategory(categoryId, categoryName, imageUrl);
        return "redirect:/adminShop/catalog";
    }

    @PostMapping("/addProduct")
    public String addProduct(@RequestParam String categoryId,
                             @RequestParam String productId,
                             @RequestParam String productName,
                             @RequestParam("description") MultipartFile file) throws IOException {
        // 拼接 categoryId 和 productId 作为文件名
        String fileId = categoryId + "-" + productId;

        // 保存文件（不再传 type）
        String imageUrl = file.isEmpty() ? null : fileStorageService.saveFile(file, fileId);
        System.out.println("imageUrl: " + imageUrl);

        // 调用服务保存产品信息
        adminShopService.addProduct(categoryId, productId, productName, imageUrl);

        // 重定向回分类页面
        return "redirect:/adminShop/category?categoryId=" + categoryId;
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
                                 @RequestParam("description") MultipartFile categoryImage,
                                 @RequestParam("originalDescription") String originalDescription) {
        String imagePath = originalDescription;  // 默认使用原图片路径

        // 处理分类图片更新
        if (categoryImage != null && !categoryImage.isEmpty()) {
            try {
                imagePath = fileStorageService.updateImage(categoryImage, categoryId);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        adminShopService.updateCategory(categoryId, categoryName, imagePath);

        return "redirect:/adminShop/catalog";  // 返回分类管理页面
    }


    @PostMapping("/updateProduct")
    public String updateProduct(@RequestParam String categoryId,
                                @RequestParam String productId,
                                @RequestParam String productName,
                                @RequestParam("description")MultipartFile productImage,
                                @RequestParam("originalDescription") String originalDescription) {
        String imagePath = originalDescription;  // 默认使用原图片路径

        // 处理商品图片更新
        if (productImage != null && !productImage.isEmpty()) {
            try {
                imagePath = fileStorageService.updateImage(productImage, productId);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        adminShopService.updateProduct(productId, productName, imagePath);

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
    public String deleteCategory(@RequestParam String categoryId) throws IOException {
        fileStorageService.deleteImage(categoryId);
        adminShopService.deleteCategory(categoryId);
        return "redirect:/adminShop/catalog";  // 返回商品分类管理页面
    }

    @PostMapping("/deleteProduct")
    public String deleteProduct(@RequestParam String categoryId,
                                @RequestParam String productId) throws IOException {
        String id=categoryId+"-"+productId;
        fileStorageService.deleteImage(id);
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
