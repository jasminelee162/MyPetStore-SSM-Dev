package org.csu.petstore.service.impl;

import org.csu.petstore.entity.Product;
import org.csu.petstore.service.CatalogService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("CatalogService")
public class CatalogServiceImpl implements CatalogService {

    @Override
    public List<Product> getProductListByCategory(String categoryId) {
        return List.of();
    }
}
