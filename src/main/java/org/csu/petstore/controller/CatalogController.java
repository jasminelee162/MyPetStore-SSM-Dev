package org.csu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.Product;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.CatalogService;
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
import org.springframework.web.bind.annotation.SessionAttribute;

import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Controller
@RequestMapping("/catalog")
public class CatalogController {

    @Autowired
    private CatalogService catalogService;

    @Autowired
    private LogService logService;

    @Autowired
    private AccountService accountService;

    private static final Logger logger = LogManager.getLogger(CatalogController.class);


    @GetMapping("index")
    public String index(Model model) {
        List<CategoryVO> categories = catalogService.getAllCategories();
        model.addAttribute("categories", categories);
        return "catalog/main";
    }

    @GetMapping("adminIndex")
    public String adminIndex(HttpSession session) {
        Account account = (Account) session.getAttribute("loginAccount");
        if (account == null){
            return "account/signOnForm";
        }

        return "admin/main";
    }

    @GetMapping("viewCategory")
    public String viewCategory(String categoryId, Model model, HttpSession session) {

        //异常处理，检测到获取账户信息空异常，则直接跳往登陆界面
        try {
            CategoryVO categoryVO = catalogService.getCategory(categoryId);
            session.setAttribute("category", categoryVO);
            model.addAttribute("category", categoryVO);
            //记录日志
            catalogService.setLog("category", session, categoryId);
        } catch (Exception e) {
            return "account/signOnForm";
        }
        return "catalog/category";
    }

    @GetMapping("viewProduct")
    public String viewProduct(String productId, Model model, HttpSession session, HttpServletRequest request) {
        logRequest(request, "User viewed product: " + productId);
        ProductVO productVO = catalogService.getProduct(productId);
        session.setAttribute("product", productVO);
        model.addAttribute("product", productVO);


        // 获取商品的所有项
        List<Item> itemList = productVO.getItemList();

        // 获取所有项的ID
        List<String> itemIds = itemList.stream()
                .map(Item::getItemId)
                .collect(Collectors.toList());

        // 获取每个商品的库存数量
        Map<String, Integer> itemQuantities = catalogService.getItemQuantities(itemIds);
        model.addAttribute("itemQuantities", itemQuantities); // 传递库存数据

        //记录日志
        catalogService.setLog("product", session, productId);

        return "catalog/product";
    }

    @GetMapping("viewItem")
    public String viewItem(String itemId, Model model, HttpSession session, HttpServletRequest request) {
        logRequest(request, "User viewed item: " + itemId);
        ItemVO itemVO = catalogService.getItem(itemId);
        session.setAttribute("item", itemVO);
        model.addAttribute("item", itemVO);

        //记录日志
        catalogService.setLog("item", session, itemId);

        return "catalog/item";
    }

    private void logRequest(HttpServletRequest request, String message) {
        String ip = request.getRemoteAddr();  // 获取用户 IP
        String userAgent = request.getHeader("User-Agent");  // 获取 User-Agent
        String logMessage = "[IP: " + ip + "] [User-Agent: " + userAgent + "] " + message;

        logger.info(logMessage);
        logService.logInfo(logMessage);
    }

    @PostMapping("/searchProducts")
    public String searchProduct(@RequestParam("keyword") String keyword, HttpSession session, HttpServletRequest request) {
        // 日志
        logRequest(request, "User searched product: " + keyword);

        // 搜索产品列表
        List<Product> productList = catalogService.searchProductList(keyword);

        if (!productList.isEmpty()) {
            Product product = productList.get(0); // 取第一个结果
            String productId = product.getProductId();
            String categoryId = product.getCategoryId();

            // 获取分类并存入 session
            CategoryVO categoryVO = catalogService.getCategory(categoryId);
            session.setAttribute("category", categoryVO);

            // 记录日志
            catalogService.setLog("product", session, productId);

            // 重定向到产品页面
            return "redirect:/catalog/viewProduct?productId=" + productId;
//            return "/catalog/searchProduct";
        } else {
            // 没搜索到，跳主页面（或者跳搜索失败页）
            return "redirect:/catalog/index";
        }
    }




}
