package com.product.app.dao;

import com.product.app.model.Product;

import java.util.List;
import java.util.Optional;

public interface ProductDAO {
    List<Product> findAll();
    Optional<Product> findById(Long id);
    Product save(Product p);
    void deleteById(Long id);
}
