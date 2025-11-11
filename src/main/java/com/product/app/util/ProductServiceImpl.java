package com.product.app.util;

import com.product.app.dao.ProductDAO;
import com.product.app.model.Product;
import com.product.app.model.ProductDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired private ProductDAO productDAO;

    @Override @Transactional(readOnly = true)
    public List<Product> listProducts() { return productDAO.findAll(); }

    @Override @Transactional(readOnly = true)
    public Optional<Product> getProduct(Long id) { return productDAO.findById(id); }

    @Override @Transactional
    public Product addProduct(String name) {
        Product p = Product.builder().name(name).build();
        return productDAO.save(p);
    }

    @Override @Transactional
    public ProductDetails upsertDetails(Long productId, ProductDetails incoming) {
        Product p = productDAO.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Product not found"));

        if (p.getDetails() == null) {
            p.setDetails(incoming);
        } else {
            ProductDetails d = p.getDetails();
            d.setName(incoming.getName());
            d.setExpirationDate(incoming.getExpirationDate());
            d.setManufacturer(incoming.getManufacturer());
            d.setPrice(incoming.getPrice());
            d.setAvailable(incoming.getAvailable());
        }
        productDAO.save(p);
        return p.getDetails();
    }

    @Override @Transactional
    public void deleteProduct(Long id) { productDAO.deleteById(id); }
}

