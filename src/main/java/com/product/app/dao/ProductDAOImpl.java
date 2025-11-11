package com.product.app.dao;

import com.product.app.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Autowired private SessionFactory sessionFactory;

    private Session session() { return sessionFactory.getCurrentSession(); }

    @Override @Transactional(readOnly = true)
    public List<Product> findAll() {
        return session().createQuery("from Product p order by p.id", Product.class).list();
    }

    @Override @Transactional(readOnly = true)
    public Optional<Product> findById(Long id) {
        Product p = session().get(Product.class, id);
        return Optional.ofNullable(p);
    }

    @Override @Transactional
    public Product save(Product p) {
        session().saveOrUpdate(p);
        return p;
    }

    @Override @Transactional
    public void deleteById(Long id) {
        Product p = session().get(Product.class, id);
        if (p != null) session().delete(p);
    }
}
