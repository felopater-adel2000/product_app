package com.product.app.util;

import com.product.app.model.Product;
import com.product.app.model.ProductDetails;
import java.util.List;
import java.util.Optional;

public interface ProductService {
    List<Product> listProducts();
    Optional<Product> getProduct(Long id);
    Product addProduct(String name);
    ProductDetails upsertDetails(Long productId, ProductDetails details);
    void deleteProduct(Long id);
}
