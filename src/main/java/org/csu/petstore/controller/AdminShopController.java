package org.csu.petstore.controller;

import com.alibaba.fastjson.JSON;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.csu.petstore.entity.*;
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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
    public void addCategory(@RequestParam String categoryId,
                            @RequestParam String categoryName,
                            @RequestParam("description") MultipartFile file,
                            HttpServletResponse response) throws IOException {
        // 设置响应格式
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            // 处理文件上传
            String imageUrl = file.isEmpty() ? null : fileStorageService.saveFile(file, categoryId);
            adminShopService.addCategory(categoryId, categoryName, imageUrl);

            // 封装 JSON 数据
            CategoryDTO responseDTO = new CategoryDTO("success", "分类添加成功", categoryId, categoryName, imageUrl);
            String jsonResult = JSON.toJSONString(responseDTO);

            // 输出 JSON 数据
            out.println(jsonResult);
        } catch (IOException e) {
            // 发生异常时返回错误信息
            CategoryDTO responseDTO = new CategoryDTO("error", "文件上传失败", null, null, null);
            String jsonResult = JSON.toJSONString(responseDTO);

            out.println(jsonResult);
        } finally {
            out.flush();
            out.close();
        }
    }


    @PostMapping("/addProduct")
    public void addProduct(@RequestParam String categoryId,
                           @RequestParam String productId,
                           @RequestParam String productName,
                           @RequestParam("description") MultipartFile file,
                           HttpServletResponse response) throws IOException {
        // 设置响应格式
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            // 拼接 categoryId 和 productId 作为文件名
            String fileId = categoryId + "-" + productId;

            // 处理文件上传
            String imageUrl = file.isEmpty() ? null : fileStorageService.saveFile(file, fileId);

            // 调用服务保存商品信息
            adminShopService.addProduct(categoryId, productId, productName, imageUrl);

            // 封装 JSON 数据
            ProductDTO responseDTO = new ProductDTO("success", "商品添加成功", categoryId, productId, productName, imageUrl);
            String jsonResult = JSON.toJSONString(responseDTO);

            // 输出 JSON 数据
            out.println(jsonResult);
        } catch (IOException e) {
            // 发生异常时返回错误信息
            ProductDTO responseDTO = new ProductDTO("error", "文件上传失败", null, null, null, null);
            String jsonResult = JSON.toJSONString(responseDTO);
            out.println(jsonResult);
        } finally {
            out.flush();
            out.close();
        }
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
    public void updateCategory(@RequestParam String categoryId,
                               @RequestParam String categoryName,
                               @RequestParam("description") MultipartFile categoryImage,
                               @RequestParam("originalDescription") String originalDescription,
                               HttpServletResponse response) throws IOException {
        // 设置响应格式
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            String imagePath = originalDescription;  // 默认使用原图片路径

            // 处理分类图片更新
            if (categoryImage != null && !categoryImage.isEmpty()) {
                imagePath = fileStorageService.updateImage(categoryImage, categoryId);
            }

            adminShopService.updateCategory(categoryId, categoryName, imagePath);

            // 封装 JSON 数据
            CategoryDTO responseDTO = new CategoryDTO("success", "分类更新成功", categoryId, categoryName, imagePath);
            String jsonResult = JSON.toJSONString(responseDTO);

            // 输出 JSON 数据
            out.println(jsonResult);
        } catch (IOException e) {
            CategoryDTO responseDTO = new CategoryDTO("error", "文件上传失败", null, null, null);
            String jsonResult = JSON.toJSONString(responseDTO);
            out.println(jsonResult);
        } finally {
            out.flush();
            out.close();
        }
    }


    @PostMapping("/updateProduct")
    public void updateProduct(@RequestParam String categoryId,
                              @RequestParam String productId,
                              @RequestParam String productName,
                              @RequestParam("description") MultipartFile productImage,
                              @RequestParam("originalDescription") String originalDescription,
                              HttpServletResponse response) throws IOException {
        // 设置响应格式
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            String imagePath = originalDescription;  // 默认使用原图片路径

            // 处理商品图片更新
            if (productImage != null && !productImage.isEmpty()) {
                imagePath = fileStorageService.updateImage(productImage, productId);
            }

            adminShopService.updateProduct(productId, productName, imagePath);

            // 封装 JSON 数据
            ProductDTO responseDTO = new ProductDTO("success", "商品更新成功",categoryId, productId, productName, imagePath);
            String jsonResult = JSON.toJSONString(responseDTO);

            // 输出 JSON 数据
            out.println(jsonResult);
        } catch (IOException e) {
            // 发生异常时返回错误信息
            ProductDTO responseDTO = new ProductDTO("error", "文件上传失败", null,null, null, null);
            String jsonResult = JSON.toJSONString(responseDTO);
            out.println(jsonResult);
        } finally {
            out.flush();
            out.close();
        }
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
    public void deleteCategory(@RequestParam String categoryId, HttpServletResponse response) throws IOException {
        // 设置响应格式
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            // 调用删除服务，删除分类和分类图片
            fileStorageService.deleteImage(categoryId);  // 删除分类的图片
            adminShopService.deleteCategory(categoryId);  // 删除分类

            // 封装 JSON 数据
            CategoryDTO responseDTO = new CategoryDTO("success", "分类删除成功", categoryId, null, null);
            String jsonResult = JSON.toJSONString(responseDTO);

            // 输出 JSON 数据
            out.println(jsonResult);
        } catch (Exception e) {
            CategoryDTO responseDTO = new CategoryDTO("error", "删除失败: " + e.getMessage(), null, null, null);
            String jsonResult = JSON.toJSONString(responseDTO);
            out.println(jsonResult);
        } finally {
            out.flush();
            out.close();
        }
    }

    @PostMapping("/deleteProduct")
    public void deleteProduct(@RequestParam String categoryId,
                              @RequestParam String productId,
                              HttpServletResponse response) throws IOException {
        // 设置响应格式
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            String id = categoryId + "-" + productId;
            fileStorageService.deleteImage(id);  // 删除商品图片
            adminShopService.deleteProduct(productId);  // 删除商品

            System.out.println("jjhjsshadshadasd");
            // 封装 JSON 数据
            ProductDTO responseDTO = new ProductDTO("success", "商品删除成功",categoryId, productId, null, null);
            String jsonResult = JSON.toJSONString(responseDTO);

            // 输出 JSON 数据
            out.println(jsonResult);
        } catch (Exception e) {
            System.out.println("errrrrr");
            // 发生异常时返回错误信息
            ProductDTO responseDTO = new ProductDTO("error", "删除失败: " + e.getMessage(), null,null, null, null);
            String jsonResult = JSON.toJSONString(responseDTO);
            out.println(jsonResult);
        } finally {
            out.flush();
            out.close();
        }
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
