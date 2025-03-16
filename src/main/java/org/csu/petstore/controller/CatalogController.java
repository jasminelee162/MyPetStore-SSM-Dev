package org.csu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.LogService;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/catalog")
public class CatalogController {

    @Autowired
    private CatalogService catalogService;

    @Autowired
    private LogService logService;

    private static final Logger logger = LogManager.getLogger(CatalogController.class);



    @GetMapping("index")
    public String index(){
        return "catalog/main";
    }

    @GetMapping("viewCategory")
    public String viewCategory(String categoryId, Model model, HttpSession session){

        //异常处理，检测到获取账户信息空异常，则直接跳往登陆界面
        try {
            CategoryVO categoryVO = catalogService.getCategory(categoryId);
            session.setAttribute("category", categoryVO);
            model.addAttribute("category", categoryVO);
            //记录日志
            catalogService.setLog("category", session, categoryId);
        }catch (Exception e){
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

}
