package org.csu.petstore.service;

import org.csu.petstore.entity.Product;

import java.util.List;

public interface CatalogService {

    public List<Product> getProductListByCategory(String categoryId);
}
