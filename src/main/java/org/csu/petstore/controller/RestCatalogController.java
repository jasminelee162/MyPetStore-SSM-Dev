package org.csu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.Product;
import org.csu.petstore.security.JwtUtil;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.LogService;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/catalog")
public class RestCatalogController {

    @Autowired
    private CatalogService catalogService;

    @Autowired
    private LogService logService;

    @Autowired
    private JwtUtil jwtUtil;

    private static final Logger logger = LogManager.getLogger(RestCatalogController.class);

    private boolean isAuthenticated(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        System.out.println(token);
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7);
            System.out.println(token);
            return jwtUtil.validateToken(token);
        }
        return false;
    }

    private String getUsername(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7);
            return jwtUtil.extractToken(token);
        }
        return null;
    }

    @GetMapping("/categories")
    public CommonResponse<List<CategoryVO>> getAllCategories() {
        List<CategoryVO> categories = catalogService.getAllCategories();
        return CommonResponse.createForSuccess(categories);
    }

    @GetMapping("/categories/{categoryId}")
    public CommonResponse<CategoryVO> getCategory(@PathVariable String categoryId, HttpServletRequest request) {
        CategoryVO categoryVO = catalogService.getCategory(categoryId);
        catalogService.setLog("category", categoryId, getUsername(request));
        return CommonResponse.createForSuccess(categoryVO);
    }

    @GetMapping("/categories/{categoryId}/products")
    public CommonResponse<List<Product>> getProductsByCategory(@PathVariable String categoryId, HttpServletRequest request) {
        if (!isAuthenticated(request)) {
            return CommonResponse.createForError("Unauthorized: Please login first.");
        }
        CategoryVO categoryVO = catalogService.getCategory(categoryId);
        catalogService.setLog("category", categoryId, getUsername(request));
        return CommonResponse.createForSuccess(categoryVO.getProductList());
    }

    @GetMapping("/products/{productId}")
    public CommonResponse<ProductVO> getProduct(@PathVariable String productId, HttpServletRequest request) {
        logRequest(request, "User viewed product: " + productId);
        ProductVO productVO = catalogService.getProduct(productId);
        catalogService.setLog("product", productId, getUsername(request));
        return CommonResponse.createForSuccess(productVO);
    }

    @GetMapping("/products/{productId}/items")
    public CommonResponse<List<Item>> getItemsByProduct(@PathVariable String productId, HttpServletRequest request) {
        ProductVO productVO = catalogService.getProduct(productId);
        return CommonResponse.createForSuccess(productVO.getItemList());
    }

    @GetMapping("/items/{itemId}")
    public CommonResponse<ItemVO> getItem(@PathVariable String itemId, HttpServletRequest request) {
        logRequest(request, "User viewed item: " + itemId);
        ItemVO itemVO = catalogService.getItem(itemId);
        catalogService.setLog("item", itemId, getUsername(request));
        return CommonResponse.createForSuccess(itemVO);
    }

    @GetMapping("/products/search")
    public CommonResponse<ProductVO> searchProduct(@RequestParam String keyword, HttpServletRequest request) {
        logRequest(request, "User searched product: " + keyword);
        List<Product> productList = catalogService.searchProductList(keyword);
        if (!productList.isEmpty()) {
            Product product = productList.get(0);
            catalogService.setLog("product", product.getProductId(), getUsername(request));
            ProductVO productVO = catalogService.getProduct(product.getProductId());
            return CommonResponse.createForSuccess(productVO);
        } else {
            return CommonResponse.createForError("No product found with keyword: " + keyword);
        }
    }

    private void logRequest(HttpServletRequest request, String message) {
        String ip = request.getRemoteAddr();
        String userAgent = request.getHeader("User-Agent");
        String logMessage = "[IP: " + ip + "] [User-Agent: " + userAgent + "] " + message;
        logger.info(logMessage);
        logService.logInfo(logMessage);
    }
}
