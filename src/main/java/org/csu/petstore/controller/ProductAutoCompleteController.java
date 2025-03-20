package org.csu.petstore.controller;

import org.csu.petstore.entity.Product;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/productAuto")
public class ProductAutoCompleteController {

    @Autowired
    private CatalogService catalogService;

    @GetMapping("/search")
    public List<Product> autoComplete(@RequestParam("keyword") String keyword) {
        // 调用 Service 获取产品列表
        List<Product> productList = catalogService.searchProductList(keyword);


        System.out.println("keyword = " + keyword); // 看有没有打印
        System.out.println("productList = " + productList); // 看查没查出来

        // Spring Boot 自动把 List 转为 JSON 返回
        return productList;
    }
}
