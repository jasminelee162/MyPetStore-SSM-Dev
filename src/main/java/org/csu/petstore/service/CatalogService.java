package org.csu.petstore.service;

import jakarta.servlet.http.HttpSession;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;

import org.csu.petstore.entity.Product;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

public interface CatalogService {

    public CategoryVO getCategory(String categoryId, HttpSession session);

    public ProductVO getProduct(String productId, HttpSession session);

    public ItemVO getItem(String itemId, HttpSession session);

    public void setLog(String type, HttpSession session, String typeId);
}
